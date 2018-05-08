package com.example.pujan.lab9_extracredit;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference ref = database.getReference();
    DatabaseReference bookref = database.getReference("recipes");

    List books = new ArrayList<>();
    ArrayAdapter<Books> listAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                //create a vertical linear layout to hold edit texts
                LinearLayout layout = new LinearLayout(MainActivity.this);
                layout.setOrientation(LinearLayout.VERTICAL);

                //create edit texts and add to layout
                final EditText nameEditText = new EditText(MainActivity.this);
                nameEditText.setHint("Book name");
                layout.addView(nameEditText);
                final EditText authorEditText = new EditText(MainActivity.this);
                authorEditText.setHint("Author");
                layout.addView(authorEditText);

                //create alert dialog
                AlertDialog.Builder dialog = new AlertDialog.Builder(MainActivity.this);
                dialog.setTitle("Add Book");
                dialog.setView(layout);
                dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //get entered data
                        String recipeName = nameEditText.getText().toString();
                        String recipeURL = authorEditText.getText().toString();
                        if (recipeName.trim().length() > 0) {
                            //get new id from firebase
                            String key = bookref.push().getKey();
                            //create new recipe item
                            Books newBook = new Books(key, recipeName, recipeURL);
                            //add to Firebase
                            bookref.child(key).child("name").setValue(newBook.getName());
                            bookref.child(key).child("url").setValue(newBook.getAuthor());
                        }
                    }
                });
                dialog.setNegativeButton("Cancel", null);
                dialog.show();
            }
        });

        ListView recipeList = (ListView) findViewById(R.id.listView);
        listAdapter = new ArrayAdapter<Books>(this, android.R.layout.simple_list_item_1, books);
        recipeList.setAdapter(listAdapter);

        // Read from the database
        ValueEventListener firebaseListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                books.clear();

                for(DataSnapshot snapshot : dataSnapshot.getChildren()){
                    // gets the item id
                    String newId = snapshot.getKey();
                    Books bookItem = snapshot.getValue(Books.class);
                    Books newBook = new Books(newId, bookItem.getName(), bookItem.getAuthor());
                    books.add(newBook);
                }
                //update adapter
                listAdapter.notifyDataSetChanged();
            }

            @Override
            public void onCancelled(DatabaseError error) {
                // Failed to read value
                Log.w("oncreate", "Failed to read value.", error.toException());
            }
        };

        //add listener to the database recipe node reference
        bookref.addValueEventListener(firebaseListener);
        registerForContextMenu(recipeList);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                //get tapped recipe
                Books recipeTapped = (Books) books.get(position);
                //get the recipe url
                String recipeURL = recipeTapped.getAuthor();
                //create new intent
                Intent intent = new Intent(Intent.ACTION_VIEW);
                //add url to intent
                intent.setData(Uri.parse(recipeURL));
                //start intent
                startActivity(intent);
            }
        };
//        recipeList.setOnItemClickListener(itemClickListener);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.menu_recipe_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get recipe name that was pressed
        String recipename = ((TextView) adapterContextMenuInfo.targetView).getText().toString();
        //set the menu title
        menu.setHeaderTitle("Delete " + recipename);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //get recipe that was pressed
            Books selectedRecipe = (Books) books.get(info.position);
            //get recipe id
            String recipeid = selectedRecipe.getId();
            //delete from Firebase
            bookref.child(recipeid).removeValue();
        }
        return true;
    }
}
