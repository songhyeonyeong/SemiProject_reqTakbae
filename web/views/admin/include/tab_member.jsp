<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="tabBigBox btab_3ea mt40">
		<ul>
			<li <%if(tabon.equals("1")){%>class="on"<%}%>><a href="#INSERT" onClick="location.href='<%=request.getContextPath()%>/admin.no'">개인 회원 관리</a></li>
			<li <%if(tabon.equals("2")){%>class="on"<%}%>><a href="#INSERT" onClick="location.href='<%=request.getContextPath()%>/selectAll.me'">기사 회원 관리</a></li>
			<li <%if(tabon.equals("3")){%>class="on"<%}%>><a href="#INSERT" onClick="location.href='<%=request.getContextPath()%>/selectAll.bl'">블랙리스트 관리</a></li>
		</ul>
		
		
	</div>
	

		
	
	