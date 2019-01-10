<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jinkuk.member.model.vo.*,java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:550px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center; margin:10px;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}

#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<%
	int gno =Integer.parseInt(request.getParameter("gno"));
	String fullstartlocation =(String)request.getAttribute("start");
	String startlocation=fullstartlocation.split("/")[1];
 	String fullendlocation =(String)request.getAttribute("end");
 	String endlocation=fullendlocation.split("/")[1];
 	Member user =(Member)request.getAttribute("user");
 	String stat =request.getParameter("stat");
 	Calendar calendar = Calendar.getInstance();
    java.util.Date date = calendar.getTime();
    String today = (new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(date));

 	
 	
%>

<%@ include file="/views/include/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="map_wrap">
    <div id="map" style="width:150%;height:150%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option" align="center">
            <div style="font-size:150%; font-weight:bold;">
            <div style="font-size:120%">내 <%=gno%>번 공고 배송 현황</div>
            <br>
             <div style="font-size:70%">기사 이름 :<%=user.getUser_name() %></div>
             <div style="font-size:70%">기사 번호 :<%=user.getPhone() %></div>
            <br>
           <%--   <div onclick="panTo('start')" align="center" style="margin:auto; font-size:100%; border:1px solid black;"> <span id="startarea" ><bold>발송지 :</bold><%=fullstartlocation %></div></span><br>
        	 <div onclick="panTo('end')" align="center" style="margin:auto; font-size:100%; border:1px solid black;"> <span id="endarea"><bold>도착지 :</bold><%=fullendlocation %></div> </span><br>
        	 <div onclick="panTo('my')" align="center" style="margin:auto; font-size:100%; border:1px solid black;"> <span id="endarea1" ><bold>내위치로 이동</bold></div></span><br> --%>
        	
        	 <div align="left">
        	<!--  <button onclick="NOWtoS()">발송지 까지 길찾기</button> -->
        	
        	<!--  <button onclick="StoE()">도착지 까지 길찾기</button> -->
        	 </div>
        	 <div align="left">
        	 실시간배송상태보기
        	 <div id="statusdiv" style="border:1px solid black; height:200px">
        	 
        	 </div>
        	 <br>
        	 <div>
        	 현재상태:<span id="status" style="color:blue"><%=stat %></span><br>
        	  <button id="sendSMS" >문자보내기</button>
        	 </div>
			</div>
			<button onclick="location.href='SelectMydeliverlist.mp'">뒤로가기</button>
            </div>
        </div>
        </div>
        </div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9b4b2c505f7b6860e9e73d0c22e278&libraries=services"></script>
<script>

$(function(){
	$("#startarea").mouseenter(function(){
		$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"rgba(255, 255, 255, 0.7)"});
	}).click(function(){
	});
	
	$("#endarea").mouseenter(function(){
		$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"rgba(255, 255, 255, 0.7)"});
	}).click(function(){
	});
	
	$("#endarea1").mouseenter(function(){
		$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"rgba(255, 255, 255, 0.7)"});
	}).click(function(){
	});
	$("#sendSMS").click(function(){
		
		var url;
		var stat=$("#status").text();
		var name='<%=user.getUser_name()%>';
		var phone='<%=user.getPhone()%>';
		var gno =<%=gno%>;
		url="/reqtakbae/views/mypage/sms/smsform1.jsp?phone="+phone;
	   window.open(url,'smsform','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=500,height=400');
	});
	
	
});

	function fn_open(id,name,phone,count,grade,img) {
		console.log(id+" "+name+" "+phone+" "+count+" "+grade);
	   window.open('/reqtakbae/views/mypage/deliDetailPop.jsp?id='+id+"&&name="+name+"&&phone="+phone+"&&count="+count+"&&grade="+grade+"&&img="+img,'deliDetailPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=700,height=600');
	}




var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//출발지와 도착지 ,내위치 선언
var startlo;
var endlo;
var mylo;
//주소로 좌표를 검색합니다



var imageSrc ='/reqtakbae/views/common/images/contents/id.PNG', // 마커이미지의 주소입니다    
	imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
	imageOption = {offset: new daum.maps.Point(27, 69)};
	// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	var markerImageEND = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
geocoder.addressSearch('<%=endlocation%>',function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

    	 endlo = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: endlo,
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">도착지</div>',
        });
        infowindow.open(map, marker);
        
        daum.maps.event.addListener(marker, 'click', function() {
		    alert('배송지를선택하셨네용');
		});

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    } 
}); 

var imageSrc ='/reqtakbae/views/common/images/contents/name.PNG', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(27, 69)};
// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var markerImageSTART = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
geocoder.addressSearch('<%=startlocation %>',function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        startlo = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: startlo,
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>',
        });
        infowindow.open(map, marker);
        daum.maps.event.addListener(marker, 'click', function() {
		    alert('출발지를선택하셨네용');
		});
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    };
}); 
	function NOWtoS(){
	var start="http://map.daum.net/link/to/<%=fullstartlocation.split("/")[1]%>,"+startlo.getLat()+","+startlo.getLng();
	<%-- location.href="http://map.daum.net/link/to/<%=fullstartlocation.split("/")[1]%>,"+startlo.getLat()+","+startlo.getLng(); --%>
	window.open(start,'start','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=1000,height=600');
	};
	
	function StoE(){
	var end="http://map.daum.net/link/to/<%=fullendlocation.split("/")[1]%>,"+endlo.getLat()+","+endlo.getLng();
	window.open(end,'end','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=1000,height=600');
	};
	    
    
	 var lat;
	 var lon;
      var webSocket = new WebSocket('ws://localhost:8001/reqtakbae/broadcasting?'+<%=gno%>);
  webSocket.onerror = function(event) {
    onError(event)
  };
  webSocket.onopen = function(event) {
    onOpen(event)
  };
  webSocket.onmessage = function(event) {
    onMessage(event)
  };
  var flag=1;
  function onMessage(event) {
	 
      var redata=event.data;
      if(redata.split("/")[0]==1){
    	 
    	  
    	  console.log("좌표값임");
      var fullLo=redata.split("/")[1];
      
      lat=fullLo.split(",")[0];
      lon=fullLo.split(",")[1];
      
      console.log("위도"+lat);
      console.log("경도"+lon);
      mylo = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    	console.log("mylo"+mylo);
      if(flag==1){
      message = '<div style="padding:5px;">기사님 위치!</div>';
      	flag=-1;
      }else{
      message = '<div style="padding:5px;">기사님 클릭!</div>';
    	  flag=1;
      }
      }
      else if(redata.split("/")[0]==2){
    	  alert("배송상태가 변경되었습니다!");
    	  var st=redata.split("/")[1];
    	  $br=$("<br>");
    	  $divs=  $("#statusdiv");
    	  $("#statusdiv").append("<%=today%>:"+st+"상태가 되었습니다.");
    	  $divs.append($br);
    	  $("#status").text(st);
    	  message = '<div style="padding:5px;">클릭!</div>';
    	  
      }
      displayMarker(mylo,message);
      
  }
  function onOpen(event) {
      console.log("웹소켓 연결성공!");
      message = '<div style="padding:5px;">기사님이 열심히 이동중입니다!</div>';
  }
  function onError(event) {
    alert(event.data);
  }
    	        
    	        
    	        	

		
     
     	var imageSrc ='/reqtakbae/views/common/images/contents/boxS.png', // 마커이미지의 주소입니다    
     	imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
     			imageOption = {offset: new daum.maps.Point(27, 69)};
     			// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     			var markerImageGISA = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
    	     	var marker;
		     	var infowindow;
		    	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		    	function displayMarker(mylo, message) {

		    		if(marker==null){
		    	    	console.log("초기마커찍기");
		    	   marker = new daum.maps.Marker({  
		    	        map: map, 
		    	        position: mylo,
		    	        image : markerImageGISA
		    	    }); 
		    		}else{
		    			marker.setPosition(mylo);
		    			
		    		}
		    	    
		    	    var iwContent = message, // 인포윈도우에 표시할 내용
		    	        iwRemoveable = true;
		    	    
					if(infowindow==null){
						console.log("초기인포찍기");
		    	    infowindow = new daum.maps.InfoWindow({
		    	        content : iwContent,
		    	        removable : iwRemoveable,
		    	    });
					}else{
						infowindow.setPosition(mylo);
					}
					
		    	    daum.maps.event.addListener(marker, 'click', function() {
							var num =<%=user.getU_no()%>;
						$.ajax({
										url:"/reqtakbae/selectdetailgisa.mp",
										data:{num:num},
										type:"get",
										success:function(data){
													fn_open(data.user_id,data.user_name,data.phone,data.basongnujuk,data.grade,data.imgname);
											
										},
										error:function(request,status,error){
									        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
									       },
							});
							
		    		});
		    	    
		    	    // 인포윈도우를 마커위에 표시합니다 
		    	    infowindow.open(map, marker);
		    	    
		    	    // 지도 중심좌표를 접속위치로 변경합니다
		    	    map.setCenter(mylo);      
		    	} 
    	
    	 function panTo(val) {
     	    // 이동할 위도 경도 위치를 생성합니다 
     	    var moveLatLon;
     	    if(val=='start'){
     	  	 moveLatLon =startlo;
     	    }else if(val=='end'){
     	    	moveLatLon =endlo;
     	    }else{
     	    	moveLatLon =mylo;
     	    }
     	    map.panTo(moveLatLon);            
     	};
     	
    	
    	
    	

    	
    	

</script>





</body>
</html>