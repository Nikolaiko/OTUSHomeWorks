package com.big.dota2kmm.androidApp

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import com.big.dota2kmm.androidApp.presenters.UnitPresenter
import com.big.dota2kmm.androidApp.views.UnitView
import com.big.dota2kmm.shared.model.CivUnit

class UnitFragment: Fragment(), UnitView {
    private var unitLink = ""
    private val presenter = UnitPresenter()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_unit, container, false)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        unitLink = arguments?.getString(UNIT_LINK) ?: ""
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val backButton = view.findViewById<Button>(R.id.backButton)
        backButton.setOnClickListener {
            view.findNavController().popBackStack()
        }

        presenter.attachView(this)
        presenter.loadUnit(unitLink)
    }

    override fun onDestroyView() {
        super.onDestroyView()
        presenter.removeView()
    }

    override fun updateData(unitData: CivUnit) {
        view?.findViewById<TextView>(R.id.unitName)?.text = unitData.name
        view?.findViewById<TextView>(R.id.unitDesc)?.text = unitData.description
    }
}