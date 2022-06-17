package com.example.contextmenu22;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.graphics.Color;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;

public class MainActivity extends AppCompatActivity {
    private RelativeLayout layout;
    private Button btnBackground,btnOther;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //위젯얻기
        layout = findViewById(R.id.layout);
        btnBackground = findViewById(R.id.btnBackground);
        btnOther = findViewById(R.id.btnOther);
        //선행작업:위젯(뷰) 롱 클릭시 컨텍스트 메뉴가 뜨도록 설정]
        registerForContextMenu(btnBackground);
        registerForContextMenu(layout);
        registerForContextMenu(btnOther);
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        MenuInflater menuInflater = getMenuInflater();
        /*
        if(v.getId()==R.id.btnBackground){
            menuInflater.inflate(R.menu.menu_button,menu);
        }*/
        //1.모든 위젯의 공통 컨텍스트 메뉴 적용
        /*
        if(v == layout){
            menuInflater.inflate(R.menu.menu_layout,menu);
        }
        */

        if(v.getId()==R.id.btnBackground){
            menuInflater.inflate(R.menu.menu_btnbackground,menu);
        }
        else if(v==btnOther)
            menuInflater.inflate(R.menu.menu_btnother,menu);
        super.onCreateContextMenu(menu, v, menuInfo);
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case R.id.menuitem_red:
            layout.setBackground(Color.RED);break;
            case R.id.manutiem_green;

        }
        return super.onContextItemSelected(item);
    }
}