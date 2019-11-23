package com.otus.homework.tictactoe.model

import com.otus.homework.tictactoe.enum.FigureType

data class Figure(val indexX:Int = 0,
                  val indexY:Int = 0,
                  val type:FigureType = FigureType.CROSS,
                  var painted:Boolean = false)