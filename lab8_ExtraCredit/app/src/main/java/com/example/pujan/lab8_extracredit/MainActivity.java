package com.example.pujan.lab8_extracredit;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity {
    ListView colorList;
    private String TAG = MainActivity.class.getSimpleName();
    Color[] colorArrayDisplay = new Color[5000];
    List<String> colorNames = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        colorList = findViewById(R.id.listView);
        new getColors().execute();

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                String coName = (String) listView.getItemAtPosition(position);
                Intent intent = new Intent(MainActivity.this, Main2Activity.class);
                intent.putExtra("name", colorArrayDisplay[position].name);
                intent.putExtra("hex", colorArrayDisplay[position].rgb);
                intent.putExtra("rbg", colorArrayDisplay[position].hex);
                //start intent
                startActivity(intent);
            }
        };
        colorList.setOnItemClickListener(itemClickListener);
    }

    void doThis(){
        ArrayAdapter<String> listAdapter123 = new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,colorNames);
        colorList.setAdapter(listAdapter123);
    }

    @SuppressLint("StaticFieldLeak")
    private class getColors extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();
            String colorJson = sh.makeServiceCall("https://api.myjson.com/bins/csy4y");

            if (colorJson != null) {
                try {
                    JSONArray jsonArray = new JSONArray(colorJson);
                    int len = jsonArray.length();
                    for (int i=0;i<len;i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        Color temp = new Color();
                        temp.rgb = jsonObject.getString("rgb");
                        temp.name = jsonObject.getString("name");
                        temp.hex = jsonObject.getString("hex");
                        colorNames.add(temp.name);
                        colorArrayDisplay[i] = temp;
                    }
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[0].name));
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[0].hex));
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[0].rgb));

                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[1].name));
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[2].name));
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[2]));
                    Log.d("PUJANPUJANPUJANSAMPADA", String.valueOf(colorArrayDisplay[0]));
                }

                catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(), "Json parsing error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }
            else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                            "Couldn't get json from server. Check LogCat for possible errors!",
                            Toast.LENGTH_LONG)
                            .show();
                    }
                });
            }
            return null;
        }
        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            doThis();
        }

    }
}
