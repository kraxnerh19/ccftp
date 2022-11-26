package com.cbhk.ccftp.entity

import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Null

@Entity
class CloudDataInternal (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @field:NotNull
    var timestamp : String?  = null,

    @field:NotNull
    var cloudProvider : String?  = null,

    @field:NotNull
    var kilowattHours : Double? = null,

    @field:NotNull
    var co2e : Double? = null,

    @field:NotNull
    var cost : Double? = null,
)