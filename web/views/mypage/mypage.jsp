<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="1";
%>
<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>마이페이지</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->

		<%@ include file="/hyun/myPost/include/tabMypage.jsp" %>

		<!-- <div class="titNavi">
			마이페이지
			<span>홈 &gt; 마이페이지</span>
		</div>
		 -->
		
		<ul class="mypgBox mt50">
			<li class="bx">
				<p class="font24">내 공고 목록</p>
				<ul class="boardShort">
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
				</ul>
			</li>
			<li class="bx">
				<p class="font24">충전/적립 내역</p>
				<ul class="boardShort">
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
				</ul>
			</li>
			<li class="bx mt30">
				<p class="font24">환전 내역</p>
				<ul class="boardShort">
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
				</ul>
			</li>
			<li class="bx mt30">
				<p class="font24">나의 문의내역</p>
				<ul class="boardShort">
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
					<li>&bull; <a href="#">배송합니다</a></li>
				</ul>
			</li>		
		</div>

	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>