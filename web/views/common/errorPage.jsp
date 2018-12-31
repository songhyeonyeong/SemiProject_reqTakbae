<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>

<%@ include file="/views/include/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap"><!-- Wrap S -->

	<%@ include file="/views/include/header.jsp" %>
	
	<div id="subvisual">페이지 오류 안내</div>
	
	<div id="subContainer">
		<div class="contBox inner"><!-- inner S -->
	
			
			<h1><%= msg %></h1>

		</div><!--// inner E-->
	</div>
	
	<%@ include file="/views/include/footer.jsp" %>
	
	
	</div><!--// Wrap E-->
	
	
	<%@ include file="/views/include/myNav.jsp" %>
	
</body>
</html>