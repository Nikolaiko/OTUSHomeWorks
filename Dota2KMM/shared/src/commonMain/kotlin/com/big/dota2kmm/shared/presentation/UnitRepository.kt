package com.big.dota2kmm.shared.presentation


import com.big.dota2kmm.shared.network.UnitService
import kotlinx.coroutines.*


class UnitRepository {
    var delegate: UnitDelegate? = null

    private val service = UnitService()
    private var scope = CoroutineScope(Dispatchers.Unconfined + Job())

    fun attachDelegate(view: UnitDelegate) {
        this.delegate = view

    }

    fun detachDelegate() {
        this.delegate = null
    }

    fun loadUnitData(name: String) {
        scope.launch {
            val unit = service.loadUnitData(name)
            if (unit != null) {
                withContext(Dispatchers.Unconfined) {
                    delegate?.setUnitData(unit)
                }
            }
        }
    }
}