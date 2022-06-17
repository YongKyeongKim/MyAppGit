package com.kosmo.webview19;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

import com.kosmo.webview19.databinding.ActivityMainBinding;

import java.util.HashMap;
import java.util.Map;

// 한글 키보드 설정
// 에물레이터의 -Settings-System-언어 및 입력-언어에서 한국어 선택
public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding=ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        //WebView설정
        //1]WebView의 getSettings()메소드로 WebSettings객체
        WebSettings settings=binding.webview.getSettings();
        //1.자스가 실행되도록 설정- 기본적으로 웹뷰는 자스를 지원하지 않음
        settings.setJavaScriptEnabled(true);//필수 설정
        //2.스마트폰 웹뷰안에 사이트가 들어오도록 설정 즉 상단에
        //에디트 텍스트나 버튼들 그대도 보이도록 설정.
        //아래부분 생략시 웹뷰가 전체 레이아웃을 차지함(사이트 로드시)]-필수

        binding.webview.setWebViewClient(new WebViewClient(){
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return super.shouldOverrideUrlLoading(view, request);
            }
            //WebViewClient는 클래스 즉 함수형 이터페이스가 아니다 : 람다함수 변경 불가
        });


        //3.확대모드 설정]-옵션
        //settings.setBuiltInZoomControls(true);
        //4.자스의 기본 경고창(alert) 그대로 사용시- 아래코드 미 추가시 alert()창 안뜬다]-필수
        //binding.webview.setWebChromeClient(new WebChromeClient());
        //※WebChromeClient에서 제공하는 기본 경고창(안드로이드 제공) 사용하지 않고 즉 자스의 alert()모양을 Toast 로 변경
        binding.webview.setWebChromeClient(new MyWebChromeClient());

        //버튼들의 이벤트 처리
        binding.buttonGo.setOnClickListener(v->{
            String url=binding.editUrl.getText().toString();
            binding.webview.loadUrl(url);//자바스크립트 미 설정시 3 DOTS 메뉴가 안된다
        });

        binding.buttonBack.setOnClickListener(v->{
            binding.webview.goBack();
        });
        //RESTfull API 서버로부터 통계 데이타를 받는다고 가정
        binding.btnData1.setOnClickListener(v->{
            //자원의 url로 로딩시:binding.webview.loadUrl(url)
            /*
            사전 작업:
                앱안에 있는 html파일 로딩하기
                Android탭->app선택후 New->Folder->Assets Foldr생성
                assets가 아닌 android_asset으로 URL 설정
             */
            //1.html소스를 문자열 데이타로 사용해서 로드하기
            String data="<html>\n" +
                    "  <head>\n" +
                    "    <script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\n" +
                    "    <script type=\"text/javascript\">\n" +
                    "      google.charts.load('current', {'packages':['corechart']});\n" +
                    "      google.charts.setOnLoadCallback(drawChart);\n" +
                    "\n" +
                    "      function drawChart() {\n" +
                    "\n" +
                    "        var data = google.visualization.arrayToDataTable([\n" +
                    "          ['Task', 'Hours per Day'],\n" +
                    "          ['Work',     11],\n" +
                    "          ['Eat',      2],\n" +
                    "          ['Commute',  2],\n" +
                    "          ['Watch TV', 2],\n" +
                    "          ['Sleep',    7]\n" +
                    "        ]);\n" +
                    "\n" +
                    "        var options = {\n" +
                    "          title: 'My Daily Activities'\n" +
                    "        };\n" +
                    "\n" +
                    "        var chart = new google.visualization.PieChart(document.getElementById('piechart'));\n" +
                    "\n" +
                    "        chart.draw(data, options);\n" +
                    "      }\n" +
                    "    </script>\n" +
                    "  </head>\n" +
                    "  <body>\n" +
                    "    <div id=\"piechart\" style=\"width: 900px; height: 500px;\"></div>\n" +
                    "    <img src='images/sumnail.png'/>\n"+
                    "  </body>\n" +
                    "</html>\n";
            //binding.webview.loadData("html 문자열 데이타");
            //binding.webview.loadData(data,"text/html;charset=UTF-8","UTF-8");//이미지 표시되지 않음.
            //이미지를 표시하려면 loadDataWithBaseURL()를 사용해야 한다
            //binding.webview.loadDataWithBaseURL("file:android_asset/",data,"text/html;charset=UTF-8","UTF-8",null);
            //2.assets안에 있는 html 소스를 로드하기
            //※assets가 아닌 android_asset으로 URL 설정
            //binding.webview.loadUrl("file:android_asset/html/GoogleChart.html");
            //3.html소스를 문자열 데이터로 처리해서 차트의 시간을 동적으로 받아서 보여주기
            Map map = new HashMap();
            map.put("task","연령대");
            map.put("ratio","연령비");
            map.put("data","['20대',10],['30대',5],['40대',20]");
            map.put("title","연령대별 분포");
            binding.webview.loadDataWithBaseURL("file:android_asset/",getHtmlSource(map),"text/html;charset=UTF-8","UTF-8",null);

        });
        binding.btnData2.setOnClickListener(v->{
            Map map = new HashMap();
            map.put("task","취미");
            map.put("ratio","취미별 구성비");
            map.put("data","['등산',10],['보드타기',5],['드라이브',20],['수영',20],['서핑',35],['헬스',15]");
            map.put("title","취미별 분포");
            binding.webview.loadDataWithBaseURL("file:android_asset/",getHtmlSource(map),"text/html;charset=UTF-8","UTF-8",null);
        });

    }//OnCreate
    private String getHtmlSource(Map map){
        return String.format("<html>\n" +
                "  <head>\n" +
                "    <script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\n" +
                "    <script type=\"text/javascript\">\n" +
                "      google.charts.load('current', {'packages':['corechart']});\n" +
                "      google.charts.setOnLoadCallback(drawChart);\n" +
                "\n" +
                "      function drawChart() {\n" +
                "\n" +
                "        var data = google.visualization.arrayToDataTable([\n" +
                "          ['%s', '%s'],\n" +
                "          %s,\n" +

                "        ]);\n" +
                "\n" +
                "        var options = {\n" +
                "          title: '%s'\n" +
                "        };\n" +
                "\n" +
                "        var chart = new google.visualization.PieChart(document.getElementById('piechart'));\n" +
                "\n" +
                "        chart.draw(data, options);\n" +
                "      }\n" +
                "    </script>\n" +
                "  </head>\n" +
                "  <body>\n" +
                "    <div id=\"piechart\" style=\"width: 900px; height: 500px;\"></div>\n" +
                "    <img src='images/sumnail.png'/>\n"+
                "  </body>\n" +
                "</html>\n",map.get("task"),map.get("ratio"),map.get("data"),map.get("title"));
    }/////////////////////////


    //4번용:alert() 및 confirm()을 스마트폰 앱에 맞는 UI로 변경하기 위한 클래스
    private class MyWebChromeClient extends  WebChromeClient{
        //웹의 자스 alert()실행시의 창을 Toast로 변경
        /*
        view	WebView: The WebView that initiated the callback.
        url	String: The url of the page requesting the dialog.
        message	String: Message to be displayed in the window.
        result	JsResult: A JsResult to confirm that the user closed the window.
         */
        @Override
        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {
            //경고 메시지를 Toast로 보여주기
            Toast.makeText(view.getContext(),message,Toast.LENGTH_SHORT).show();
            //자바스크립트 경고창의 확인버튼을 클릭한것으로 처리하도록 호출
            //해야한다 alert()는 모달이라 클릭한 것으로 처리안하면
            //다른 메뉴를 클릭 할 수 없다
            result.confirm();
            //return super.onJsAlert(view, url, message, result); 혹은 return false;-->Toast도 뜨고 기본 Alert창도 뜬다
            return true;//토스트창만 뜬다
        }
        //confirm()실행시의 창을 AlertDialog로 변경
        @Override
        public boolean onJsConfirm(WebView view, String url, String message, JsResult result) {

            new AlertDialog.Builder(view.getContext())
                    .setCancelable(false)
                    .setIcon(android.R.drawable.ic_dialog_alert)
                    .setTitle("확인상자")
                    .setMessage(message)
                    .setPositiveButton("확인",(dialog,which)->{result.confirm();})
                    .setNegativeButton("아니오",(dialog,which)->{result.cancel();})
                    .create()
                    .show();
            //return super.onJsConfirm(view, url, message, result);
            return true;
        }
    }///////////
}