package com.kosmo.ratingbar14;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.RatingBar;

import com.kosmo.ratingbar14.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        RatingBar bar1 = binding.ratingbar1;
        RatingBar bar2 = binding.ratingbar2;
        RatingBar bar3 = binding.ratingbar3;

        //버튼에 리스너 부착
        binding.buttonInc.setOnClickListener(v->{
            //기존 rating값+RatingBar의 stepSize값
            bar1.setRating(bar1.getRating()+bar1.getStepSize());
            bar2.setRating(bar2.getRating()+bar2.getStepSize());
            bar3.setRating(bar3.getRating()+bar3.getStepSize());
        });
        binding.buttonDecs.setOnClickListener(v->{
            //기존 rating값-RatingBar의 stepSize값
            bar1.setRating(bar1.getRating()-bar1.getStepSize());
            bar2.setRating(bar2.getRating()-bar2.getStepSize());
            bar3.setRating(bar3.getRating()-bar3.getStepSize());
        });
    }
}