package com.otus.homework.tictactoe

import com.otus.homework.tictactoe.enum.FigureType
import com.otus.homework.tictactoe.enum.GameResult
import com.otus.homework.tictactoe.model.Figure

fun gameOver(elements:List<Figure>):GameResult {
    var result = GameResult.DRAW
    for (i in 0..2) {
        if (checkColumn(elements, i) != GameResult.DRAW) {
            result = checkColumn(elements, i)
            break
        }
    }

    for (i in 0..2) {
        if (checkRow(elements, i) != GameResult.DRAW) {
            result = checkRow(elements, i)
            break
        }
    }

    if (elements.filter {
            ((it.indexY == 0 && it.indexX == 0) || (it.indexY == 1 && it.indexX == 1) || (it.indexY == 2 && it.indexX == 2))
                    && it.type == FigureType.CIRCLE
        }.size >= 3)  result = GameResult.CIRCLE_WIN


    if (elements.filter {
            ((it.indexY == 0 && it.indexX == 0) || (it.indexY == 1 && it.indexX == 1) || (it.indexY == 2 && it.indexX == 2))
                    && it.type == FigureType.CROSS
        }.size >= 3)  result = GameResult.CROSS_WIN

    if (elements.filter {
            ((it.indexY == 0 && it.indexX == 2) || (it.indexY == 1 && it.indexX == 1) || (it.indexY == 2 && it.indexX == 0))
                    && it.type == FigureType.CIRCLE
        }.size >= 3)  result = GameResult.CIRCLE_WIN

    if (elements.filter {
            ((it.indexY == 0 && it.indexX == 2) || (it.indexY == 1 && it.indexX == 1) || (it.indexY == 2 && it.indexX == 0))
                    && it.type == FigureType.CROSS
        }.size >= 3)  result = GameResult.CROSS_WIN

    return result
}

fun checkRow(elements:List<Figure>, row:Int):GameResult = when {
        elements.filter { it.indexY == row && it.type == FigureType.CIRCLE }.size >= 3 -> GameResult.CIRCLE_WIN
        elements.filter { it.indexY == row && it.type == FigureType.CROSS }.size >= 3 -> GameResult.CROSS_WIN
        else -> GameResult.DRAW
    }

fun checkColumn(elements:List<Figure>, column:Int):GameResult = when {
    elements.filter { it.indexX == column && it.type == FigureType.CIRCLE }.size >= 3 -> GameResult.CIRCLE_WIN
    elements.filter { it.indexX == column && it.type == FigureType.CROSS }.size >= 3 -> GameResult.CROSS_WIN
    else -> GameResult.DRAW
}



fun checkSequence(sequence:List<Figure>):GameResult {
    var result = GameResult.DRAW
    if (sequence.size < 3) {
        if (sequence.filter { it.type == FigureType.CIRCLE }.size == 3) result = GameResult.CIRCLE_WIN
        if (sequence.filter { it.type == FigureType.CROSS }.size == 3) result = GameResult.CROSS_WIN
    }
    return result
}
