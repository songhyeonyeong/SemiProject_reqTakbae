<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import ="com.kh.jinkuk.member.model.vo.*"%>
<%
	Member loginUser =(Member)session.getAttribute("loginUser");
%>


 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<header>
	<div class="inner"><!-- inner S -->
		<h1><a href="/reqtakbae/index.jsp"><img src="/reqtakbae/views/common/images/gnb/logo.png" alt="택배를 부탁해 로고"></a></h1>
		<!-- 로그인 전 -->
		

		<% if(loginUser  == null) { %>
		<div class="multBoxL1">
			<span class="mu11"><a href="javascript:openpop();">로그인</a></span>
			<span class="mu12"><a href="/reqtakbae/views/member/join1.jsp">회원가입</a></span>

		</div>
		<%}else{ %>
		<!-- 로그인 후 -->
		 <div class="multBoxL2">
			<ul>
				<li>
					<span><a class="orange bold" href="/reqtakbae/selectMyNoticeList.mp"><%=loginUser.getUser_name() %></a>님이 접속하셨습니다.</span>
					
				</li>
				<li class="mt5">
					<span class="aaa"></span>
					<span class="sbtn db" onclick="chargeMoney()">충전</span>
					<span class="sbtn rd" onclick="logout()">로그아웃</span>
					<span class="sbtn wh" onclick="myPage()">마이페이지</span>
					
				</li>
			</ul>
		</div> 
		<%} %>

		<div class="multBoxR">
			<span class="mu1"><a href="/reqtakbae/views/board/allNoticeList.jsp">공고신청</a></span>
			<span class="mu2"><a href="#">배송조회</a></span>
			<span class="mu3"><a href="<%=request.getContextPath()%>/reset?p=info">이용안내</a></span>
		</div>

		<span class="menuAll" onclick="openNav()"><img src="/reqtakbae/views/common/images/gnb/ico_menu.png" alt="menu"></span><!-- gnbmenu S -->

		<div id="myNav" class="overlay">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <div class="overlay-content">
			<p class="clear"><a href="<%=request.getContextPath()%>/reset?p=comInfo">회사 소개</a></p>
			<p><a href="<%=request.getContextPath()%>/reset?p=info">이용 안내</a></p>
			<p><a href="<%=request.getContextPath() %>/selectList.bo">전체 공고</a></p>
			<p><a href="<%=request.getContextPath() %>/selectTodayList.bo">오늘의 공고</a></p>
			<p><a href="<%= request.getContextPath() %>/selectReview">후기게시판</a></p>
			<p><a href="<%=request.getContextPath() %>/selectInquireList">문의하기</a></p>
			<p class="smMenu mt20">
			
				<% if(loginUser == null){ %>
					<span><a href="/reqtakbae/views/member/joinSort.jsp">회원가입</a></span>
					<span> / </span>
					<span><a href="javascript:openpop();">로그인</a></span>
					<span> / </span>
				<% } %>

			</p>
		  </div>
		</div><!--// gnbmenu E-->

	</div><!--// inner E-->
</header>

<!--  -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> 
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->

<script>
	$(function(){
		$.ajax({
				url:"ExchangeAjaxServlet",
			type:"get",
			success:function(data){
				$(".aaa").text(data+"p");
			},
			error:function(data){
				console.log("실패");
			}
		});								
	});
</script>

<script type="text/javascript"> 
//<![CDATA[
function openpop()
{
	  $(".layerWrap").attr("tabindex", "0").show().focus();
	  $(".layerClose").click(function(){
	  $(".layerWrap").removeAttr("tabindex").hide();
	  $(".openLayer").focus();
	  });  
	  $(".lastClose").focus(function(){
	   $(".layerWrap").append("<a href='javascript:void(0);' class='linkAppend'></a>");
	   $(".linkAppend").focus( function(){
	    $(".layerWrap").attr("tabindex", "0").focus();
	    $(".linkAppend").remove();
	   });
	  });
 }
//]]>
</script>


<div class="layerWrap"><!-- layerWrap S-->
		<div class="layerContainer">
			<div class="xy">
				<div class="layerHead" id="layerHead"><p class="font24 mt20">로그인</p></div>
				<a href="#" class="font30 white firstClose layerClose">&times;</a>
				<div class="layerCon" id="layerCon">
				<form id="loginForm" action="<%= request.getContextPath() %>/Login.me" method="post">
					<ul class="login wth350 mr_auto mt20 mb50">
						<li><label for=""></label><input id="userId" name="userId" class="" type="text" value="" placeholder="아이디를 입력하세요"></li>				
						<li><label for=""></label><input id="userPwd" name="userPwd" class="" type="password" value="" placeholder="비밀번호를 입력하세요"></li>
						
						
						<li class="mt10"><a class="bbtn db wth240" onclick="login()">로그인</a></li>
						<li class="mt10">
							<span><a class="white" href="/reqtakbae/views/member/joinSort.jsp">회원가입</a></span>
							<span class="ml30"><a class="white" href="/reqtakbae/views/member/idpwList.jsp">아이디/비밀번호찾기</a></span>
						</li>
						<li class="mt30 white">네이버로그인자리</li>
						<!-- <li class="mt10 white">구글로그인자리</li> -->
						
						
						
						 <a id="kakao-login-btn"></a>
 						<a href="http://developers.kakao.com/logout"></a>
						
						
						<!--  -->
						<!-- <div id="naverIdLogin"></div>  -->
						<div id="naver_id_login"></div>
						
					</ul>
				</form>	
				</div>
				<a href="#" class="lastClose layerClose">닫기</a>
			</div>
			<div class="dimBg"></div>
		</div> 
		<script>
			function login(){
					$("#loginForm").submit();
			}
			function logout(){
					location.href="<%=request.getContextPath()%>/logout.me";
			}
			function chargeMoney(){
					location.href="<%=request.getContextPath()%>/reset?p=charge";
			}
			
			function myPage(){
				location.href="<%=request.getContextPath()%>/selectMyNoticeList.mp";
			}
			
			
			
			
		</script>
		
		
		 <script type='text/javascript'>
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
        	             //console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
        	             //console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
        	             //console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
        	         	 //res.properties.nickname으로도 접근 가능 )
        	             //console.log(authObj.access_token);<---- 콘솔 로그에 토큰값 출력
        	             location.href="<%=request.getContextPath()%>/snsCheck?kakaoId="+res.id;
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
		
	</div><!--// layerWrap E-->	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	