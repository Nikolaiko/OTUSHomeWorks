package com.big.dota2kmm.androidApp.presenters

import com.big.dota2kmm.androidApp.reducers.CivReducer
import com.big.dota2kmm.androidApp.views.CivView
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.rxkotlin.addTo

class CivPresenter {
    private var view: CivView? = null
    private val reducer = CivReducer()
    private val disposableBag = CompositeDisposable()

    fun attachView(presenterView: CivView) {
        view = presenterView

        reducer.civDataObservable
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe {
                view?.updateData(it)
            }.addTo(disposableBag)
    }

    fun removeView() {
        view = null
        disposableBag.clear()
    }

    fun loadCivilizations() {
        reducer.loadData()
    }
}