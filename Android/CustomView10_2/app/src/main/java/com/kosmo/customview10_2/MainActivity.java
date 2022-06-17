package com.kosmo.customview10_2;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.View;
import android.widget.Toast;

import com.kosmo.customview10_2.databinding.ActivityMainBinding;
import com.kosmo.customview10_2.databinding.ToastLayoutBinding;

public class MainActivity extends AppCompatActivity {
    //뷰바인딩
    //https://developer.android.com/topic/libraries/view-binding?hl=ko#java
    //findViewById대신 뷰결합 사용
    //1.build.gradle에 viewBinding {
    //        enabled = true
    //    }  추가후 sync now
    //2.앱 실행
    //3.Project탭으로 변경후 app->build->generated->data_binding_~밑에 바딩딩 클래스가 생성됨 확인
    private ActivityMainBinding binding;
    private ToastLayoutBinding  toastLayoutBinding;
    private View toastView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
        //ActivityMainBinding  인스턴스 생성
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        toastLayoutBinding = ToastLayoutBinding.inflate((getLayoutInflater()));
        //binding.getRoot()로 루트 뷰 얻기
        View view =binding.getRoot();
        toastView = toastLayoutBinding.getRoot();
        //루트 뷰를 전개
        setContentView(view);
        //binding객체로 뷰에 직접 접근
        //리스너 부착
        binding.btnShort.setOnClickListener(handler);
        binding.btnLong.setOnClickListener(handler);
        binding.btnCustom.setOnClickListener(handler);
    }///////////////
    private View.OnClickListener handler = view->{
        String msg=binding.infoMessage.getText().toString();
        if(view.getId()==R.id.btnShort){
            Toast.makeText(view.getContext(),msg,Toast.LENGTH_SHORT).show();
        }
        else if(view.getId()==R.id.btnLong)
            Toast.makeText(view.getContext(),msg,Toast.LENGTH_LONG).show();
        else{
            /*
            findViewById 사용시
            //내가 만든 레이아아웃을 토스트에 적용.
            //레이아웃용 xml을 메모리로 전개]-inflate 한다
            //방법1]View의 정적 메소드 inflate()
            //View view=View.inflate(v.getContext(),R.layout.toast_layout,null);
            //방법2]시스템 서비스 사용:Object getSystemService(Context의 String형 상수)
            //LayoutInflater  inflater=(LayoutInflater)getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            //View view = inflater.inflate(R.layout.toast_custom,null);
            //방법3]LayoutInflater의 정적 메소드인 from()메소드 사용
            //root : Optional view to be the parent of the generated hierarchy
            //root에 붙이지 않고 전개된 View만 얻고 싶을 때는 null지정
            //root지정시 전개와 동시에 root에 붙는다(LinearLayout 동적으로 생성해서 테스트)
            View view = LayoutInflater.from(v.getContext()).inflate(R.layout.toast_custom,null);
            TextView textView=view.findViewById(R.id.textView);
            textView.setText(msg);
            textView.setTextSize(TypedValue.COMPLEX_UNIT_SP,25);
            textView.setTextColor(Color.WHITE);
             */
            //바인딩 결합 사용시
            toastLayoutBinding.textView.setText(msg);
            toastLayoutBinding.textView.setTextSize(TypedValue.COMPLEX_UNIT_PX,getResources().getDimension(R.dimen.toast_size));
            toastLayoutBinding.textView.setTextColor(Color.WHITE);

            //공통코드
            //내가 만든 커스텀 토스트로 띄우기
            Toast toast = new Toast(view.getContext());
            toast.setDuration(Toast.LENGTH_SHORT);
            toast.setView(toastView);
            toast.show();
        }
    };
}