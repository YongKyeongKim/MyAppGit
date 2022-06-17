package com.example.touchevent20.view;

public class Dot {
    //[터치한 지점의 x,y좌표 저장]
    private int xpos,ypos;
    //드레그해서 손을 뗀 상태에서는 그림이 그려지지 않도록 설정
    //그리기 여부 판단용
    private boolean isDrawing;

    public Dot() {}
    public Dot(int xpos, int ypos, boolean isDrawing) {
        this.xpos = xpos;
        this.ypos = ypos;
        this.isDrawing = isDrawing;
    }
    //게터.세터
    public int getXpos() {
        return xpos;
    }
    public void setXpos(int xpos) {
        this.xpos = xpos;
    }
    public int getYpos() {
        return ypos;
    }
    public void setYpos(int ypos) {
        this.ypos = ypos;
    }
    public boolean isDrawing() {
        return isDrawing;
    }
    public void setDrawing(boolean drawing) {
        isDrawing = drawing;
    }
}////Dot
