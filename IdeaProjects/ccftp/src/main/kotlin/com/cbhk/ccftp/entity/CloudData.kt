package com.cbhk.ccftp.entity

import com.cbhk.ccftp.entity.ServiceEstimates
import com.google.gson.annotations.SerializedName
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
data class CloudData (

  @SerializedName("timestamp"        ) var timestamp        : String?                     = null,
  @SerializedName("serviceEstimates" ) var serviceEstimates : ArrayList<ServiceEstimates> = arrayListOf(),

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  var id: Int? = null

)