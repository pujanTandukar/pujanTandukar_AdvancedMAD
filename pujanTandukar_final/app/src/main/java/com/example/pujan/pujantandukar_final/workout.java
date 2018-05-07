package com.example.pujan.pujantandukar_final;

/**
 * Created by pujan on 5/6/18.
 */

public class workout {
    private  String name;
    private String website;

    private workout(String newName, String newWebsite){
        this.name = newName;
        this.website = newWebsite;
    }

    public static final workout[] cardio = {
            new workout("Running","https://en.wikipedia.org/wiki/Running"),
            new workout("Hiking","https://en.wikipedia.org/wiki/Hiking"),
            new workout("Biking","https://en.wikipedia.org/wiki/Biking"),
    };
    public static final workout[] strength = {
            new workout("Weights","https://en.wikipedia.org/wiki/Weight_training"),
            new workout("Yoga","https://en.wikipedia.org/wiki/Yoga"),
            new workout("Biking","https://en.wikipedia.org/wiki/Biking"),
    };
    public static final workout[] flexibility = {
            new workout("Yoga","https://en.wikipedia.org/wiki/Yoga"),
            new workout("Stretches","https://en.wikipedia.org/wiki/Stretching"),
    };

    public String getName(){

        return name;

    }
    public String getWebsite(){

        return website;
    }

    //the string representation of a show is its name
    public String toString(){
        return this.name;
    }

}

