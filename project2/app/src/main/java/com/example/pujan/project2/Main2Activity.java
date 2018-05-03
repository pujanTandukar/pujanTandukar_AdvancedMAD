package com.example.pujan.project2;

import android.app.ActivityOptions;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Scanner;

public class Main2Activity extends AppCompatActivity {

    ArrayList<JSONObject> zodiacArray;
    private ProgressDialog pDialog;
    private String myZodiacSign;
    zodiac myZodiacFinal = new zodiac();
    String myHoroscopeToday;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        String zodiacSign = (String) getIntent().getExtras().get("zodiacSign");
        myZodiacSign = zodiacSign;
        new GetContacts().execute();
        String todayHoro = "";
        ImageButton infoButton = findViewById(R.id.imageButton8);
//        getHoroscope("Aries");
    }

    public void onClickButtonInfo(View v)
    {
        Intent intent = new Intent(this, Main3Activity.class);
        startActivity(intent, ActivityOptions.makeSceneTransitionAnimation(this).toBundle());
    }

    public static String getHoroscope(String sign) {

        sign = sign.toLowerCase();
        String horoscopeFinal = "";
        String url = "http://theastrologer-api.herokuapp.com/api/horoscope/" + sign + "/today";
        String charset = "UTF-8";

        try {
            URLConnection connection = new URL(url).openConnection();
            connection.setRequestProperty("Accept-Charset", charset);
            InputStream response = connection.getInputStream();

            String jsonBody = "";

            try (Scanner scanner = new Scanner(response)) {
                jsonBody += scanner.useDelimiter("\\A").next();
            }

            JSONObject obj = new JSONObject(jsonBody);
            String horoscope = obj.getString("horoscope");
            horoscopeFinal = horoscope;
            Log.d("HOROSCOPE:",horoscope);
            return horoscope;

        } catch(IOException e) {
            return "Problem retrieving horoscope";
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return horoscopeFinal;
    }

    public String todayHoro = "";
    public void updateZodiac(){
        ImageView zodiacSymbol = findViewById(R.id.imageView);
        ImageView zodiacElementSymbol = findViewById(R.id.imageView3);

        TextView zodiacName = findViewById(R.id.textView7);
        zodiacName.setText(myZodiacFinal.getName());

        switch(myZodiacSign){
            case "Aries":
                zodiacSymbol.setImageResource(R.drawable.aries1);
                zodiacElementSymbol.setImageResource(R.drawable.fire);
                todayHoro = "aries";
                break;
            case "Taurus":
                zodiacSymbol.setImageResource(R.drawable.taurus1);
                zodiacElementSymbol.setImageResource(R.drawable.earth);
                todayHoro = "taurus";
                break;
            case "Gemini":
                zodiacSymbol.setImageResource(R.drawable.gemini1);
                zodiacElementSymbol.setImageResource(R.drawable.air);
                todayHoro = "gemini";
                break;
            case "Cancer":
                zodiacSymbol.setImageResource(R.drawable.cancer1);
                zodiacElementSymbol.setImageResource(R.drawable.water);
                todayHoro = "cancer";
                break;
            case "Leo":
                zodiacSymbol.setImageResource(R.drawable.leo1);
                zodiacElementSymbol.setImageResource(R.drawable.fire);
                todayHoro = "leo";
                break;
            case "Virgo":
                zodiacSymbol.setImageResource(R.drawable.virgo1);
                zodiacElementSymbol.setImageResource(R.drawable.earth);
                todayHoro = "virgo";
                break;
            case "Libra":
                zodiacSymbol.setImageResource(R.drawable.libra1);
                zodiacElementSymbol.setImageResource(R.drawable.air);
                todayHoro = "libra";
                break;
            case "Scorpio":
                zodiacSymbol.setImageResource(R.drawable.scorpio1);
                zodiacElementSymbol.setImageResource(R.drawable.water);
                todayHoro = "scorpio";
                break;
            case "Sagittarius":
                zodiacSymbol.setImageResource(R.drawable.sagittarius1);
                zodiacElementSymbol.setImageResource(R.drawable.fire);
                todayHoro = "sagittarius";
                break;
            case "Capricorn":
                zodiacSymbol.setImageResource(R.drawable.capricorn1);
                zodiacElementSymbol.setImageResource(R.drawable.earth);
                todayHoro = "capricorn";
                break;
            case "Aquarius":
                zodiacSymbol.setImageResource(R.drawable.aquarius1);
                zodiacElementSymbol.setImageResource(R.drawable.air);
                todayHoro = "aquarius";
                break;
            case "Pisces":
                zodiacSymbol.setImageResource(R.drawable.pisces1);
                zodiacElementSymbol.setImageResource(R.drawable.water);
                todayHoro = "pisces";
                break;
            default:
                zodiacSymbol.setImageResource(R.drawable.aries1);
                zodiacElementSymbol.setImageResource(R.drawable.fire);
        }

        TextView zodiacDate = findViewById(R.id.textView8);
        zodiacDate.setText(myZodiacFinal.getDate());

        TextView zodiacElement = findViewById(R.id.element);
        zodiacElement.setText("Element: " + myZodiacFinal.getElement());

        TextView zodiacQuality = findViewById(R.id.quality);
        zodiacQuality.setText("Quality: " + myZodiacFinal.getQuality());

        TextView zodiacColor = findViewById(R.id.color);
        zodiacColor.setText("Color: " + myZodiacFinal.getColor());

        TextView zodiacRuler = findViewById(R.id.ruler);
        zodiacRuler.setText("Ruler: " + myZodiacFinal.getRuler());

        TextView zodiacTrait= findViewById(R.id.traits);
        zodiacTrait.setText(myZodiacFinal.getTrait());

        TextView zodiacStrength = findViewById(R.id.strength);
        zodiacStrength.setText("Strengths: " + myZodiacFinal.getStrength());

        TextView zodiacWeak = findViewById(R.id.weakness);
        zodiacWeak.setText("Weakeness: "  + myZodiacFinal.getWeakness());

        TextView zodiacGloss = findViewById(R.id.textView19);
        zodiacGloss.setText(myZodiacFinal.getGloss());

        TextView dailyHoro = findViewById(R.id.textView9);
        dailyHoro.setText("Today's Horoscope: " + myHoroscopeToday);
        dailyHoro.setMovementMethod(new ScrollingMovementMethod());
    }

    public static int getImageId(Context context, String imageName) {
        return context.getResources().getIdentifier("drawable/" + imageName, null, context.getPackageName());
    }

    private String TAG = MainActivity.class.getSimpleName();

//    private static String url = "https://github.com/pujanTandukar/zodiacJson/blob/master/zodiac.json";
//    private static String url = "https://api.myjson.com/bins/lec96";
    private static String url = "https://api.myjson.com/bins/18kbei";
    String ex1 = "http://theastrologer-api.herokuapp.com/api/horoscope/" + todayHoro + "/today";
//    private static String url2 = "http://theastrologer-api.herokuapp.com/api/horoscope/" +  + "/today";
//    private static String url2 = "http://theastrologer-api.herokuapp.com/api/horoscope/" + "aries" + "/today";


    private class GetContacts extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(Main2Activity.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();
        }

        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();
            updateZodiac();
            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(url);
            String jsonStrHoroscope = sh.makeServiceCall("http://theastrologer-api.herokuapp.com/api/horoscope/" + todayHoro + "/today");


            if (jsonStrHoroscope != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStrHoroscope);
                    String zodiacJson1 = jsonObj.getString("horoscope");
                    myHoroscopeToday = zodiacJson1;
                    Log.d("horoscope", String.valueOf(zodiacJson1));
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(), "Json parsing error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }

            Log.e(TAG, "Response from url: " + jsonStr);

            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);
                    JSONObject signFam;
                    // Getting JSON Array node
                    JSONObject zodiacJson = jsonObj.getJSONObject("western_zodiac");

                    switch (myZodiacSign){
                        case "Aries":
                            signFam = zodiacJson.getJSONObject("Aries");
                            myZodiacFinal.setName("Aries");
                            break;

                        case "Taurus":
                            signFam = zodiacJson.getJSONObject("Taurus");
                            myZodiacFinal.setName("Taurus");
                            break;

                        case "Gemini":
                            signFam = zodiacJson.getJSONObject("Gemini");
                            myZodiacFinal.setName("Gemini");
                            break;

                        case "Cancer":
                            signFam = zodiacJson.getJSONObject("Cancer");
                            myZodiacFinal.setName("Cancer");
                            break;

                        case "Leo":
                            signFam = zodiacJson.getJSONObject("Leo");
                            myZodiacFinal.setName("Leo");
                            break;

                        case "Virgo":
                            signFam = zodiacJson.getJSONObject("Virgo");
                            myZodiacFinal.setName("Virgo");
                            break;

                        case "Libra":
                            signFam = zodiacJson.getJSONObject("Libra");
                            myZodiacFinal.setName("Libra");
                            break;

                        case "Scorpio":
                            signFam = zodiacJson.getJSONObject("Scorpio");
                            myZodiacFinal.setName("Scorpio");
                            break;

                        case "Sagittarius":
                            signFam = zodiacJson.getJSONObject("Sagittarius");
                            myZodiacFinal.setName("Sagittarius");
                            break;

                        case "Capricorn":
                            signFam = zodiacJson.getJSONObject("Capricorn");
                            myZodiacFinal.setName("Capricorn");
                            break;

                        case "Aquarius":
                            signFam = zodiacJson.getJSONObject("Aquarius");
                            myZodiacFinal.setName("Aquarius");
                            break;

                        case "Pisces":
                            signFam = zodiacJson.getJSONObject("Pisces");
                            myZodiacFinal.setName("Pisces");
                            break;

                        default:
                            signFam = zodiacJson.getJSONObject("Aries");
                            myZodiacFinal.setName("Aries");
                            break;
                    }

                    myZodiacFinal.setColor(signFam.getString("color"));
                    myZodiacFinal.setGloss(signFam.getString("gloss"));
                    myZodiacFinal.setDate(signFam.getString("date"));
                    myZodiacFinal.setElement(signFam.getString("element"));
                    myZodiacFinal.setQuality(signFam.getString("quality"));
                    myZodiacFinal.setRuler(signFam.getString("ruling_body_classic"));
                    myZodiacFinal.setStrength(signFam.getString("strengths"));
                    myZodiacFinal.setWeakness(signFam.getString("weakness"));
                    myZodiacFinal.setTrait(signFam.getString("trait"));

                    Log.d("myZodiac name:", myZodiacFinal.getName());
                    Log.d("myZodiac date:", myZodiacFinal.getDate());
                    Log.d("myZodiac element:", myZodiacFinal.getElement());
                    Log.d("myZodiac gloss:", myZodiacFinal.getGloss());
                    Log.d("myZodiac color:", myZodiacFinal.getColor());
                    Log.d("myZodiac ruler:", myZodiacFinal.getRuler());
                    Log.d("myZodiac strength:", myZodiacFinal.getStrength());
                    Log.d("myZodiac weakness:", myZodiacFinal.getWeakness());
                    Log.d("myZodiac trait:", myZodiacFinal.getTrait());

                }
                catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
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
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();
                updateZodiac();
        }

    }

}
