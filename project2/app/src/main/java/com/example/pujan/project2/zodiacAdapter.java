package com.example.pujan.project2;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

public class zodiacAdapter extends ArrayAdapter<zodiac>{

    public zodiacAdapter(@NonNull Context context, int resource, int textViewResourceId) {
        super(context, resource, textViewResourceId);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        return super.getView(position, convertView, parent);
    }

    static class viewHolder{
        public TextView elementName;
        public TextView qualityName;
        public TextView colorName;
        public TextView rulerName;
        public TextView strengthName;
        public TextView weaknessName;
    }
}
