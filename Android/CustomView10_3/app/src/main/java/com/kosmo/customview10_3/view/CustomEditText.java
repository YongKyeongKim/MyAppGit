package com.kosmo.customview10_3.view;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.widget.AppCompatEditText;

//1]기존 뷰 상속
public class CustomEditText  extends AppCompatEditText {

    //2]생성자 정의
    //자바코드에서 new연산자로 직접 CustomEditText객체 생성시 호출]
    public CustomEditText(@NonNull Context context) {
        super(context);
        Log.i("com.kosmo.customview","자바코드용 생성자");
    }
    //XML에 등록된 위젯이 생성될때 호출되는 셍성자
    public CustomEditText(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        Log.i("com.kosmo.customview","XML용 생성자");
    }
    //3]인터페이스 정의(내부 인터페이스)
    public interface OnTextLengthListener{
        //매개변수:사용자가 입력한 문자열 갯수
        void onTextLength(int textLength);
    }
    //4]인터페이스 타입의 리스너 선언
    private OnTextLengthListener onTextLengthListener;
    //5]위 필드의 setter 작성
    public void setOnTextLengthListener(OnTextLengthListener onTextLengthListener) {
        this.onTextLengthListener = onTextLengthListener;
    }
    //입력상자에 글을 입력할때마다 호출된다
    @Override
    protected void onTextChanged(
            CharSequence text,//에디트 텍스트에 입력된 문자열
            int start,//추가한 문자열의 시작 인덱스 혹은 삭제된 문자의 인덱스
            int lengthBefore,//삭제한 문자열의 갯수
            int lengthAfter//추가한 문자열의 갯수
        ) {
        //EditText에 기존 기능(TextChanged) 유지하면서 나만의 새로운 기능 추가
        Log.i("com.kosmo.customview","text:"+text);
        Log.i("com.kosmo.customview",
                String.format("start:%s,lengthBefore:%s,lengthAfter:%s",start,lengthBefore,lengthAfter));
        //커스텀뷰에서 오버라이라딩시 문자열의 길이를
        //내가 정의한 인터페이스의 추상메소드에 매개변수로 전달 해줌
        if(onTextLengthListener !=null){
            //즉 사용자가 EditText에 텍스트를 입력할때마다
            //입력한 문자열의 길이를 알아내도록 하는 나만의  에디트 텍스트
            onTextLengthListener.onTextLength(text.length());
        }
        super.onTextChanged(text, start, lengthBefore, lengthAfter);
    }
}/////////////////////////
