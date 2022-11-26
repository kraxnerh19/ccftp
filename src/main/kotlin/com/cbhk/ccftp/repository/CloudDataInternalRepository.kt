package com.cbhk.ccftp.repository

import com.cbhk.ccftp.entity.CloudData
import com.cbhk.ccftp.entity.CloudDataInternal
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CloudDataInternalRepository: JpaRepository<CloudDataInternal, Int> {
    fun findAllByTimestampAndCloudProvider(timestamp: String, cloudProvider: String): CloudDataInternal?
    fun findAllByTimestamp(timestamp: String): List<CloudDataInternal>?
}