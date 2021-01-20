package com.big.dota2kmm.shared.model

import kotlinx.serialization.Serializable

@Serializable
data class Civilizations (
    val civilizations: List<Civilization>
)