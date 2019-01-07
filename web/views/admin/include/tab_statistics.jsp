<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_4ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="/reqtakbae/views/admin/statisticstotal.jsp">총 방문자</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="/reqtakbae/views/admin/statisticsday.jsp">일일 방문자</a></li>
			<li <%if(tabon.equals("3")){%>class="on"<%}%>><a href="/reqtakbae/views/admin/statisticsmonth.jsp">월별 방문자</a></li>
			<li <%if(tabon.equals("4")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/SelectChartServlet">지역별 신청 통계</a></li>
		</ul>
	</div>