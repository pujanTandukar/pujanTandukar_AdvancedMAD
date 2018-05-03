package com.example.pujan.project2;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.method.ScrollingMovementMethod;
import android.widget.TextView;

public class Main3Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main3);
        TextView allinfo = findViewById(R.id.textView16);
        String allElements = "ELEMENTS" + "\n\n" + this.getString(R.string.fire) + "\n" + this.getString(R.string.fireSym) + "\n\n" + this.getString(R.string.water) + "\n" + this.getString(R.string.waterSym)+
                "\n\n" + this.getString(R.string.earth) + "\n" + this.getString(R.string.earthSym)+"\n\n" + this.getString(R.string.air) + "\n" + this.getString(R.string.airSym);
        String allQuality = "\n\nQUALITIES\n\n" + "Cardinal\n" +"These signs start every season—Aries kicks off spring, Cancer starts summer, Libra begins fall and Capricorn is the first winter sign. Thus, they are the leaders and “idea people” of the zodiac. These signs prize originality and like to be first in everything they do. They’re the trendsetters and trendspotters, the ones who get the party started and the crowd hyped. Count on them to initiate a winning idea or plan." +
                "\n\n" + "Fixed\n" + "These signs fall in the middle of every season. They’re the stabilizers—the ones who set up a solid goal or foundation, then start building. Fixed signs can take the enthusiastic ideas that cardinal signs spark, and craft them into something real. They pick up the ball when the cardinal sign passes it, and run the distance to the goal. Fixed signs are the trustworthy types who like “to-do” lists and fancy titles. If a cardinal signs says, “Let’s go on vacation!” the fixed sign will call the travel agency, book the tickets and hotel, and send everyone a list of what to pack." +
                "\n\n" + "Mutable\n" + "These signs end every season—and have learned the hard lessons taught by spring, summer, fall and winter. They know that all good things come to an end, and their role is to prepare everyone for the changing of seasons. Mutable signs are the adapters of the zodiac, a little bit older and wiser. More flexible and comfortable with change than other signs, they can “chameleon” themselves to fit into a variety of situations. Mutables are also the editors of the zodiac—the ones who complete the package with a winning touch. A plan can be sparked by a cardinal sign, built by a fixed sign, then perfected with the critical eye of a mutable sign.\n";
        String allInfoHere = allElements + allQuality;
        allinfo.setText(allInfoHere);
        allinfo.setMovementMethod(new ScrollingMovementMethod());
    }
}
