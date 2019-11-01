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
import com.example.coroutinesapp.data.CivDetailedData
import com.example.coroutinesapp.data.CivTitleDataList
import com.example.coroutinesapp.list.CivListAdapter
import com.example.coroutinesapp.network.GetCivsRequest
import kotlinx.android.synthetic.main.fragment_all_civs.*
import kotlinx.android.synthetic.main.fragment_current_civ.*
import kotlinx.coroutines.*
import java.lang.Exception

class CurrentMovieFragment : Fragment() {
    private val requestJob = Job()
    private val requestScope = CoroutineScope(Dispatchers.IO + requestJob)
    private var civId:Int = -1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        civId = arguments?.getInt("id") ?: -1
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_current_civ, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        buttonBack.setOnClickListener {
            view.findNavController().popBackStack()
        }

        if (civId != -1) {
            requestScope.launch {
                val responseString:String = GetCivsRequest().getCurrentCiv(civId)
                println(responseString)
                withContext(Dispatchers.Main) {
                    val parsedResponse = try {
                        Klaxon().parse<CivDetailedData>(responseString)
                    } catch (parseException:Exception) {
                        CivDetailedData()
                    }
                    civName.text = parsedResponse?.name
                    civArmyType.text = parsedResponse?.army_type
                    civBonuses.text = parsedResponse?.civilization_bonus?.joinToString("\n")
                }
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        requestJob.cancel()
    }
}