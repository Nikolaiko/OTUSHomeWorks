package com.big.dota2kmm.androidApp.presenters

import com.big.dota2kmm.androidApp.reducers.CivReducer
import com.big.dota2kmm.androidApp.reducers.UnitReducer
import com.big.dota2kmm.androidApp.views.CivView
import com.big.dota2kmm.androidApp.views.UnitView
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.rxkotlin.addTo

class UnitPresenter {
    private var view: UnitView? = null
    private val reducer = UnitReducer()
    private val disposableBag = CompositeDisposable()

    fun attachView(presenterView: UnitView) {
        view = presenterView

        reducer.unitDataObservable
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe {
                view?.updateData(it)
            }.addTo(disposableBag)
    }

    fun removeView() {
        view = null
        disposableBag.clear()
    }

    fun loadUnit(link: String) {
        reducer.loadData(link)
    }
}