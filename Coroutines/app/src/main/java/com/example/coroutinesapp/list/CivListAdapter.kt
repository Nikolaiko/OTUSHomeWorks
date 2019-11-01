package com.example.coroutinesapp.list

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.coroutinesapp.R
import com.example.coroutinesapp.data.CivTitleData

class CivListAdapter(val civ:List<CivTitleData>,
                     val listener:AdapterListener) : RecyclerView.Adapter<CivRowViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CivRowViewHolder {
        val rowView: View = LayoutInflater.from(parent.context).inflate(R.layout.row_civ_element, parent, false)
        return  CivRowViewHolder(rowView)
    }

    override fun getItemCount(): Int {
        return civ.size
    }

    override fun onBindViewHolder(holder: CivRowViewHolder, position: Int) {
        holder.civNameText.text = civ[position].name
        holder.civArmyType.text = civ[position].army_type
        holder.parentLayout.setOnClickListener {
            listener.rowTap(civ[position])
        }
    }
}