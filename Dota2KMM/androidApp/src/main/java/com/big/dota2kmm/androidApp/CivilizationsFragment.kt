package com.big.dota2kmm.androidApp

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.big.dota2kmm.androidApp.presenters.CivPresenter
import com.big.dota2kmm.androidApp.views.CivView
import com.big.dota2kmm.androidApp.views.adapters.CivAdapter
import com.big.dota2kmm.shared.model.Civilizations

class CivilizationsFragment : Fragment(), CivView {
    private val presenter = CivPresenter()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_civilizations, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val list = view.findViewById<RecyclerView>(R.id.civ_list)
        list.layoutManager = LinearLayoutManager(context)
        list.adapter = CivAdapter(emptyList(), ::civClickCallback)

        presenter.attachView(this)
        presenter.loadCivilizations()
    }

    override fun onDestroyView() {
        super.onDestroyView()
        presenter.removeView()
    }

    override fun updateData(data: Civilizations) {
        val list = view?.findViewById<RecyclerView>(R.id.civ_list)
        list?.adapter = CivAdapter(data.civilizations, ::civClickCallback)
    }

    private fun civClickCallback(unitLink: String) {
        val bundle = bundleOf(UNIT_LINK to unitLink)
        view?.findNavController()?.navigate(R.id.action_civilizationsFragment_to_unitFragment, bundle)
    }
}