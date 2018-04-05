package com.example.pujan.shows;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

public class ShowActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show);

//    get show id from the intent
        int shownum = (Integer) getIntent().getExtras().get("showid");
        int shownumname = (Integer) getIntent().getExtras().get("showidname");

        Show show;
        switch (shownumname){
            case 1:
                show = Show.strangerThings[shownum];
                break;
            case 2:
                show = Show.friends[shownum];
                break;
            case 3:
                show = Show.himym[shownum];
                break;
            default:
                show = Show.strangerThings[shownum];
        }

        //populate image
        ImageView bulbImage = (ImageView)findViewById(R.id.imageView3);
        bulbImage.setImageResource(show.getImageResourceID());

        //populate name
        TextView showName = (TextView) findViewById(R.id.textView2);
        showName.setText(show.getName());
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
