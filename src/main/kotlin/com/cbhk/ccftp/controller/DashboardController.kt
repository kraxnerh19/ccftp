package com.cbhk.ccftp.controller

import com.cbhk.ccftp.entity.ChartData
import com.cbhk.ccftp.entity.CloudData
import com.cbhk.ccftp.entity.CloudDataInternal
import com.cbhk.ccftp.entity.SoftwareUsed
import com.cbhk.ccftp.repository.CloudDataInternalRepository
import com.cbhk.ccftp.repository.CloudDataRepository
import com.cbhk.ccftp.repository.SoftwareUsedRepository
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import org.apache.commons.io.IOUtils
import org.springframework.core.io.ClassPathResource
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.client.RestClientException
import org.springframework.web.client.RestTemplate
import java.net.ConnectException
import java.nio.charset.StandardCharsets
import java.text.SimpleDateFormat
import java.util.*
import javax.servlet.http.HttpServletRequest


@Controller
class DashboardController(
    val CloudDataRepository: CloudDataRepository,
    val CloudDataInternalRepository: CloudDataInternalRepository,
    val SoftwareUsedRepository: SoftwareUsedRepository
) {
    @RequestMapping(path = ["/", "/dashboard"], method = [RequestMethod.GET])
    fun listDashboard(model: Model): String {
        model["CloudDataInternal"] = CloudDataInternalRepository.findAll()
        model["SoftwareUsed"] = SoftwareUsedRepository.findAll()
        return "dashboard"
    }

    @RequestMapping(path = ["/chartdata"], method = [RequestMethod.GET])
    @ResponseBody
    fun getChartData(
        request: HttpServletRequest
    ): List<ChartData?>? {
        val cloudData = CloudDataInternalRepository.findAll()
        val chartData = mutableListOf<ChartData>()
        for (data in cloudData) {
            var usedSoftware = SoftwareUsedRepository.findByTimestamp(data.timestamp)?.softwareUsedName.toString()
            if (usedSoftware === "") {usedSoftware = "undefinedSoftware"}
            chartData.add(ChartData(data.id,data.timestamp,data.cloudProvider,data.kilowattHours,data.co2e,data.cost,usedSoftware))
        }
        return chartData
    }

    fun getFromCCFAPI(): String? {
        try {
            val time = Calendar.getInstance().time
            val formatter = SimpleDateFormat("yyyy-MM-dd")
            val currentDate = formatter.format(time)
            val startDate = "2000-01-01"

            val uri = "http://localhost:4000/api/footprint?start=$startDate&end=$currentDate"
            val restTemplate = RestTemplate()
            return restTemplate.getForObject(uri, String::class.java)
        } catch (e: RestClientException) {
            return ""
        }
    }

    @RequestMapping(path = [ "/refresh"], method = [RequestMethod.GET])
    fun refreshData(model: Model): String {
        val staticDataResource = ClassPathResource("/static/json/data.json")
        val gson = Gson()
        val typeToken = object : TypeToken<MutableList<CloudData>>() {}.type

        val apiData = getFromCCFAPI()
        val json = gson.fromJson<List<CloudData>>(apiData, typeToken)

        if (!json.isNullOrEmpty()) {
            for (cloudData in json.toList()) {
                val timestamp = cloudData.timestamp ?: ""
                val dataSetsWithTimestamp = CloudDataInternalRepository.findAllByTimestamp(timestamp)
                if (dataSetsWithTimestamp.isNullOrEmpty()) {
                    SoftwareUsedRepository.save(SoftwareUsed(null,timestamp,""))
                } else {
                    //If data already exist, clear existing and refresh with new data
                    dataSetsWithTimestamp.forEach {
                        CloudDataInternalRepository.delete(it)
                    }
                }
                for (estimate in cloudData.serviceEstimates) {
                    val cloudProvider = estimate.cloudProvider ?: ""
                    val cloudDataInternalCurr = CloudDataInternalRepository.findAllByTimestampAndCloudProvider(timestamp, cloudProvider)
                    if (cloudDataInternalCurr != null) {
                        cloudDataInternalCurr.kilowattHours = cloudDataInternalCurr.kilowattHours?.plus(estimate.kilowattHours!!)
                        cloudDataInternalCurr.co2e = cloudDataInternalCurr.co2e?.plus(estimate.co2e!!)
                        cloudDataInternalCurr.cost = cloudDataInternalCurr.cost?.plus(estimate.cost!!)
                        CloudDataInternalRepository.save(cloudDataInternalCurr)
                    } else {
                        CloudDataInternalRepository.save(CloudDataInternal(null, timestamp, cloudProvider, estimate.kilowattHours, estimate.co2e, estimate.cost))
                    }
                }
            }
        }
        return listDashboard(model)
    }
}