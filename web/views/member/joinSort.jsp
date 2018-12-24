<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp"%>

 <title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>

		<ul class="joinSortBox mt50">
		 	<li class="mr20"><a class="orange500" href="join1.jsp">개인</a></li>
			<li><a class="blue500" href="join1.jsp">택배기사</a></li> 
		</ul>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %> 

</body>
</html>