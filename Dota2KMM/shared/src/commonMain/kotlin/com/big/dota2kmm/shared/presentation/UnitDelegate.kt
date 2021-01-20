package com.big.dota2kmm.shared.presentation

import com.big.dota2kmm.shared.model.CivUnit

interface UnitDelegate {
    fun setUnitData(unitData: CivUnit)
}