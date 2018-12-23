<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_3ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="cashList.jsp">충전내역 관리</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="pointList.jsp">포인트내역 관리</a></li>
			<li <%if(tabon.equals("3")){%>class="on"<%}%>><a href="payBackList.jsp">환전내역 관리</a></li>
		</ul>
	</div>