<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_2ea mt50 mb50">
		<ul>
			<li <%if(bigtabon.equals("1")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/reset?p=info">이용안내</a></li>
			<li <%if(bigtabon.equals("2")){%>class="on"<%}%>><a href="<%=request.getContextPath()%>/reset?p=fare">요금조회</a></li>
			<!-- /reqtakbae/views/info/fare_inquiry.jsp -->
			<%-- <%=request.getContextPath()%>/reset?p=fare --%>
		</ul>
	</div>