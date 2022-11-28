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
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.data.repository.findByIdOrNull
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestParam
import java.nio.charset.StandardCharsets
import javax.validation.Valid


@Controller
class AssignSoftwareController(
    val softwareUsedRepository: SoftwareUsedRepository
) {
    private fun populateEditSoftwareUsedView(model: Model): String {
        return "editSoftwareUsed"
    }

    @RequestMapping(path=["/listSoftwareUsed"], method = [RequestMethod.GET])
    fun listSoftwareUsed(model: Model): String {
        model["softwareUsed"] = softwareUsedRepository.findAll()
        model["softwareUsedAssigned"] = softwareUsedRepository.findAllBySoftwareUsedNameIsNot("") ?: ""
        model["softwareUsedNotAssigned"] = softwareUsedRepository.findAllBySoftwareUsedNameIs("") ?: ""
        return "listSoftwareUsed"
    }

    @RequestMapping("/editSoftwareUsed", method = [RequestMethod.GET])
    fun editSoftwareUsed(model: Model, @RequestParam(required = false) id: Int?): String {
        var softwareUsedCurr: SoftwareUsed?

        if (id == null) {
            softwareUsedCurr = SoftwareUsed()
        } else {
            softwareUsedCurr = softwareUsedRepository.findByIdOrNull(id)
        }

        if (id != null && softwareUsedCurr === null) {
            model["errorMessage"] = "Entry with id ${id} could not be found!"
        }

        model["softwareUsedCurr"] = softwareUsedCurr ?: SoftwareUsed()
        return populateEditSoftwareUsedView(model)
    }

    @RequestMapping("/changeSoftwareUsed", method = [RequestMethod.POST])
    fun changeSoftwareUsed(@ModelAttribute @Valid softwareUsed: SoftwareUsed, bindingResult: BindingResult, model: Model): String {
        if(bindingResult.hasErrors()){
            return "listSoftwareUsed"
        }

        try {
            softwareUsedRepository.save(softwareUsed)
        } catch (e: Exception) {
            model["errorMessage"] = e.message ?: "Could not assign software"
            return "listSoftwareUsed"
        }

        return listSoftwareUsed(model)
    }

    //TODO Implement Delete of software used
}