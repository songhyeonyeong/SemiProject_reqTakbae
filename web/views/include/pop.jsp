<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/reqtakbae/views/common/css/style.css"/>
<script type="text/javascript" src="/reqtakbae/views/common/js/jquery.min.js"></script><!-- mainbanner -->
<script type="text/javascript" src="/reqtakbae/views/common/js/jquery.cycle.all.js"></script><!-- mainbanner -->
<script type="text/javascript" src="/reqtakbae/views/common/js/jquery.bxslider.min.js"></script><!-- main small banner -->
<script type="text/javascript">
	$(document).ready(function(){
	  $('.bxslider').bxSlider({
		pager: false
	  });
	});
</script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<br><br>
	
	<div class="mr_auto wth250" align="center" >
		<input type="radio" name="userDiv" value="신청자" checked>신청자 &nbsp; &nbsp;
		<input type="radio" name="userDiv" value="기사">기사
		
		<br><br>
		<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
	
	</div>


<script>
	var userDiv=$("input[name=radio]:checked").val();
		//var userDiv = $("input[name='userDiv']:checked").val();
		
			//userDiv = $("input[name='userDiv']:checked").val();
	$("input[name=userDiv]").click(function(){
		userDiv = $("input[name=userDiv]:checked").attr("value");
		console.log("userDiv : "+userDiv);
	});
	
		
	
	

</script>


</body>

 <script type='text/javascript'>
	//var userDiv = $("input[name='userDiv']:checked").val();
	//console.log("userDiv : "+ userDiv);
	
	
//<![CDATA[
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('7911dc804e017095fb23eed7313ade99');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
     /*  alert(JSON.stringify(authObj));
      console.log(authObj); */

      
  	  Kakao.API.request({
  	       url: '/v1/user/me',
  	       success: function(res) {
  	             //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
  	             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
  	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
  	             //console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
  	             //console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
  	         	 //res.properties.nickname으로도 접근 가능 )
  	             //console.log(authObj.access_token);<---- 콘솔 로그에 토큰값 출력
  	    
  	             location.href="<%=request.getContextPath()%>/snsCheck?kakaoId="+res.id+"&userDiv=기사";
  	             
  	           }

  	         })
  	       },
	          fail: function(err) {
	            	//alert(JSON.stringify(err));
	            	alert("실패");
   				}
  });
//]]>

</script>

</html>