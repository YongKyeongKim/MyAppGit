package com.kosmo.tablelayout04;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //위젯 얻기]
        EditText user= findViewById(R.id.user);
        EditText pass= findViewById(R.id.pass);
        Button btnOk = findViewById(R.id.btnOk);
        Button btnCancel = findViewById(R.id.btnCancel);

        //버튼에 리스너 부착]
        /*
         btnOk.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
             }
         });*/
        btnOk.setOnClickListener(view ->{
            String username=user.getText().toString();
            String password=pass.getText().toString();
            Toast.makeText(view.getContext(),String.format("아이디:%s,비번:%s",username,password),Toast.LENGTH_SHORT).show();
        });

        btnCancel.setOnClickListener(view->{
            //텍스트 클리어
            user.setText("");
            pass.setText("");
            //포커스 주기
            user.requestFocus();
        });


    }
}