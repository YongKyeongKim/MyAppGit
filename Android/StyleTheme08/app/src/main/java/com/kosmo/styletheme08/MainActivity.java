package com.kosmo.styletheme08;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        /*
         themes.xml에 내가 만든 테마를 자바코드로 적용]-setTheme
         내가 만든 리소스는 R.java(R클래스)에 자동으로 등록됨
         고로 내가 만든 자원은 R.리소스종류 로 접근한다.
        */
        //setTheme(R.style.StyleMadeByMe);//Theme를 자바코드로 적용
        /*
         안드로이드에서 제공하는 리소스 사용시는
         자바코드:android.R시작 레이아웃용 xml:@android로 시작*/
        setTheme(android.R.style.Theme_Material);
        //액션바 없애기
        //1.themes.xml에서
        //Theme.MaterialComponents.DayNight.NoActionBar 테마 사용
        //혹은
        //Theme.AppCompat.NoActionBar
        //혹은
        //2.자바코드로
        
        //getSupportActionBar().hide();//자바코드로 액션바 없애기

        setContentView(R.layout.activity_main);
    }
}