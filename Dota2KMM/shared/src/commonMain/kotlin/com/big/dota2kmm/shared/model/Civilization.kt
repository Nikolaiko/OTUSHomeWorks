package com.big.dota2kmm.shared.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Civilization (
    val id: Long,
    val name: String,
    val expansion: Expansion,

    @SerialName("army_type")
    val armyType: String,

    @SerialName("unique_unit")
    val uniqueUnit: List<String>,

    @SerialName("unique_tech")
    val uniqueTech: List<String>,

    @SerialName("team_bonus")
    val teamBonus: String,

    @SerialName("civilization_bonus")
    val civilizationBonus: List<String>
)