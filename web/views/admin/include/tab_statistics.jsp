<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_3ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/SelectChartToday?year=2019&month=01">일일 방문자</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/SelectChartMonthServlet?year=2019">월별 방문자</a></li>
			<li <%if(tabon.equals("3")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/SelectChartAreaServlet">지역별 신청 통계</a></li>
		</ul>
	</div>