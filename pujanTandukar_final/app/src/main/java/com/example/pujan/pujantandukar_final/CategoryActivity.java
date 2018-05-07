package com.example.pujan.pujantandukar_final;

import android.app.ListActivity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class CategoryActivity extends ListActivity {

    String workoutType;
    int myNum = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        workoutType = i.getStringExtra("workoutType");

        //get the list view
        ListView listshows = getListView();

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
        listshows.setAdapter(listAdapter);
    }


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){

        Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.google.com"));
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
                Intent intent = new Intent(this, MainActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
