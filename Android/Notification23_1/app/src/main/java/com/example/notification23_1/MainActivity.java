package com.example.notification23_1;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.util.Log;
import android.widget.Toast;

import com.example.notification23_1.databinding.ActivityMainBinding;
import com.example.notification23_1.databinding.CustomLayoutBinding;

public class MainActivity extends AppCompatActivity {
    private ActivityMainBinding binding;
    private CustomLayoutBinding customLayoutBinding;

    private String[] sports;
    private int which_radio=-1;
    private boolean[] which_checks = {true,false,true,false};
    //프로그래스 대화상자관련 변수
    private AlertDialog progressDialog;
    private AlertDialog customDialog;
    //방법1-안드로이드에서 제공하는 CountDownTimer 클래스 사용(로그인 창 닫기)
    private CountDownTimer timer;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding=ActivityMainBinding.inflate(getLayoutInflater());
        customLayoutBinding=CustomLayoutBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        timer = new CountDownTimer(3000,1000) {
            @Override
            public void onTick(long l) {
                Log.i("com.example.notifi","1초마다호출");
            }

            @Override
            public void onFinish() {
                Log.i("com.example.notifi","3초후에호출");
                if(progressDialog != null) progressDialog.dismiss();
            }
        };

        //기본대화상자
        binding.btnAlertBasic.setOnClickListener(v->{
            new AlertDialog.Builder(v.getContext())
                    .setCancelable(false)//alert 시 바깥 클릭시 cancel-->true
                    .setIcon(android.R.drawable.ic_menu_camera)
                    .setTitle("올레서비스")
                    .setMessage("올레서비스에 가입하시겠습니까?")
                    .setPositiveButton("예", (dialog,which)->{
                        Toast.makeText(v.getContext(),"가입절차를 진행하겠습니다",Toast.LENGTH_SHORT).show();
                    })
                    .setNegativeButton("아니오",null)
                    .show();
        });
        //목록형 대화상자
        String[] sports = getResources().getStringArray(R.array.sports);
        binding.btnAlertItems.setOnClickListener(v->{
            new AlertDialog.Builder(v.getContext())
                    .setCancelable(false)//alert 시 바깥 클릭시 cancel-->true
                    .setIcon(android.R.drawable.ic_dialog_email)
                    .setTitle("당신이 좋아하는 스포츠는?")
                    //.setMessage("당신이 좋아하는 스포츠는?")
                    .setItems(sports, (dialog,which)->{
                        Toast.makeText(v.getContext(),"당신이 좋아하는 스포츠는 "+sports[which],Toast.LENGTH_SHORT).show();
                    })
                    //.setPositiveButton("예", (dialog,which)->{
                    //    Toast.makeText(v.getContext(),"가입절차를 진행하겠습니다",Toast.LENGTH_SHORT).show();
                    //})
                    .setNegativeButton("아니오",null)
                    .show();
        });
        //라디오 대화상자
        binding.btnAlertRadio.setOnClickListener(v->{
            new AlertDialog.Builder(v.getContext())
                    .setCancelable(false)//alert 시 바깥 클릭시 cancel-->true
                    .setIcon(android.R.drawable.ic_menu_save)
                    .setTitle("당신이 좋아하는 스포츠는?")
                    .setSingleChoiceItems(sports,-1,(dialog,which)->{
                        which_radio=which;
                    })
                    .setPositiveButton("예", (dialog,which)->{
                        Toast.makeText(v.getContext(),"당신이 좋아하는 스포츠는 "+sports[which_radio],Toast.LENGTH_SHORT).show();
                    })
                    .setNegativeButton("아니오",null)
                    .show();
        });
        //체크박스용 대화상자
        binding.btnAlertCheck.setOnClickListener(v->{
            new AlertDialog.Builder(v.getContext())
                    .setCancelable(false)//alert 시 바깥 클릭시 cancel-->true
                    .setIcon(android.R.drawable.ic_menu_compass)
                    .setTitle("당신이 좋아하는 스포츠는?")
                    .setMultiChoiceItems(sports, which_checks, (dialog,which,isChecked)->{
                        which_checks[which]=isChecked;
                    })
                    .setPositiveButton("예", (dialog,which)->{
                        String checked="";
                        for(int i=0;i<which_checks.length;i++){
                            if(which_checks[i]) checked+=sports[i]+" ";
                        }
                        Toast.makeText(v.getContext(),"당신이 선택한 종목들: "+ checked,Toast.LENGTH_SHORT).show();
                    })
                    .setNegativeButton("아니오",null)
                    .show();
        });
        //프로그래스 다이얼 로그
        binding.btnProgress.setOnClickListener(v->{
            //1.빌더로 AlertDialog 선택
            progressDialog= new AlertDialog.Builder(v.getContext())
                    .setCancelable(false)
                    .setIcon(android.R.drawable.ic_dialog_info)
                    .setTitle("로그인")
                    .setView(R.layout.progress_layout)
                    .create();
            //2.AlertDialog의 show()보이기
            progressDialog.show();
            timer.start();
        });
        //커스텀 대화상자
        //dialog1회만 생성
        customDialog=new AlertDialog.Builder(this)
                        .setCancelable(false)
                        .setIcon(android.R.drawable.ic_menu_compass)
                        .setTitle("커스텀 대화상자")
                        .setView(customLayoutBinding.getRoot())
                        .create();
        //커스텀 대화상자의 버튼 이벤트처리
        customLayoutBinding.btnOk.setOnClickListener(v->{
            String likeSports = customLayoutBinding.editText.getText().toString();
            Toast.makeText(getApplicationContext(),"당신의 최애 스포츠는 "+likeSports,Toast.LENGTH_SHORT).show();
        });
        binding.btnCustom.setOnClickListener(v->{
            if(customDialog != null && !customDialog.isShowing()){
                customDialog.show();
            }
        });

    }/////////////onCreate

}//클래스