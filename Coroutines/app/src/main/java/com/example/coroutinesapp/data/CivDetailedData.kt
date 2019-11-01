package com.example.coroutinesapp.data

data class CivDetailedData(val id:Int = -1,
                           val name:String = "Unknown",
                           val expansion:String = "Unavailable",
                           val army_type:String = "No Army",
                           val civilization_bonus:List<String> = emptyList())