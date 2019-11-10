package com.example.coroutinesapp.data

import com.beust.klaxon.Json

data class CivTitleData(val id:Int,
                        val name:String,
                        @Json(name = "army_type")
                        val armyType:String = "No Army")