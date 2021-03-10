package com.big.dota2kmm.androidApp.views.adapters

import android.view.View
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.recyclerview.widget.RecyclerView
import com.big.dota2kmm.androidApp.R

class CivViewHolder(view: View) : RecyclerView.ViewHolder(view) {
    val parentLayout = view.findViewById<ConstraintLayout>(R.id.civRowParent)
    val civTextView = view.findViewById<TextView>(R.id.civName)
    val expTextView = view.findViewById<TextView>(R.id.expansionType)
    val armyTextView = view.findViewById<TextView>(R.id.armyType)
    val unitTextView = view.findViewById<TextView>(R.id.unitText)
}