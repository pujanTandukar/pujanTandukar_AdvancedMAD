package com.example.pujan.lab9_extracredit;

/**
 * Created by pujan on 5/7/18.
 */

public class Books {
    private String id;
    private String name;
    private String author;

    public Books(){}

    public Books(String newId, String newName, String newAuthor){
        id = newId;
        name = newName;
        author = newAuthor;
    }

    public String getName(){
        return name;
    }
    public String getId(){
        return id;
    }
    public String getAuthor(){
        return author;
    }
    public String toString(){
        return this.name;
    }
}

