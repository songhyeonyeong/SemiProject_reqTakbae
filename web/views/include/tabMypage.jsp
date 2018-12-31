<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.kh.jinkuk.member.model.vo.*"
%>
	<div class="tabBigBox btab_8ea mt50 mb50">
		<ul>
			<!--신청자일 떄  -->
			<li <%if(bigtabon.equals("1")){%>class="on"<%}%>><a href="/reqtakbae/selectMypageMain.mp">마이페이지 메인</a></li>
			<%if(loginUser.getUser_div().equals("신청자")){ %>
			<li <%if(bigtabon.equals("2")){%>class="on"<%}%>><a href="/reqtakbae/selectMyNoticeList.mp">내 공고목록</a></li>
			<li <%if(bigtabon.equals("3")){%>class="on"<%}%>><a href="/reqtakbae/SelectMydeliverlist.mp">배송중 공고목록</a></li>
			<!--기사일 떄  -->
			<%}else{ %>
			<li <%if(bigtabon.equals("2")){%>class="on"<%}%>><a href="/reqtakbae/reqList.mp">내 신청공고목록</a></li>
			<li <%if(bigtabon.equals("3")){%>class="on"<%}%>><a href="/reqtakbae/matchingdellist.mp">내 배송목록</a></li>
			<%} %>
			<li <%if(bigtabon.equals("4")){%>class="on"<%}%>><a href="/reqtakbae/Cybermoney_breakdownServlet">충전/적립 내역</a></li>
			<li <%if(bigtabon.equals("5")){%>class="on"<%}%>><a href="payBackList.jsp">환전내역</a></li>
			<li <%if(bigtabon.equals("6")){%>class="on"<%}%>><a href="/reqtakbae/views/mypage/myQnaList.jsp">나의 문의내역</a></li>
			<li <%if(bigtabon.equals("7")){%>class="on"<%}%>><a href="/reqtakbae/views/mypage/memModify.jsp">회원정보수정</a></li>
			<li <%if(bigtabon.equals("8")){%>class="on"<%}%>><a href="/reqtakbae/views/mypage/memLeave.jsp">탈퇴하기</a></li>
		</ul>
	</div>  