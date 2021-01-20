package com.big.dota2kmm.shared.coroutines

import kotlin.coroutines.CoroutineContext

expect val ioDispatcher: CoroutineContext

expect val uiDispatcher: CoroutineContext
