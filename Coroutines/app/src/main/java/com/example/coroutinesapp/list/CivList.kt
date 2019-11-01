package com.example.coroutinesapp.list

import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.coroutinesapp.data.CivTitleData

class CivList(val civ:List<CivTitleData>) : RecyclerView.Adapter<CivRowAdapter>() {


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CivRowAdapter {

    }

    override fun getItemCount(): Int {
        return civ.size
    }

    override fun onBindViewHolder(holder: CivRowAdapter, position: Int) {

    }
}