package com.cbhk.ccftp.repository

import com.cbhk.ccftp.entity.CloudDataInternal
import com.cbhk.ccftp.entity.SoftwareUsed
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface SoftwareUsedRepository : JpaRepository<SoftwareUsed, Int> {
    fun findByTimestamp(timestamp: String?): SoftwareUsed?
    fun findAllBySoftwareUsedNameIsNot(name: String?): List<SoftwareUsed>?
    fun findAllBySoftwareUsedNameIs(name: String?): List<SoftwareUsed>?
}