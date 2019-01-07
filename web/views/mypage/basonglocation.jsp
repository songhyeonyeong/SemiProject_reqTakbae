<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String fullstartlocation =(String)request.getAttribute("start");
	String startlocation=fullstartlocation.split("/")[1];
 	String fullendlocation =(String)request.getAttribute("end");
 	String endlocation=fullendlocation.split("/")[1];
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:1000px;height:700px; align:center"></div>
<div><button onclick="panTo()">출발지로이동</button></div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9b4b2c505f7b6860e9e73d0c22e278&libraries=services"></script>
<script>

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

//출발지와 도착지 선언
var startlo;
var endlo;
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
            image :markerImageEND
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">도착지</div>',
            removable : iwRemoveable=true
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    } 
}); 

var imageSrc ='/reqtakbae/views/common/images/contents/name.PNG', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(27, 69)};
// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var markerImageSTART = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
geocoder.addressSearch('<%=startlocation%>',function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        startlo = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: startlo,
            image :markerImageSTART
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>',
            removable : iwRemoveable=true
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    };
}); 
    
     function panTo() {
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    /* var moveLatLon = new daum.maps.LatLng(33.450580, 126.574942); */
    	  	 var moveLatLon =startlo;
    	    
    	    map.panTo(moveLatLon);            
    	};
    	
    	
    	
   
    	
     
     if (navigator.geolocation) {
    	    
    	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	        
    	        var lat = position.coords.latitude, // 위도
    	            lon = position.coords.longitude; // 경도
    	        
    	        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    	            message = '<div style="padding:5px;">기사님위치</div>'; // 인포윈도우에 표시될 내용입니다
    	        
    	        // 마커와 인포윈도우를 표시합니다
    	        displayMarker(locPosition, message);
    	            
    	      });
    	    
    	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    	    
    	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
    	        message = 'geolocation을 사용할수 없어요..'
    	        
    	    displayMarker(locPosition, message);
    	}
		
     
     		var imageSrc ='/reqtakbae/views/common/images/contents/boxS.png', // 마커이미지의 주소입니다    
     			imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
     			imageOption = {offset: new daum.maps.Point(27, 69)};
     			// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     			var markerImageGISA = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
     	
    	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
    	function displayMarker(locPosition, message) {

    	    // 마커를 생성합니다
    	    var marker = new daum.maps.Marker({  
    	        map: map, 
    	        position: locPosition,
    	        image : markerImageGISA
    	    }); 
    	    
    	    var iwContent = message, // 인포윈도우에 표시할 내용
    	        iwRemoveable = true;

    	    // 인포윈도우를 생성합니다
    	    var infowindow = new daum.maps.InfoWindow({
    	        content : iwContent,
    	        removable : iwRemoveable,
    	    });
    	    
    	    // 인포윈도우를 마커위에 표시합니다 
    	    infowindow.open(map, marker);
    	    
    	    // 지도 중심좌표를 접속위치로 변경합니다
    	    map.setCenter(locPosition);      
    	}    
     
     
     
    
    


</script>





</body>
</html>