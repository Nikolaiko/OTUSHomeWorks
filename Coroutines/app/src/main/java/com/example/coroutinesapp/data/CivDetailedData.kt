package com.example.coroutinesapp.data

import com.beust.klaxon.Json

data class CivDetailedData(val id:Int = -1,
                           val name:String = "Unknown",
                           val expansion:String = "Unavailable",
                           @Json(name = "army_type")
                           val armyType:String = "No Army",
                           @Json(name = "civilization_bonus")
                           val civilizationBonus:List<String> = emptyList())