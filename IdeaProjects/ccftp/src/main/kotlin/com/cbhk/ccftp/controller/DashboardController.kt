package com.cbhk.ccftp.controller

import com.cbhk.ccftp.entity.CloudData
import com.cbhk.ccftp.entity.CloudDataInternal
import com.cbhk.ccftp.entity.SoftwareUsed
import com.cbhk.ccftp.repository.CloudDataInternalRepository
import com.cbhk.ccftp.repository.CloudDataRepository
import com.cbhk.ccftp.repository.SoftwareUsedRepository
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import org.springframework.core.io.ClassPathResource
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.apache.commons.io.IOUtils
import org.springframework.ui.set
import java.nio.charset.StandardCharsets


@Controller
class DashboardController(
    val CloudDataRepository: CloudDataRepository,
    val CloudDataInternalRepository: CloudDataInternalRepository,
    val SoftwareUsedRepository: SoftwareUsedRepository
) {
    @RequestMapping(path = ["/", "/dashboard"], method = [RequestMethod.GET])
    fun listDashboard(model: Model): String {
        val staticDataResource = ClassPathResource("/static/json/data.json")
        val staticDataString = IOUtils.toString(staticDataResource.inputStream, StandardCharsets.UTF_8.name())

        val gson = Gson()
        val typeToken = object : TypeToken<MutableList<CloudData>>() {}.type
        val json = gson.fromJson<List<CloudData>>(staticDataString, typeToken)

        for (cloudData in json.toList()) {
            val timestamp = cloudData.timestamp ?: ""
            val dataSetsWithTimestamp = CloudDataInternalRepository.findAllByTimestamp(timestamp)
            if (dataSetsWithTimestamp.isNullOrEmpty()) {
                SoftwareUsedRepository.save(SoftwareUsed(null,timestamp,""))
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
        model["CloudDataInternal"] = CloudDataInternalRepository.findAll()
        model["SoftwareUsed"] = SoftwareUsedRepository.findAll()
        return "dashboard"
    }
}