<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.admin.model.vo.*,java.sql.*, java.util.*"%>
	<%

		String img =(String)request.getParameter("img");
	%>
<%@ include file="/views/include/common.jsp" %>

<title>기사정보</title>
<script type="text/javascript">
 $(function(){
	

 });
 
 
</script>
</head>
<body onload="window.resizeTo(400,390)">
<div id="pop"><!-- Wrap S -->

	<div class="tit">신분증</div>

	<div class="popCont">
		
		<div class="rtv of mt30">

			<div class="flo_left wth250"><!-- flo_left S-->
				<%if(img!=null){ %>
				<img src="<%=request.getContextPath()%>/upload/<%=img%>" width="400" height="250" alt="신분증사진">
				<%}else{ %>
				<img src="http://via.placeholder.com/250x250" alt="기사사진">
				<%} %>
			</div><!--// flo_left E-->

			
		</div>

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" onclick="window.close()">닫기</a></span>
		</div><!--// btnbox E-->

	</div>

</div><!--// Wrap E-->


</body>
</html>