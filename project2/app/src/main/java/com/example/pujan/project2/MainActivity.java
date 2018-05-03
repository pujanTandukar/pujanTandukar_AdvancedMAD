package com.example.pujan.project2;

import android.app.ActivityOptions;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageButton aries = findViewById(R.id.imageButton);
        aries.setOnClickListener(this);

        ImageButton taurus = findViewById(R.id.imageButton2);
        taurus.setOnClickListener(this);

        ImageButton gemini = findViewById(R.id.imageButton3);
        gemini.setOnClickListener(this);

        ImageButton cancer = findViewById(R.id.imageButton4);
        cancer.setOnClickListener(this);

        ImageButton leo = findViewById(R.id.imageButton5);
        leo.setOnClickListener(this);

        ImageButton virgo = findViewById(R.id.imageButton6);
        virgo.setOnClickListener(this);

        ImageButton libra = findViewById(R.id.imageButton10);
        libra.setOnClickListener(this);

        ImageButton scorpio = findViewById(R.id.imageButton11);
        scorpio.setOnClickListener(this);

        ImageButton sagattarius = findViewById(R.id.imageButton12);
        sagattarius.setOnClickListener(this);

        ImageButton capricorn = findViewById(R.id.imageButton14);
        capricorn.setOnClickListener(this);

        ImageButton aquarius = findViewById(R.id.imageButton7);
        aquarius.setOnClickListener(this);

        ImageButton pisces = findViewById(R.id.imageButton15);
        pisces.setOnClickListener(this);
    }


    @Override
    public void onClick(View v) {
        String passThis = "";
        switch (v.getId()) {
            case R.id.imageButton:
                Log.d("aries", "Aries");
                passThis = "Aries";
                break;

            case R.id.imageButton2:
                Log.d("taurus", "Taurus");
                passThis = "Taurus";
                break;

            case R.id.imageButton3:
                Log.d("gemini", "Gemini");
                passThis = "Gemini";
                // do your code
                break;

            case R.id.imageButton4:
                Log.d("cancer", "Cancer");
                passThis = "Cancer";
                // do your code
                break;

            case R.id.imageButton5:
                Log.d("leo", "Leo");
                passThis = "Leo";
                // do your code
                break;

            case R.id.imageButton6:
                Log.d("virgo", "Virgo");
                passThis = "Virgo";
                // do your code
                break;

            case R.id.imageButton10:
                Log.d("libra", "Libra");
                passThis = "Libra";
                // do your code
                break;

            case R.id.imageButton11:
                Log.d("scorpio", "Scorpio");
                passThis = "Scorpio";
                // do your code
                break;

            case R.id.imageButton12:
                Log.d("sagattarius", "Sagittarius");
                passThis = "Sagittarius";
                // do your code
                break;

            case R.id.imageButton14:
                Log.d("capricorn", "Capricorn");
                passThis = "Capricorn";
                // do your code
                break;

            case R.id.imageButton7:
                Log.d("aquarius", "Aquarius");
                passThis = "Aquarius";
                // do your code
                break;

            case R.id.imageButton15:
                Log.d("pisces", "Pisces");
                passThis = "Pisces";
                // do your code
                break;

            default:
                break;
        }
        Log.d("pass this:", passThis);

        Intent intent = new Intent(this, Main2Activity.class);
        intent.putExtra("zodiacSign", passThis);
//        startActivity(intent);
        startActivity(intent,
                ActivityOptions.makeSceneTransitionAnimation(this).toBundle());
    }


}

