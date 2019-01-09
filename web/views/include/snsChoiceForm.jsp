<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>아이디/비밀번호 찾기</title>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
	.radioBtn{
		font-size: 12pt;
	}
</style>

<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
  
  
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">SNS로그인</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			&nbsp;
			<span>로그인 &gt; SNS로그인</span>
		</div>


		<div class="mr_auto wth250" align="center" >
			<br>
			<span class="radioBtn">
				<input type="radio" name="userDiv" value="신청자" style="width:20px; height:20px">
				신청자 &nbsp; &nbsp;
				
				<input type="radio" name="userDiv" value="기사" style="width:20px; height:20px">
				기사 &nbsp; &nbsp;
			</span>
		</div>
		

		
		<br><br>
		
		<!-- 카카오 로그인 -->
		<div class="mr_auto wth550" align="center">
			<a id="kakao-login-btn"></a><br>
			<a href="http://developers.kakao.com/logout"></a><br>
			
		<!-- 네이버 로그인 -->
			<div class="mr_auto wth550" align="center" id="naverIdLogin"></div>
			<!-- <div id="naver_id_login"></div> -->
		</div>
		
		
		
		
		
		

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script type="text/javascript">
	
</script>


 <script>
	 var userDiv;
		$("input[type=radio]").click(function(){
			userDiv = $("input[type=radio]:checked").val();
			console.log("userDiv="+userDiv);
		});
		
		/* 
		if($("input:radio[name=userDiv]").is(":checked")){
			$("#naverIdLogin").click(function(){
				naver();
			});
		} */
	

	//카카오로그인
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
	  	             //console.log(res.id);
	  	    
	  	             location.href="<%=request.getContextPath()%>/snsCheck?SNSId="+res.id+"&userDiv="+userDiv+"&loginDiv="+"카카오";
	  	             window.opener.top.location.href="<%=request.getContextPath()%>/views/member/joinKakao.jsp";
	  	          	 window.close(); 
	  	       		}
	
	  	         })
	  	       }
	  });

  
  
  
	//네이버로그인
	 var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "JwzeBVexbooaJdOsR1vM",
			callbackUrl: "http://192.168.43.88:8001/reqtakbae/views/include/callback.jsp",
			//callbackUrl: "http://127.0.0.1:8001/reqtakbae/views/include/callback.jsp?userDiv="+userDiv,
			isPopup: false, 
			loginButton: {color: "green", type: 3, height: 48}, 
		}
	);
	
	
	naverLogin.init(); 
 



/*  var naver_id_login = new naver_id_login("JwzeBVexbooaJdOsR1vM", "http://127.0.0.1:8001/reqtakbae/views/include/callback.jsp?userDiv="+userDiv);                        
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("http://127.0.0.1:8001/reqtakbae/views/include/snsChoiceForm.jsp");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login(); */
 
 
 
 

</script>






</body>
</html>




