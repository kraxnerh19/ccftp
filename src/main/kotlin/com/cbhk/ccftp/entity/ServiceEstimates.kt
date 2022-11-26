package com.cbhk.ccftp.entity

import com.google.gson.annotations.SerializedName
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
data class ServiceEstimates (

  @SerializedName("cloudProvider"          ) var cloudProvider          : String?  = null,
  @SerializedName("accountName"            ) var accountName            : String?  = null,
  @SerializedName("serviceName"            ) var serviceName            : String?  = null,
  @SerializedName("kilowattHours"          ) var kilowattHours          : Double?  = null,
  @SerializedName("co2e"                   ) var co2e                   : Double?  = null,
  @SerializedName("cost"                   ) var cost                   : Double?  = null,
  @SerializedName("region"                 ) var region                 : String?  = null,
  @SerializedName("usesAverageCPUConstant" ) var usesAverageCPUConstant : Boolean? = null,

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  var id: Int? = null

)