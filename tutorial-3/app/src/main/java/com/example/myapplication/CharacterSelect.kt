package com.example.myapplication

import android.content.Intent
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.myapplication.databinding.ActivityCharacterSelectBinding

class CharacterSelect : AppCompatActivity() {
    private lateinit var ui : ActivityCharacterSelectBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        ui = ActivityCharacterSelectBinding.inflate(layoutInflater)
        setContentView(ui.root)
        ViewCompat.setOnApplyWindowInsetsListener(ui.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        ui.btnMira.setOnClickListener {
            val intent = Intent()
            intent.putExtra(CHARACTER_NAME, "Mira")
            setResult(RESPONSE_SELECTED, intent)
            finish()
        }
        ui.btnRumi.setOnClickListener {
            val intent = Intent()
            intent.putExtra(CHARACTER_NAME, "Rumi")
            setResult(RESPONSE_SELECTED, intent)
            finish()
        }
        ui.btnZoey.setOnClickListener {
            val intent = Intent()
            intent.putExtra(CHARACTER_NAME, "Zoey")
            setResult(RESPONSE_SELECTED, intent)
            finish()
        }
        ui.btnCancel.setOnClickListener {
            setResult(RESPONSE_CANCELLED)
            finish()
        }
    }
}