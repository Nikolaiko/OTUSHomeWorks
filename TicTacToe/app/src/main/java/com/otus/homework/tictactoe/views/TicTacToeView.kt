package com.otus.homework.tictactoe.views

import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View
import com.otus.homework.tictactoe.enum.FigureType
import com.otus.homework.tictactoe.enum.GameResult
import com.otus.homework.tictactoe.gameOver
import com.otus.homework.tictactoe.model.Figure

class TicTacToeView : View {
    constructor(context: Context?) : super(context)
    constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)

    var onGameEndCallback:((GameResult)->Unit)? = null

    private val gamePolePath:Path = Path()
    private val elementsPath:Path = Path()

    private var elementsList:MutableList<Figure> = mutableListOf()

    private val blackPaint : Paint = Paint().apply {
        color = Color.BLACK
        strokeWidth = 3f
        style = Paint.Style.STROKE
    }

    private var cellWidth = 0f
    private var cellHeight = 0f

    private var firstX = 0f
    private var secondX = 0f

    private var firstY = 0f
    private var secondY = 0f

    private var circleRadius:Float = 0f
    private var animationInProgress:Boolean = false

    private var activeFigure = FigureType.CIRCLE

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        super.onLayout(changed, left, top, right, bottom)

        cellWidth = width / 3f
        cellHeight = height / 3f

        firstX = cellWidth
        secondX = cellWidth * 2f

        firstY = cellHeight
        secondY = cellHeight * 2f

        circleRadius = Math.min(cellWidth / 2f, cellHeight / 2f)
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        drawGamePole()
        drawFigures()

        canvas.drawPath(gamePolePath, blackPaint)
        canvas.drawPath(elementsPath, blackPaint)
    }

    fun resetGame() {
        elementsPath.reset()
        elementsList.clear()
        activeFigure = FigureType.CIRCLE
        invalidate()
    }

    private fun drawGamePole() {
        gamePolePath.moveTo(firstX , 0f)
        gamePolePath.lineTo(firstX, height.toFloat())

        gamePolePath.moveTo(secondX , 0f)
        gamePolePath.lineTo(secondX, height.toFloat())

        gamePolePath.moveTo(0f , firstY)
        gamePolePath.lineTo(width.toFloat(), firstY)

        gamePolePath.moveTo(0f , secondY)
        gamePolePath.lineTo(width.toFloat(), secondY)
    }

    private fun drawFigures() {
        for (currentFigure in elementsList) {
            if (!currentFigure.painted) {
                if (currentFigure.type == FigureType.CIRCLE) {
                    drawCircle(currentFigure.indexX, currentFigure.indexY)
                } else {
                    drawCross(currentFigure.indexX, currentFigure.indexY)
                }
                currentFigure.painted = true
            }
        }
    }

    private fun drawCircle(indexX:Int, indexY:Int) {
        val centerX = (indexX * cellWidth) + (cellWidth / 2f)
        val centerY = (indexY * cellHeight) + (cellHeight / 2f)

        elementsPath.moveTo(centerX, centerY)
        elementsPath.addCircle(centerX, centerY, circleRadius, Path.Direction.CW)
    }

    private fun drawCross(indexX:Int, indexY:Int) {
        val topLeftX = indexX * cellWidth
        val topLeftY = indexY * cellHeight
        val topRightX = topLeftX + cellWidth
        val topRightY = topLeftY

        val bottomLeftX = topLeftX
        val bottomLeftY = topLeftY + cellHeight
        val bottomRightX = topRightX
        val bottomRightY = topRightY + cellHeight


        elementsPath.moveTo(topLeftX, topLeftY)
        elementsPath.lineTo(bottomRightX, bottomRightY)
        elementsPath.moveTo(topRightX, topRightY)
        elementsPath.lineTo(bottomLeftX, bottomLeftY)
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        if (event.action == MotionEvent.ACTION_DOWN && !animationInProgress) {
            val touchIndex = getIndexFromCoors(event.x, event.y)

            if (cellFree(touchIndex)) {
                putFigure(touchIndex, activeFigure)
                giveTurnToNextUser()
                invalidate()

                val result = gameOver(elementsList)
                if (result != GameResult.DRAW || (result == GameResult.DRAW && elementsList.size >= 9)) {
                    onGameEndCallback?.invoke(result)
                }
            }
        }
        return true
    }

    private fun getIndexFromCoors(touchX:Float, touchY:Float): Point {
        var indexX = 0
        var indexY = 0

        if (touchX <= firstX) {
            indexX = 0
        } else if (touchX > firstX && touchX <= secondX) {
            indexX = 1
        } else if (touchX > secondX) {
            indexX = 2
        }

        if (touchY <= firstY) {
            indexY = 0
        } else if (touchY > firstY && touchY <= secondY) {
            indexY = 1
        } else if (touchY > secondY) {
            indexY = 2
        }
        return Point(indexX, indexY)
    }

    private fun putFigure(coors:Point, type:FigureType) {
        elementsList.add(Figure(coors.x, coors.y, type, false))
    }

    private fun giveTurnToNextUser() {
        activeFigure = when(activeFigure) {
            FigureType.CIRCLE -> FigureType.CROSS
            FigureType.CROSS -> FigureType.CIRCLE
        }
    }

    private fun cellFree(cellIndex:Point):Boolean = elementsList.none { it.indexX == cellIndex.x && it.indexY == cellIndex.y }
}