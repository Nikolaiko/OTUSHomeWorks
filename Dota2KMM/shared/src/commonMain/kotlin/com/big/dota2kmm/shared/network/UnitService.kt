package com.big.dota2kmm.shared.network

import com.big.dota2kmm.shared.model.CivUnit
import com.big.dota2kmm.shared.model.Civilizations

class UnitService {
    val networkService = NetworkService()

    suspend fun loadUnitData(name: String): CivUnit? {
        val url =
            "https://age-of-empires-2-api.herokuapp.com/api/v1/unit/$name"
        println(url)
        return networkService.loadData<CivUnit>(url)
    }
}