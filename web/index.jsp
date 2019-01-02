<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>택배를 부탁해 홈</title>

<script type="text/javascript">
	$(document).ready(function(){
	  $('.bxslider').bxSlider({
		touchEnabled: true,
		speed: 500,
		pager: true,
		pagerType: 'full',
	  });

	});

</script>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="visual"><!-- visual S -->
	<ul class="bxslider">
		<li class="banner01 tcen">
			<div class="text">
				<p class="font60">택배보다 <span class="font60 darkbluee">빠르고</span><br>퀵보다 <span class="font60 darkbluee">싸다!!</span></p>
				<p class="font30">택배업계 최초 일반인 택배서비스</p>
			</div>
		</li>
		<li class="banner02">
			<div class="text">
				<p class="font60">택배보다 <span class="font60 darkbluee">빠르고</span><br>퀵보다 <span class="font60 darkbluee">싸다!!</span></p>
				<p class="font30">택배업계 최초 일반인 택배서비스</p>
			</div>
		</li>
	</ul>
</div><!--// visual E-->

<div class="noticeLine"><!-- noticeLine S -->
	<div class="inner"><!-- inner S -->
		<ul class="notice">
			<li class="tit bold mr20">공지사항</li>
			<li><a href="#">택배를 부탁해 홈페이지가 오픈되었습니다.</a></li>
		</ul>

		<ul class="today">
			<li class="tit bold">오늘의 공고</li>
			<li>
				<span class="ml20 mr20">김**</span>
				<a href="#">서울 중랑구 ~ 서울 강남구</a>
				<span class="ml20 mr20">모집중</span>
			</li>
		</ul>

	</div><!--// inner E-->
</div><!--// noticeLine E-->


<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>