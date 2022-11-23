package com.cbhk.ccftp.controller

import com.cbhk.ccftp.CloudData
import com.cbhk.ccftp.repository.CloudDataRepository
import com.google.gson.Gson
import org.springframework.core.io.ClassPathResource
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.util.ResourceUtils
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import java.io.File
import org.apache.commons.io.IOUtils
import java.nio.file.Path
import java.nio.charset.StandardCharsets
import org.json.JSONObject


@Controller
class DashboardController(
    val CloudDataRepository: CloudDataRepository
) {
    @RequestMapping(path = ["/", "/dashboard"], method = [RequestMethod.GET])
    fun listDashboard(model: Model): String {
        val staticDataResource = ClassPathResource("/static/json/data.json")
        val staticDataString = IOUtils.toString(staticDataResource.inputStream, StandardCharsets.UTF_8.name())

        //val myJson = File(filePath).readText(Charsets.UTF_8)
        val gson = Gson()
        //val cloudData = gson.fromJson(staticDataString, CloudData::class.java)
        val json = gson.fromJson(staticDataString, mutableListOf<CloudData>().javaClass)

        for (cloudData in json.toList()) {
            CloudDataRepository.save(cloudData)
        }
        val text = CloudDataRepository.findAll()
        val x = 25
        return "dashboard"
    }
}