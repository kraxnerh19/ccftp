package com.cbhk.ccftp.entity

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotNull

@Entity
class SoftwareUsed (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @field:NotNull
    var timestamp : String?  = null,

    @field:NotNull
    var softwareUsedName : String?  = "",
)