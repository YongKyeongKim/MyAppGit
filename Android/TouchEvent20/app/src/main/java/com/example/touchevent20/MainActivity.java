package com.example.touchevent20;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintSet;

import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import com.example.touchevent20.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {
    private ActivityMainBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        binding.btnClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.i("com.example.touch","버튼에서 클릭 이벤트 발생");
            }
        });
        binding.btnTouch.setOnTouchListener(new View.OnTouchListener(){
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if(motionEvent.getAction()==motionEvent.ACTION_DOWN)
                    Log.i("com.example.touch","버튼에서 터치(down) 이벤트 발생");
                else if(motionEvent.getAction()==motionEvent.ACTION_UP)
                    Log.i("com.example.touch","버튼에서 터치(up) 이벤트 발생");
                else if(motionEvent.getAction()==motionEvent.ACTION_MOVE)
                    Log.i("com.example.touch","버튼에서 터치(move) 이벤트 발생");
                return false;
            }
        });

        binding.imageview.setOnTouchListener((v,e)->{
            //true반환시 다른 뷰에 사용자의 터치 이벤트가 전달안됨
            Log.i("com.example.touch","이미지뷰에서 터치이벤트 발생");
            return true;
        });

    }/////////////onCreate

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        Log.i("com.example.touch","컨텍스트에서 터치이벤트 발생");
        return true;
    }/////////////onTouch
}