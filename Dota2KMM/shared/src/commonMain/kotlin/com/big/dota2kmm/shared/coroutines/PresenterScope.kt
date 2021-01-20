package com.big.dota2kmm.shared.coroutines

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlin.coroutines.CoroutineContext

class PresenterScope(private val context: CoroutineContext) : CoroutineScope {
    private  val scopeJob = Job()
    override val coroutineContext: CoroutineContext
        get() = context + scopeJob

    fun viewDetached() {
        scopeJob.cancel()
    }
}