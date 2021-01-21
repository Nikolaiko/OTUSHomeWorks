package com.big.dota2kmm.shared.presentation

import com.big.dota2kmm.shared.coroutines.PresenterScope
import com.big.dota2kmm.shared.coroutines.ioDispatcher
import com.big.dota2kmm.shared.coroutines.uiDispatcher
import com.big.dota2kmm.shared.model.Civilizations
import com.big.dota2kmm.shared.network.CivilizationService
import kotlinx.coroutines.*
import kotlin.coroutines.CoroutineContext

class CivilizationsRepository {
    var delegate: CivilizationsDelegate? = null

    private val service = CivilizationService()
    private var scope = CoroutineScope(Dispatchers.Main + Job())

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
                withContext(Dispatchers.Main) {
                    delegate?.setCivilizations(civilizations)
                }
            }
        }
    }
}