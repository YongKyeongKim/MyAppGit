package com.example.optionmenu21;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.widget.Toast;

import com.example.optionmenu21.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {
    private ActivityMainBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
    }
    //콜백 메소드: 옵션 메뉴를 생성하기 위한 메소드
    //inflater: xml에 있는 것들을 메모리에 생성하겠다.
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //getMenuInflater().inflate(R.menu.option_menu,menu);
        menu.add(Menu.NONE,101,1,"Opt Menu1").setIcon(R.drawable.home).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        menu.add(Menu.NONE,102,2,"Opt Menu2").setIcon(R.drawable.settings).setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);
        menu.add(Menu.NONE,103,3,"Opt Menu3").setIcon(R.drawable.contact).setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);
        menu.add(Menu.NONE,104,4,"Opt Menu4");
        menu.add(Menu.NONE,105,5,"Opt Menu5");
        menu.add(Menu.NONE,106,6,"Opt Menu6");

        SubMenu subMenu = menu.addSubMenu(Menu.NONE,107,7,"서브메뉴");
        subMenu.add(Menu.NONE,1,1,"Sub Menu1");
        subMenu.add(Menu.NONE,2,2,"Sub Menu2");
        subMenu.add(Menu.NONE,3,3,"Sub Menu3");
        return super.onCreateOptionsMenu(menu);
    }//////onCreateOptionsMenu
    //메뉴를 눌렀을때 처리
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch(item.getItemId()){
            case 101:
            case 102:
            case 103:
                Toast.makeText(this,item.getTitle(),Toast.LENGTH_SHORT).show();
                break;
            case 104: binding.getRoot().setBackgroundColor(Color.RED);break;
            case 105: binding.getRoot().setBackgroundColor(Color.GREEN);break;
            case 106: binding.getRoot().setBackgroundColor(Color.BLUE);break;
                /*
            case R.id.option_menu1:
            case R.id.option_menu2:
            case R.id.option_menu3:
                Toast.makeText(this,item.getTitle(),Toast.LENGTH_SHORT).show();
                break;
            case R.id.menuitem_red:
                binding.getRoot().setBackgroundColor(Color.RED);break;
            case R.id.menuitem_green:
                binding.getRoot().setBackgroundColor(Color.GREEN);break;
            case R.id.menuitem_blue:
                binding.getRoot().setBackgroundColor(Color.BLUE);break;
                 */
        }
        return super.onOptionsItemSelected(item);
    }
}////////Main