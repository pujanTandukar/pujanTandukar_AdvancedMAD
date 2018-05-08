package com.example.pujan.lab8_extracredit;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;

public class Main2Activity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Button button1 = findViewById(R.id.button);
        TextView textView1 = findViewById(R.id.textView);

        Intent i = getIntent();
        String colorName = i.getStringExtra("name");
        String hexName = i.getStringExtra("hex");
        textView1.setText(colorName);

        String[] val = hexName.split(",");

        String[] finR = val[0].split("[(]");
        String[] finB = val[2].split("[)]");
        String[] finG = val[1].split(" ");
        String[] finalB = finB[0].split(" ");

        int red = Integer.parseInt(finR[1]);
        int blue = Integer.parseInt(finalB[1]);
        int green = Integer.parseInt(finG[1]);

        String redA = Integer.toString(red, 16);
        String blueA = Integer.toString(blue, 16);
        String greenA = Integer.toString(green, 16);

//        button1.setBackgroundColor(s);
//        button1.setBackgroundColor(Color.parseColor("#01ff90"));
        String string12 = "#"+redA+greenA+blueA;
        int colorABC = Integer.parseInt(string12.replaceFirst("^#",""), 16);
        button1.setBackgroundColor(android.graphics.Color.parseColor(string12));

        Log.d("ABC", redA);
        Log.d("ABC", blueA);
        Log.d("red", String.valueOf(red));
        Log.d("green", String.valueOf(green));
        Log.d("blue", String.valueOf(blue));
    }
}