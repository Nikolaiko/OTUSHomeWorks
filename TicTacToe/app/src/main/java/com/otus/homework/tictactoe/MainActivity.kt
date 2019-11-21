package com.otus.homework.tictactoe

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.otus.homework.tictactoe.enum.GameResult
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        gameView.onGameEndCallback = {
            runOnUiThread {
                if (it == GameResult.CROSS_WIN) {
                    Toast.makeText(this, "Выиграли крестики", Toast.LENGTH_LONG).show()
                } else if (it == GameResult.CIRCLE_WIN) {
                    Toast.makeText(this, "Выиграли нолики", Toast.LENGTH_LONG).show()
                } else {
                    Toast.makeText(this, "Ничья", Toast.LENGTH_LONG).show()
                }
            }
            gameView.resetGame()
        }
    }
}
