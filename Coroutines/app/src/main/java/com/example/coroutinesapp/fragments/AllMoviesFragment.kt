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
import com.example.coroutinesapp.data.CivTitleData
import com.example.coroutinesapp.data.CivTitleDataList
import com.example.coroutinesapp.list.AdapterListener
import com.example.coroutinesapp.list.CivListAdapter
import com.example.coroutinesapp.network.GetCivsRequest
import kotlinx.android.synthetic.main.fragment_all_civs.*
import kotlinx.coroutines.*
import java.lang.Exception

class AllMoviesFragment : Fragment(), AdapterListener {
    private val requestJob = Job()
    private val requestScope = CoroutineScope(Dispatchers.IO + requestJob)

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_all_civs, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        recyclerView.layoutManager = LinearLayoutManager(context)

        requestScope.launch {
            val responseString:String = GetCivsRequest().getAllCivs()
            withContext(Dispatchers.Main) {
                val parsedResponse = try {
                    Klaxon().parse<CivTitleDataList>(responseString)
                } catch (parseException:Exception) {
                    CivTitleDataList(emptyList())
                }
                recyclerView.adapter = CivListAdapter(
                    parsedResponse?.civilizations ?: emptyList(),
                    this@AllMoviesFragment)
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        requestJob.cancel()
    }

    override fun rowTap(item: CivTitleData) {
        val navigationBundle = Bundle()
        navigationBundle.putInt("id", item.id)
        view?.findNavController()?.navigate(R.id.action_allMoviesFragment_to_currentMovieFragment, navigationBundle)
    }
}