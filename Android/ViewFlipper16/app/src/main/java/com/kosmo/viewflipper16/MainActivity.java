package com.kosmo.viewflipper16;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ViewFlipper;

import com.kosmo.viewflipper16.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;
    private ViewFlipper flipper;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView( binding.getRoot());

        flipper = binding.flipper;
        //플립핑 간격 설정-자동으로 플립핑시]
        flipper.setFlipInterval(1000);

        //버튼에 리스너 부착
        binding.btnNext.setOnClickListener(handler);
        binding.btnPrev.setOnClickListener(handler);
        binding.btnStart.setOnClickListener(handler);
        binding.btnStop.setOnClickListener(handler);
    }
    //이벤트 핸들러
    private View.OnClickListener handler = v->{
        if(v.getId()==R.id.btn_prev) flipper.showPrevious();
        else if(v.getId()==R.id.btn_next) flipper.showNext();
        else if(v.getId()==R.id.btn_start) flipper.startFlipping();//자동 플립핑
        else flipper.stopFlipping();//자동 플립핑 중지
    };
}