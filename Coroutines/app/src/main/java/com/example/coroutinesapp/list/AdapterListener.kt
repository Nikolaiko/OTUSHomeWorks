package com.example.coroutinesapp.list

import com.example.coroutinesapp.data.CivTitleData

interface AdapterListener {
    fun rowTap(item:CivTitleData)
}