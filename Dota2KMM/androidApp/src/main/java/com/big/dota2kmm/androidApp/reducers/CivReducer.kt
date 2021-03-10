package com.big.dota2kmm.androidApp.reducers

import com.big.dota2kmm.shared.model.Civilizations
import com.big.dota2kmm.shared.presentation.CivilizationsDelegate
import com.big.dota2kmm.shared.presentation.CivilizationsRepository
import io.reactivex.subjects.PublishSubject

class CivReducer : CivilizationsDelegate {
    val civDataObservable: PublishSubject<Civilizations> = PublishSubject.create()

    private val repository = CivilizationsRepository()

    init {
        repository.attachDelegate(this)
    }

    fun loadData() {
        repository.loadCivData()
    }

    override fun setCivilizations(data: Civilizations) {
        civDataObservable.onNext(data)
    }
}