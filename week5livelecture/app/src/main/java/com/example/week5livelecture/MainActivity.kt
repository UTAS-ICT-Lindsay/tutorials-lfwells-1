package com.example.week5livelecture

import android.app.AlertDialog
import android.os.Bundle
import android.util.Log
import android.view.ViewGroup
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.week5livelecture.databinding.ActivityMainBinding
import com.example.week5livelecture.databinding.MyListItemBinding

val items = mutableListOf(
    Person(name = "Rick", studentID = 9001, smort = true),
    Person(name = "Morty", studentID = 9, smort = true),
    Person(name = "Beth", studentID = 42, smort = true),
    Person(name = "Summer", studentID = 43, smort = true),
    Person(name = "Jerry", studentID = -1, smort = false)
)

class MainActivity : AppCompatActivity() {
    private lateinit var ui : ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ui = ActivityMainBinding.inflate(layoutInflater)
        setContentView(ui.root)

        ViewCompat.setOnApplyWindowInsetsListener(ui.root) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        ui.myList.adapter = PersonAdapter(people = items)
        ui.myList.layoutManager = GridLayoutManager(this, 3)
    }


    inner class PersonHolder(var ui: MyListItemBinding) : RecyclerView.ViewHolder(ui.root) {}


    inner class PersonAdapter(private val people: MutableList<Person>) : RecyclerView.Adapter<PersonHolder>() {

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MainActivity.PersonHolder {
            Log.d("MY_APP", "onCreate $viewType")

            val inflatedUi = MyListItemBinding.inflate(layoutInflater)
            return PersonHolder(inflatedUi)
        }


        override fun onBindViewHolder(holder: PersonHolder, position: Int) {
            Log.d("MY_APP",  "onBind $position")

            val person = people[position]
            holder.ui.txtName.text = person.name
            holder.ui.txtStudentID.text = person.studentID.toString()

            holder.itemView.setOnClickListener {
                val builder = AlertDialog.Builder(holder.itemView.context)
                builder.setTitle("Check if ${person.name} is smart?")
                builder.setMessage(if (person.smort) "They so smort" else "They are not v smort")
//builder.setPositiveButton("OK", DialogInterface.OnClickListener(function = x))

                builder.setPositiveButton(android.R.string.yes) { dialog, which ->
                    Toast.makeText(applicationContext,
                        android.R.string.yes, Toast.LENGTH_SHORT).show()
                }

                builder.setNegativeButton(android.R.string.no) { dialog, which ->
                    Toast.makeText(applicationContext,
                        android.R.string.no, Toast.LENGTH_SHORT).show()
                }

                builder.setNeutralButton("Maybe") { dialog, which ->
                    Toast.makeText(applicationContext,
                        "Maybe", Toast.LENGTH_SHORT).show()
                }
                builder.show()
            }
        }

        override fun getItemCount(): Int {
            return people.size
        }
    }
}