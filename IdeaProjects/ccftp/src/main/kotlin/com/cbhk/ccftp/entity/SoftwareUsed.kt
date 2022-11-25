package com.cbhk.ccftp.entity

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotNull
import javax.validation.constraints.Null

@Entity
class SoftwareUsed (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @field:NotNull
    var timestamp : String?  = null,

    @field:NotNull
    var softwareUsed : String?  = "",
)