package com.example.pujan.pujantandukar_final;

import android.app.ListActivity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.GestureDetector;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class WorkoutCategoryActivity extends ListActivity {

    String workoutType;
    int myNum = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        workoutType = i.getStringExtra("work");

        //get the list view
        ListView listshows = getListView();

        //define an array adapter
        ArrayAdapter<workout> listAdapter;

        //initialize the array adapter with the right list of shows
        switch (workoutType){
            case "Cardio":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.cardio);
                myNum = 1;
                break;
            case "Strength":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.strength);
                myNum = 2;
                break;
            case "Flexibility":
                listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.flexibility);
                myNum = 3;
                break;
            default: listAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, workout.cardio);
        }

//        Button newButton;
//        newButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                AddWorkout(v);
//            }
//        });
        //set the array adapter on the list view
        listshows.setAdapter(listAdapter);
    }

    private void AddWorkout(View v) {
//        workout a = new workout("name","website");
    }


    final GestureDetector gestureDetector = new GestureDetector(new GestureDetector.SimpleOnGestureListener() {
        public void onLongPress(MotionEvent e) {
            Log.e("", "Longpress detected");
        }
    });

    public boolean onTouchEvent(MotionEvent event) {
        return gestureDetector.onTouchEvent(event);
    };


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){

        workout show;
        switch (myNum){
            case 1:
                show = workout.cardio[(int)id];
                break;
            case 2:
                show = workout.strength[(int)id];
                break;
            case 3:
                show = workout.flexibility[(int)id];
                break;
            default:
                show = workout.cardio[(int)id];
        }

        String myString = show.getWebsite();
        Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(myString));
        startActivity(browserIntent);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.create_order:
                //start order activity
                Intent intent = new Intent(this, SignUp.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
