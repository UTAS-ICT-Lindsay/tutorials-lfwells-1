package au.edu.utas.kit305.tutorial05

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import au.edu.utas.kit305.tutorial05.databinding.ActivityMovieDetailsBinding
import com.google.firebase.firestore.SetOptions
import com.google.firebase.firestore.ktx.firestore
import com.google.firebase.ktx.Firebase

class MovieDetails : AppCompatActivity() {
    private lateinit var ui : ActivityMovieDetailsBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ui = ActivityMovieDetailsBinding.inflate(layoutInflater)
        setContentView(ui.root)

        var movieIndex = intent.getIntExtra(MOVIE_INDEX, 0)
        val movie = items[movieIndex]
        ui.txtTitle.setText(movie.title)
        ui.txtYear.setText(movie.year.toString())
        ui.txtDuration.setText(movie.duration.toString())

        ui.btnSave.setOnClickListener {
            val title : String = ui.txtTitle.text.toString()
            val year : Int = ui.txtYear.text.toString().toInt()
            val duration : Float = ui.txtDuration.text.toString().toFloat()

            movie.title = title
            movie.year = year
            movie.duration = duration

            val db = Firebase.firestore
            db.document("movies/${movie.id!!}")
                .set(movie)
                .addOnSuccessListener {
                    Log.d(FIREBASE_TAG, "Successfully updated movie ${movie.id}")
                    finish()
                }
        }
    }
}