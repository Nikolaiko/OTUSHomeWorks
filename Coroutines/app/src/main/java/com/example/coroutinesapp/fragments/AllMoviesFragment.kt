package com.example.coroutinesapp.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.beust.klaxon.Klaxon
import com.example.coroutinesapp.R
import com.example.coroutinesapp.data.CivTitleData
import com.example.coroutinesapp.data.CivTitleDataList
import com.example.coroutinesapp.network.GetCivsRequest
import kotlinx.coroutines.*

class AllMoviesFragment : Fragment() {
    private val requestScope = CoroutineScope(Dispatchers.IO)

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_all_civs, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        requestScope.launch {
            val responseString:String = GetCivsRequest().getAllCivs()
            withContext(Dispatchers.Main) {

                println(Klaxon().parse<CivTitleDataList>(responseString))
            }
        }
    }
}