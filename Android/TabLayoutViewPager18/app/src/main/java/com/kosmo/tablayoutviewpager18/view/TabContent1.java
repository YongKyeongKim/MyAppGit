package com.kosmo.tablayoutviewpager18.view;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.kosmo.tablayoutviewpager18.databinding.TabmenuLayout1Binding;

//1]Fragement상속
//※androidx.fragment.app.Fragment 상속
public class TabContent1 extends Fragment {

    private TabmenuLayout1Binding binding;
    //2]onCreateView()오버 라이딩
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //1.TabmenuLayout1Binding객체 생성
        binding = TabmenuLayout1Binding.inflate(inflater,container,false);
        //2.TabmenuLayout1Binding객체로 루트 뷰 얻기
        View view = binding.getRoot();
        //3.루트 뷰 반환
        return view;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding=null;
    }
}
