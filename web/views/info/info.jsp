<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="1";
%>
<%@ include file="/views/include/common.jsp" %>

<title>이용안내</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">이용안내</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->

		<%@ include file="/views/include/tabInfo.jsp" %>
 
		<div class="titNavi">
			이용안내
			<span>홈 &gt; 이용안내 &gt; 이용안내</span>
		</div>

		<div style="text-align: center">
			<img src="/reqtakbae/views/common/images/contents/process.png" align="center">
		</div>
		

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>