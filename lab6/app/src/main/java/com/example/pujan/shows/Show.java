package com.example.pujan.shows;

/**
 * Created by pujan on 4/4/18.
 */

public class Show {
    private  String name;
    private int imageResourceID;

    private Show(String newName, int newId){
        this.name = newName;
        this.imageResourceID = newId;
    }

    public static final Show[] strangerThings = {
            new Show("Eleven", R.drawable.el),
            new Show("Steve", R.drawable.steve),
            new Show("Nancy", R.drawable.nancy),
            new Show("Will", R.drawable.will),
    };
    public static final Show[] friends = {
            new Show("Monica", R.drawable.mon),
            new Show("Chandler", R.drawable.bing),
            new Show("Ross", R.drawable.ros),
            new Show("Rachael", R.drawable.rach),
    };
    public static final Show[] himym = {
            new Show("Ted", R.drawable.ted),
            new Show("Tracey", R.drawable.trac),
            new Show("Robin", R.drawable.robin),
            new Show("Barney", R.drawable.bar),
    };

    public String getName(){

        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a show is its name
    public String toString(){
        return this.name;
    }

}
