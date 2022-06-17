package com.kosmo.chrometer11_2;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.widget.Chronometer;
import android.widget.DatePicker;
import android.widget.TimePicker;
import android.widget.Toast;

import com.kosmo.chrometer11_2.databinding.ActivityMainBinding;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MainActivity extends AppCompatActivity implements View.OnClickListener, Chronometer.OnChronometerTickListener {
    //테마를 @style/Theme.Material3.Dark.Dialog로 변경
    private ActivityMainBinding binding;

    private TimePickerDialog timePickerDialog;
    private DatePickerDialog datePickerDialog;

    private Calendar calendar = Calendar.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        //위젯에 리스너 부착

        binding.btnTime.setOnClickListener(this);
        binding.btnDate.setOnClickListener(this);

        binding.timerChronometer.setOnChronometerTickListener(this);
        binding.btnStart.setOnClickListener(this);
        binding.btnStop.setOnClickListener(this);
        binding.btnElaspedTime.setOnClickListener(this);

        //타임 피커 다이얼로그 객체 생성
        /*
            context – the parent context
            themeResId – the resource ID of the theme to apply to this dialog
            listener – the listener to call when the time is set
            hourOfDay – the initial hour
            minute – the initial minute
            is24HourView – Whether this is a 24 hour view, or AM/PM.
        */
        timePickerDialog = new TimePickerDialog(
                this,
                android.R.style.Theme_Material_Dialog,
                (timePicker,hour,minute)->{//시간 선택 완료(OK버튼 클릭시)시 호출된다
                    binding.textview.setText(String.format("%s분 %s초",hour,minute));
                },
                calendar.get(Calendar.HOUR),
                calendar.get(Calendar.MINUTE),
                true);
         /*
            context – the parent context
            listener – the listener to call when the user sets the date
            year – the initially selected year
            month – the initially selected month (0-11 for compatibility with Calendar.MONTH)
            dayOfMonth – the initially selected day of month (1-31, depending on month)
         */
        //데이트 피커 다이얼로그 객체 생성
        datePickerDialog = new DatePickerDialog(this,
                (view,year,month,date)->{
                    binding.textview.setText(String.format("%s년 %s월 %s일",year,month+1,date));
                },calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE));

    }

    //클릭시 자동으로 호출되는 콜백 메소드
   @Override
    public void onClick(View view) {
        if(view.getId()==R.id.btnTime){
            if(!timePickerDialog.isShowing())
                timePickerDialog.show();
        }
        else if(view.getId()==R.id.btnDate){
            if(!datePickerDialog.isShowing())
                datePickerDialog.show();
        }
        else if(view.getId()==R.id.btnStart){
            //현재 시간을 크로노미터의 기준 시간으로 설정
            binding.timerChronometer.setBase(SystemClock.elapsedRealtime());
            binding.timerChronometer.start();
        }
        else if(view.getId()==R.id.btnStop){
            binding.timerChronometer.stop();
        }
        else{
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            Toast.makeText(this, dateFormat.format(new Date(SystemClock.elapsedRealtime())), Toast.LENGTH_SHORT).show();
        }
    }///////////////////
    /*※크로마미터는 디폴트로 분:초로 표시됨   아래 코드 추가시 시:분:초로 표시 가능*/
    //초가 변할때마다 자동으로 호출되는 콜백 메소드
    @Override
    public void onChronometerTick(Chronometer chronometer) {
        //크로로미터를 시작한 이후 흘러온 시간
        long elapsedtime=SystemClock.elapsedRealtime()-binding.timerChronometer.getBase()-9*60*60*1000;
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        String timeString=dateFormat.format(new Date(elapsedtime));
        binding.timerChronometer.setText(timeString);


    }
}