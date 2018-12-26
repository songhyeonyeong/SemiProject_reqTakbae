<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_2ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="/reqtakbae/views/admin/allNoticeList.jsp">공고 게시물 관리</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="/reqtakbae/views/admin/todayNoticeList.jsp">당일 공고 게시물 관리</a></li>
		</ul>
	</div>