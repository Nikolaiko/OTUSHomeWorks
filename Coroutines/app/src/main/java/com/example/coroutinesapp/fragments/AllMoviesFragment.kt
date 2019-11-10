package com.example.coroutinesapp.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import com.beust.klaxon.Klaxon
import com.example.coroutinesapp.R
import com.example.coroutinesapp.data.CivTitleDataList
import com.example.coroutinesapp.list.CivListAdapter
import com.example.coroutinesapp.network.GetCivsRequest
import kotlinx.android.synthetic.main.fragment_all_civs.*
import kotlinx.coroutines.*
import java.lang.Exception

class AllMoviesFragment : Fragment() {
    private val requestJob = Job()
    private val requestScope = CoroutineScope(Dispatchers.IO + requestJob)
    private val klaxon:Klaxon by lazy { Klaxon() }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_all_civs, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        recyclerView.layoutManager = LinearLayoutManager(context)

        requestScope.launch {
            val responseString = GetCivsRequest().getAllCivs()
            withContext(Dispatchers.Main) {
                val parsedResponse = try {
                    klaxon.parse<CivTitleDataList>(responseString)
                } catch (parseException:Exception) {
                    println("Exception : ${parseException.localizedMessage}")
                    CivTitleDataList(emptyList())
                }
                recyclerView.adapter = CivListAdapter(
                    parsedResponse?.civilizations ?: emptyList()
                ) {
                    val navigationBundle = Bundle()
                    navigationBundle.putInt("id", it.id)
                    view.findNavController().navigate(R.id.action_allMoviesFragment_to_currentMovieFragment, navigationBundle)
                }
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        requestJob.cancel()
    }
}