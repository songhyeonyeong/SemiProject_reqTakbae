<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.kh.jinkuk.member.model.vo.*"
%>
	<div class="tabBigBox btab_8ea mt50 mb50">
		<ul>
			<li <%if(bigtabon.equals("1")){%>class="on"<%}%>><a href="/reqtakbae/selectMypageMain.mp">마이페이지 메인</a></li>
			<!--신청자일 떄  -->
			<%if(loginUser.getUser_div().equals("신청자")){ %>
			<li <%if(bigtabon.equals("2")){%>class="on"<%}%>><a href="/reqtakbae/selectMyNoticeList.mp">내 공고목록</a></li>
			<li <%if(bigtabon.equals("3")){%>class="on"<%}%>><a href="uMatchingDeliList.jsp">배송중 공고목록</a></li>
			<!--기사일 떄  -->
			<%}else{ %>
			<li <%if(bigtabon.equals("2")){%>class="on"<%}%>><a href="D_delrequestList">내 신청공고목록</a></li>
			<li <%if(bigtabon.equals("3")){%>class="on"<%}%>><a href="D_MatchingDelList.jsp">내 배송목록</a></li>
			<%} %>
			<li <%if(bigtabon.equals("4")){%>class="on"<%}%>><a href="pointList.jsp">충전/적립 내역</a></li>
			<li <%if(bigtabon.equals("5")){%>class="on"<%}%>><a href="payBackList.jsp">환전내역</a></li>
			<li <%if(bigtabon.equals("6")){%>class="on"<%}%>><a href="myQnaList.jsp">나의 문의내역</a></li>
			<li <%if(bigtabon.equals("7")){%>class="on"<%}%>><a href="memModify.jsp">회원정보수정</a></li>
			<li <%if(bigtabon.equals("8")){%>class="on"<%}%>><a href="memLeave.jsp">탈퇴하기</a></li>
		</ul>
	</div>  