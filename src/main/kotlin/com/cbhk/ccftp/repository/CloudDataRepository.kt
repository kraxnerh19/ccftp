package com.cbhk.ccftp.repository

import com.cbhk.ccftp.entity.CloudData
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CloudDataRepository: JpaRepository<CloudData, Int> {
}