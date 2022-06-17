package com.example.touchevent20.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import androidx.annotation.Nullable;

import java.util.Vector;

//1]view클래스 상속
public class MyTouchDrawing extends View {
    //붓준비]
    private Paint paint;
    //사용자가 터치한 지점의 좌표를 저장할 컬랙션
    private Vector<Dot> dots = new Vector<>();

    public MyTouchDrawing(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        //붓 생성
        paint = new Paint(paint.ANTI_ALIAS_FLAG);
        //붓 색상
        paint.setColor(Color.RED);
        //붓 두께 (픽셀단위)
        paint.setStrokeWidth(20);
    }
    @Override
    protected void onDraw(Canvas canvas) {
        //캔바스 배경색 설정
        canvas.drawColor(Color.argb(100,125,125,125));
        //백터에 저장된 점의 좌표로 선을 그리자
        //점이 n개인 경우 n-1개의 선이 그려진다
        for(int i=0;i<dots.size()-1;i++){
            if(dots.get(i).isDrawing()){
                canvas.drawLine(
                        dots.get(i).getXpos(),
                        dots.get(i).getYpos(),
                        dots.get(i+1).getXpos(),
                        dots.get(i+1).getYpos(),
                        paint
                );
            }
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if(event.getAction()==MotionEvent.ACTION_DOWN){
            dots.add(new Dot((int)event.getX(),(int)event.getY(),false));
            Log.i("com.example.touch",String.format("[DOWN]X좌표:%s,Y좌표:%s",(int)event.getX(),(int)event.getY()));
        }
        if(event.getAction()==MotionEvent.ACTION_MOVE){
            dots.add(new Dot((int)event.getX(),(int)event.getY(),true));
            Log.i("com.example.touch",String.format("[UP]X좌표:%s,Y좌표:%s",(int)event.getX(),(int)event.getY()));
            invalidate();
        }
        return true;
    }
}////MyTouchDrawing


