package com.cbhk.ccftp.controller

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
import java.nio.charset.StandardCharsets

@Controller
class FurtherInformationController(
    val CloudDataRepository: CloudDataRepository,
    val CloudDataInternalRepository: CloudDataInternalRepository,
    val SoftwareUsedRepository: SoftwareUsedRepository
) {
    @RequestMapping(path = [ "/furtherInformation"], method = [RequestMethod.GET])
    fun listFurtherInformation(model: Model): String {


        model["CloudDataInternal"] = CloudDataInternalRepository.findAll()
        model["SoftwareUsed"] = SoftwareUsedRepository.findAll()
        return "furtherInformation"
    }


}
