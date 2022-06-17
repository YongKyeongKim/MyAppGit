package com.kosmo.customview10_3;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.kosmo.customview10_3.view.CustomEditText;

public class MainActivity extends AppCompatActivity {

    //기본 에디트 텍스트상자에 입력된문자열의 길이 저장용
    private int textLength;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //위젯 얻기
        TextView textView = findViewById(R.id.textview);
        EditText editText = findViewById(R.id.basicEditText);
        LinearLayout layout = findViewById(R.id.linearlayout);
        //1]내가 만든 EditText를 자바코드로 부착하는 경우
        //CustomEditText customEditText = new CustomEditText(this);
        //customEditText.setHint("내가 만든 에디티 텍스트");
        //레이아웃에 부착 :addView(View view)
       // layout.addView(customEditText);
        //2]xml에 내가 만든 EditText를 태그로 등록한 경우
        CustomEditText customEditText = findViewById(R.id.customEditText);



        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence text, int start, int count, int before) {
                Log.i("com.kosmo.customview","기본 에디트 텍스트:[beforeTextChanged]");
            }
            @Override
            public void onTextChanged(CharSequence text, int start, int before, int after) {
                /*
                text:에디트 텍스트에 입력된 문자열
                start:새로 추가되거나 삭제된 문자열의 시작 인덱스
                before:삭제된 문자열의 갯수
                after:새로 추가된 문자열의 갯수
                 */
                Log.i("com.kosmo.customview",
                        String.format("text:%s,start:%s,before:%s,after:%s",text,start,before,after));
                textLength +=after-before;
                textView.setText(String.valueOf(textLength));
            }
            @Override
            public void afterTextChanged(Editable editable) {
                Log.i("com.kosmo.customview","기본 에디트 텍스트:[afterTextChanged]");
            }
        });
        //나만의 에디트 텍스트의 텍스트변화 코딩

        customEditText.setOnTextLengthListener(textLength->{
            textView.setText(String.valueOf(textLength));
        });


    }
}