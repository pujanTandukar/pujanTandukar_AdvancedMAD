package com.example.pujan.pujantandukar_final;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class Main2Activity extends Activity  {

    String workoutType;
    int myNum = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Intent i = getIntent();
        workoutType = i.getStringExtra("workoutType");

        //get the list view
//        ListView listshows = getListView();

        //define an array adapter
        ArrayAdapter<workout> listAdapter;

        //initialize the array adapter with the right list of shows
        switch (workoutType){
            case "cardio":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.cardio);
                myNum = 1;
                break;
            case "strength":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.strength);
                myNum = 2;
                break;
            case "flexibility":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.flexibility);
                myNum = 3;
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.flexibility);
        }

        //set the array adapter on the list view
//        listshows.setAdapter(listAdapter);
    }

}
