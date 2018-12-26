<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import ="com.kh.jinkuk.member.model.vo.*"%>
<%Member loginUser =(Member)session.getAttribute("loginUser");%>

<header>
	<div class="inner"><!-- inner S -->
		<h1><a href="/reqtakbae/index.jsp"><img src="/reqtakbae/views/common/images/gnb/logo.png" alt="택배를 부탁해 로고"></a></h1>
		<!-- 로그인 전 -->
		<% if(loginUser  == null) { %>
		<div class="multBoxL1">
			<span class="mu11"><a href="javascript:openpop();">로그인</a></span>
			<span class="mu12"><a href="/reqtakbae/views/member/joinSort.jsp">회원가입</a></span>
		</div>
		<%}else{ %>
		<!-- 로그인 후 -->
		 <div class="multBoxL2">
			<ul>
				<li>
					<span><a class="orange bold" href="/reqtakbae/views/mypage/mypage.jsp"><%=loginUser.getUser_name() %></a>님이 접속하셨습니다.</span>
					
				</li>
				<li class="mt5">
					<span>5000p</span>
					<span class="sbtn db" onclick="chargeMoney()">충전</span>
					<span class="sbtn db" onclick="logout()">로그아웃</span>
				</li>
			</ul>
		</div> 
		<%} %>

		<div class="multBoxR">
			<span class="mu1"><a href="/reqtakbae/views/board/allNoticeList.jsp">공고신청</a></span>
			<span class="mu2"><a href="#">배송조회</a></span>
			<span class="mu3"><a href="/reqtakbae/views/info/info.jsp">이용안내</a></span>
		</div>

		<span class="menuAll" onclick="openNav()"><img src="/reqtakbae/views/common/images/gnb/ico_menu.png" alt="menu"></span><!-- gnbmenu S -->

		<div id="myNav" class="overlay">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <div class="overlay-content">
			<p class="clear"><a href="/reqtakbae/views/company/comInfo.jsp">회사 소개</a></p>
			<p><a href="/reqtakbae/views/info/info.jsp">이용 안내</a></p>
			<p><a href="/reqtakbae/views/board/allNoticeList.jsp">전체 공고</a></p>
			<p><a href="/reqtakbae/views/board/todayNoticeList.jsp">오늘의 공고</a></p>
			<p><a href="/reqtakbae/views/board/reviewList.jsp">후기게시판</a></p>
			<p><a href="/reqtakbae/views/board/qnaWrite.jsp">문의하기</a></p>
			<p class="smMenu mt20">
				<span><a href="/reqtakbae/views/member/joinSort.jsp">회원가입</a></span>
				<span> / </span>
				<span><a href="javascript:openpop();">로그인</a></span>
				<span> / </span>
				<span><a href="/reqtakbae/views/mypage/mypage.jsp">마이페이지</a></span>
			</p>
		  </div>
		</div><!--// gnbmenu E-->

	</div><!--// inner E-->
</header>


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
						<li class="mt30 white">카카오로그인자리</li>
						<li class="mt10 white">구글로그인자리</li>
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
					location.href="/reqtakbae/views/mypage/chargeMoney.jsp";
			}
		</script>
	</div><!--// layerWrap E-->	