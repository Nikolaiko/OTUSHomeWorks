package com.big.dota2kmm.androidApp.reducers

import com.big.dota2kmm.shared.model.CivUnit
import com.big.dota2kmm.shared.model.Civilizations
import com.big.dota2kmm.shared.presentation.CivilizationsRepository
import com.big.dota2kmm.shared.presentation.UnitDelegate
import com.big.dota2kmm.shared.presentation.UnitRepository
import io.reactivex.subjects.PublishSubject

class UnitReducer: UnitDelegate {

    val unitDataObservable: PublishSubject<CivUnit> = PublishSubject.create()

    private val repository = UnitRepository()

    init {
        repository.attachDelegate(this)
    }

    fun loadData(link: String) {
        repository.loadUnitData(link.split("/").last())
    }

    override fun setUnitData(unitData: CivUnit) {
        unitDataObservable.onNext(unitData)
    }
}