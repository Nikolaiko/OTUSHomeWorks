package com.big.dota2kmm.shared.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class CivUnit(
    val id: String,
    val name: String,
    val description: String,

    @SerialName("expansion")
    val dlcName: String,
    val age: String
)