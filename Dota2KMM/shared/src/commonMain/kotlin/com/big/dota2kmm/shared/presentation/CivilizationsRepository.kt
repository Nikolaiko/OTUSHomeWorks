package com.big.dota2kmm.shared.presentation

import com.big.dota2kmm.shared.dispatchers.ioDispatcher
import com.big.dota2kmm.shared.dispatchers.uiDispatcher
import com.big.dota2kmm.shared.network.CivilizationService
import kotlinx.coroutines.*

class CivilizationsRepository {
    var delegate: CivilizationsDelegate? = null

    private val service = CivilizationService()
    private var scope = CoroutineScope(ioDispatcher)

    fun attachDelegate(view: CivilizationsDelegate) {
        this.delegate = view

    }

    fun detachDelegate() {
        this.delegate = null
    }

    fun loadCivData() {
        scope.launch {
            val civilizations = service.loadCivData()
            if (civilizations != null) {
                withContext(uiDispatcher) {
                    delegate?.setCivilizations(civilizations)
                }
            }
        }
    }
}