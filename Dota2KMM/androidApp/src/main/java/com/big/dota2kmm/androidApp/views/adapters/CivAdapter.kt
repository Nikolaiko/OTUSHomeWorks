package com.big.dota2kmm.androidApp.views.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.big.dota2kmm.androidApp.CivClick
import com.big.dota2kmm.androidApp.R
import com.big.dota2kmm.shared.model.Civilization
import com.big.dota2kmm.shared.model.Civilizations

class CivAdapter(
    private val civilizations: List<Civilization>,
    private val callback: CivClick
): RecyclerView.Adapter<CivViewHolder>()  {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CivViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.row_civ, parent, false)
        return CivViewHolder(view)
    }

    override fun onBindViewHolder(holder: CivViewHolder, position: Int) {
        holder.civTextView.text = civilizations[position].name
        holder.armyTextView.text = civilizations[position].armyType
        holder.expTextView.text = civilizations[position].expansion

        val unitName = civilizations[position].uniqueUnit.first().split("/").last()
        holder.unitTextView.text = unitName

        holder.parentLayout.setOnClickListener {
            callback(civilizations[position].uniqueUnit.first())
        }
    }

    override fun getItemCount() = civilizations.size
}