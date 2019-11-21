package com.otus.homework.tictactoe

import android.content.Context
import android.graphics.*
import android.os.Handler
import android.util.AttributeSet
import android.view.View

class OnBoardCircleView : View {
    constructor(context: Context?) : super(context)
    constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)

    private val blackPaint : Paint = Paint().apply {
        color = Color.BLACK
        strokeWidth = 3f
        style = Paint.Style.STROKE
    }

    private var firstPhase:Boolean = true

    private val bottomPartPath:Path = Path()
    private var circleRadius:Float = 40f
    private var lineLength:Float = 0f

    private val leftTopPoint:PointF = PointF()
    private val rightTopPoint:PointF = PointF()

    private val leftBottomPoint:PointF = PointF()
    private val rightBottomPoint:PointF = PointF()

    private val bottomLeftControlPoint:PointF = PointF()
    private val bottomRightControlPoint:PointF = PointF()

    private val topLeftControlPoint:PointF = PointF()
    private val topRightControlPoint:PointF = PointF()

    private var topCoff:Float = 1.3f
    private var bottomCoff:Float = 1.3f

    private val animationHandler = Handler()
    private val animationProcess:Runnable = object : Runnable {
        override fun run() {
            if (circleRadius < 100f) {
                circleRadius += 3.01f
                if (circleRadius >= 100) lineLength = 1f
            } else {
                lineLength += 5.0f
                bottomCoff += 0.10f
            }

            computeKeyPoints()
            computeUnstablePoints()

            invalidate()
            animationHandler.postDelayed(this, 1)
        }
    }

    init {
        animationHandler.post(animationProcess)
    }

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        super.onLayout(changed, left, top, right, bottom)
        computeKeyPoints()
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)

        bottomPartPath.reset()

        drawUpperPart()
        if (lineLength > 0) {
            drawLine()
        }
        drawBottomPart()

        canvas!!.drawPath(bottomPartPath, blackPaint)
    }

    private fun drawUpperPart() {
        bottomPartPath.moveTo(leftTopPoint.x, leftTopPoint.y)
        bottomPartPath.cubicTo(
            topLeftControlPoint.x, topLeftControlPoint.y,
            topRightControlPoint.x, topRightControlPoint.y,
            rightTopPoint.x, rightTopPoint.y
        )
    }

    private fun drawBottomPart() {
        bottomPartPath.moveTo(leftBottomPoint.x, leftBottomPoint.y)
        bottomPartPath.cubicTo(
            bottomLeftControlPoint.x, bottomLeftControlPoint.y,
            bottomRightControlPoint.x, bottomRightControlPoint.y,
            rightBottomPoint.x, rightBottomPoint.y
        )
    }

    private fun drawLine() {
        bottomPartPath.moveTo(leftTopPoint.x, leftTopPoint.y)
        bottomPartPath.lineTo(leftBottomPoint.x, leftBottomPoint.y)
        bottomPartPath.moveTo(rightTopPoint.x, rightTopPoint.y)
        bottomPartPath.lineTo(rightBottomPoint.x, rightBottomPoint.y)
    }

    private fun computeKeyPoints() {
        leftTopPoint.apply {
            x = (width / 2) - circleRadius
            y = (height / 2).toFloat()
        }

        rightTopPoint.apply {
            x = (width / 2) + circleRadius
            y = (height / 2).toFloat()
        }

        topLeftControlPoint.apply {
            x = leftTopPoint.x
            y = leftTopPoint.y - circleRadius * topCoff
        }

        topRightControlPoint.apply {
            x = rightTopPoint.x
            y = rightTopPoint.y - circleRadius * topCoff
        }
    }

    private fun computeUnstablePoints() {
        leftBottomPoint.apply {
            x = (width / 2) - circleRadius
            y = leftTopPoint.y + lineLength
        }

        rightBottomPoint.apply {
            x = (width / 2) + circleRadius
            y = rightTopPoint.y + lineLength
        }

        bottomLeftControlPoint.apply {
            x = leftBottomPoint.x
            y = leftBottomPoint.y + circleRadius * bottomCoff
        }

        bottomRightControlPoint.apply {
            x = rightBottomPoint.x
            y = rightBottomPoint.y + circleRadius * bottomCoff
        }

        println(leftBottomPoint)
        println(rightBottomPoint)


    }
}