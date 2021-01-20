package com.big.dota2kmm.shared.network

import com.big.dota2kmm.shared.model.Civilizations

class CivilizationService {
    val networkService = NetworkService()

    suspend fun loadMovies(): Civilizations? {
        val url =
            "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"
        return networkService.loadData<Civilizations>(url)
    }
}