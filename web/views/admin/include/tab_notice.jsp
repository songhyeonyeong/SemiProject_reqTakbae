<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_2ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="allNoticeList.jsp">개인 회원 관리</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="todayNoticeList.jsp">기사 회원 관리</a></li>
		</ul>
	</div>