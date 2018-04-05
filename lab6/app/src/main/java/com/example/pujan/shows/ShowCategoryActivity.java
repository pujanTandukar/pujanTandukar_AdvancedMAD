package com.example.pujan.shows;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ShowCategoryActivity extends ListActivity {

    private String showtype;
    int myNum = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        showtype = i.getStringExtra("showtype");

        //get the list view
        ListView listshows = getListView();

        //define an array adapter
        ArrayAdapter<Show> listAdapter;

        //initialize the array adapter with the right list of shows
        switch (showtype){
            case "Stranger Things":
                listAdapter = new ArrayAdapter<Show>(this, android.R.layout.simple_list_item_1, Show.strangerThings);
                myNum = 1;
                break;
            case "Friends":
                listAdapter = new ArrayAdapter<Show>(this, android.R.layout.simple_list_item_1, Show.friends);
                myNum = 2;
                break;
            case "How I Met Your Mother":
                listAdapter = new ArrayAdapter<Show>(this, android.R.layout.simple_list_item_1, Show.himym);
                myNum = 3;
                break;
            default: listAdapter = new ArrayAdapter<Show>(this, android.R.layout.simple_list_item_1, Show.strangerThings);
        }

        //set the array adapter on the list view
        listshows.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(ShowCategoryActivity.this, ShowActivity.class);
        intent.putExtra("showid", (int) id);
        intent.putExtra("showidname", myNum);
        startActivity(intent);
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
                Intent intent = new Intent(this, OrderActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}

