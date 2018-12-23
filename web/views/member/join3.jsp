<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>

		<div class="EmailComp mt50">
			<p class="font24">가입 완료를 위한 <span class="font24 red">이메일 인증</span>을 해주세요.</p>
			<p class="font24">인증 유효 기간은 2018.12.28 20:49 까지입니다.</p>
			<p class="fgray500 mt10">24시간 이내로 인증을 받으셔야 정상적으로 가입이 완료됩니다.</p>
		</div>

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="bbtn rd" href="#">재전송 요청</a></span>
		</div><!--// btnbox E-->

	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>