package com.kosmo.clockpicker11_1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.DatePicker;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private static void onDateChanged(DatePicker dPicker, int year, int month, int date) {

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        DatePicker datePicker=findViewById(R.id.datePicker);
        datePicker.setOnDateChangedListener((view,year, month,date)->
                {
                    Toast.makeText(view.getContext(),String.format("%s-%s-%s",year,month+1,date),Toast.LENGTH_SHORT).show();
                }
        );
    }
}