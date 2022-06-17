package com.kosmo.tablayoutviewpager18.view;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.kosmo.tablayoutviewpager18.R;
import com.kosmo.tablayoutviewpager18.databinding.TabmenuLayout1Binding;

//1]Fragement상속
//※androidx.fragment.app.Fragment 상속
public class TabContent2 extends Fragment {
    //2]onCreateView()오버 라이딩
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.tabmenu_layout2,container,false);
    }

}
