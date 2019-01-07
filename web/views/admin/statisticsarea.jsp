<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String tabon="4";
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>

</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 지역별 신청 통계</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_statistics.jsp" %>
			
		</div><!--// contBox E-->

	</div><!--// container E-->
	<div>
		<%@ include file="chart.jsp" %>
	</div>
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>