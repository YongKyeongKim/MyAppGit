package com.kosmo.tablayoutviewpager18;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.viewpager2.widget.ViewPager2;

import android.os.Bundle;


import com.google.android.material.tabs.TabLayout;
import com.kosmo.tablayoutviewpager18.databinding.ActivityMainBinding;
import com.kosmo.tablayoutviewpager18.model.MyPagerAdapter;
import com.kosmo.tablayoutviewpager18.view.TabContent1;
import com.kosmo.tablayoutviewpager18.view.TabContent2;
import com.kosmo.tablayoutviewpager18.view.TabContent3;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;


//Material View Pager Dots Indicator
//https://github.com/tommybuonomo/dotsindicator
public class MainActivity extends AppCompatActivity {
    private ActivityMainBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());


        //1.탭 메뉴 추가후 실행후 앱에서 확인
        binding.tabLayout.addTab(binding.tabLayout.newTab().setText("HOME").setIcon(R.drawable.home));
        binding.tabLayout.addTab(binding.tabLayout.newTab().setIcon(R.drawable.contact).setText("연락처"));
        binding.tabLayout.addTab(binding.tabLayout.newTab().setText("설정").setIcon(R.drawable.settings));
        //2.Fragment 생성후 컬렉션에 저장
        TabContent1 tabContent1 = new TabContent1();
        TabContent2 tabContent2 = new TabContent2();
        TabContent3 tabContent3 = new TabContent3();
        List<Fragment> fragments = Arrays.asList(tabContent1,tabContent2,tabContent3);

        //3.PageAdapter객체 생성
        MyPagerAdapter adapter = new MyPagerAdapter(this,fragments);
        //4.ViewPager에 PageAdapter를 연결 - 앱 실행시 탭 메뉴 이벤트가 작동 안됨
        binding.viewPager.setAdapter(adapter);
        binding.dotsIndicator.attachTo(binding,viewPager);
        //5.탭 메뉴 이벤트 처리
        binding.tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            //탭이 선택되었을때 자동 호출
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                //viewPager.setCurrentItem(탭메뉴인덱스) 호출시
                //어댑터의 createFragment(int position)가 호출된다
                binding.viewPager.setCurrentItem(tab.getPosition());
            }
            //탭이 선택되지 않았을때
            @Override
            public void onTabUnselected(TabLayout.Tab tab) {}
            //탭이 다시 선택되었을때
            @Override
            public void onTabReselected(TabLayout.Tab tab) {}
        });


    }
}