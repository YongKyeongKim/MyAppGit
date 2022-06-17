package com.kosmo.compoundbutton12;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.kosmo.compoundbutton12.databinding.ActivityMainBinding;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;

public class MainActivity extends AppCompatActivity implements CompoundButton.OnCheckedChangeListener {
    //@style/Theme.Material3.DayNight.NoActionBar 적용 및 루트뷰에 shape적용

    private String[] items;
    //결과출력용 필드들
    private String gender="남성";
    private String subject="JSP/SERVLET";

    //체크박스/토글버튼/스위치 체크여부 판단
    private List interesting = new Vector();
    private String onOff = "OFF";
    private String bluetooth = "ON";


    private ActivityMainBinding binding;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding=ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        //자바코드로 체크된 상태로 만들기
        binding.checkEntertainments.setChecked(false);
        binding.checkEconomics.setChecked(true);
        interesting.add("경제");

        //라디오 그룹으로 라디오버튼 체크 해제:clearCheck()
        binding.radioGroup.clearCheck();
        //라디오 그룹으로 라디오버튼 체크 :check(리소스 아이디)
        binding.radioGroup.check(R.id.radio_male);
        binding.toggleButton.setChecked(false);
        binding.switchButton.setChecked(true);
        //스피너에 아이템 설정하기
        items = getResources().getStringArray(R.array.items);
        ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item,items);
        binding.spinner.setAdapter(adapter);
        //처음에 보여줄 아이템 선택:
        //xml속성에는 없음.AbsSpinner클래스가 갖고 있는 메소드임.
        binding.spinner.setSelection(5);

        //리스너 부착
        binding.checkEconomics.setOnCheckedChangeListener(this);
        binding.checkEntertainments.setOnCheckedChangeListener(this);
        binding.checkPolitics.setOnCheckedChangeListener(this);
        binding.checkSports.setOnCheckedChangeListener(this);

        binding.toggleButton.setOnCheckedChangeListener(this);
        binding.switchButton.setOnCheckedChangeListener(this);

        //※라디오버튼-라디오그룹에 리스너 부착해라 그리고 RadioGroup의 OnCheckedChangeListener
        // 기타 컴파운드버튼들은 CompoundButton.OnCheckedChangeListener
        binding.radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            //checkedId는 체크된 라디오버튼의 리소스 ID값(int)
            //※RadioGroup의 getCheckedRadioButtonId()메소드로
            //체크된 라디오버튼의 아이디를 알아 낼수 있다.(==checkedId) -일반 버튼의 클릭이벤트등에서 사용
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
                Log.i("com.kosmo.compound","checkedId:"+(checkedId==R.id.radio_male));
                /*
                //방법1]
                switch(checkedId){
                    case R.id.radio_male:
                        Log.i("com.kosmo.compound","남성");break;
                    case R.id.radio_female:
                        Log.i("com.kosmo.compound","여성");break;
                    default:Log.i("com.kosmo.compound","트랜스젠더");
                }*/
                //방법2 :라디오버튼별로  case할 필요 없다
                gender=((RadioButton)findViewById(checkedId)).getText().toString();
                Log.i("com.kosmo.compound",gender);
            }
        });
        //※스피너에는 setOnItemClickListener가 아니라 setOnItemSelectedListener를 붙여라.
        binding.spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                //parent:여기서는 Spinner를 의미
                //view:하나의 아이템을 표시하는 텍스트 뷰(TextView)
                //position:The position of the view in the adapter
                //id:The row id of the item that is selected
                Log.i("com.kosmo.compound",String.format("position:%s,id:%s",position,id));
                Log.i("com.kosmo.compound",String.format("과목:%s",items[position]));
                Log.i("com.kosmo.compound",String.format("과목:%s",((TextView)view).getText()));
                subject = ((TextView)view).getText().toString();
            }
            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {}
        });//////////////////
       //버튼의 클릭이벤트 처리
        binding.button.setOnClickListener(view->{
            binding.textview.setText(
                    String.format("체크박스:%s%n라디오버튼:%s%n토글버튼:%s%n스위치:%s%n스피너:%s",
                            Arrays.toString(interesting.toArray()),
                            gender,
                            onOff,
                            bluetooth,
                            subject
                            ));
        });


    }//////////////onCreate
    //CompoundButton계열 버튼(CheckBox/ToggleButton/Switch)의 Checked속성이 변경될때마다 호출됨
    @Override
    public void onCheckedChanged(CompoundButton compound, boolean isChecked) {
        Log.i("com.kosmo.compound","isChecked:"+isChecked);
        Log.i("com.kosmo.compound","compoundButton is Checkbox:"+(compound instanceof CheckBox));
        if(compound instanceof CheckBox){
            if(isChecked){
                Log.i("com.kosmo.compound",compound.getText()+"선택");
                interesting.add(compound.getText().toString());
            }
            else{
                Log.i("com.kosmo.compound",compound.getText()+"해제");
                interesting.remove(compound.getText().toString());
            }
        }
        else if(compound.getId()==R.id.toggleButton){
            Log.i("com.kosmo.compound",isChecked? "토글 ON":"토글 OFF");
            onOff=isChecked? "ON":"OFF";
        }
        else{
            Log.i("com.kosmo.compound",isChecked? "블루우스 ON":"블루투스 OFF");
            bluetooth=isChecked? "ON":"OFF";
        }
    }


}///////////////