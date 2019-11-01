package com.example.coroutinesapp.list

import android.view.View
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.recyclerview.widget.RecyclerView
import com.example.coroutinesapp.R

class CivRowViewHolder(val holderView:View) : RecyclerView.ViewHolder(holderView) {
    val civNameText:TextView = holderView.findViewById(R.id.civName)
    val civArmyType:TextView = holderView.findViewById(R.id.civArmyType)
    val parentLayout:ConstraintLayout = holderView.findViewById(R.id.parentLayout)
}