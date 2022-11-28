package com.cbhk.ccftp.entity

import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotNull

class ChartData (
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

    @field:NotNull
    var usedSoftware : String? = null
)
