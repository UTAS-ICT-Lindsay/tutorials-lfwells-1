package com.example.myapplication

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.myapplication.databinding.ActivityMainBinding

const val USERNAME_KEY : String = "USERNAME"

class MainActivity : AppCompatActivity()
{
    private lateinit var ui : ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        ui = ActivityMainBinding.inflate(layoutInflater)
        setContentView(ui.root)

        ViewCompat.setOnApplyWindowInsetsListener(ui.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        Log.d("MY_APP", "onCreate");

        val myButton : Button = ui.btnEnter
        myButton.setOnClickListener {
            Log.d("MY_APP", "clicked! click me baby");
            val enteredText = ui.txtName.text.toString()

            val goToNextScreenIntent = Intent(this, SecondActivity::class.java)
            goToNextScreenIntent.putExtra(USERNAME_KEY, enteredText)
            startActivity(goToNextScreenIntent)
        }


        //made a change to my project
        //made more changes
    }
}