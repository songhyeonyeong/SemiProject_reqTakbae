<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<%

	String bigtabon = "1";
	ArrayList<Mynotice> list = (ArrayList<Mynotice>) request.getAttribute("list");
%>

<%@ include file="/views/include/common.jsp"%>

<title>마이페이지</title>

</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">마이페이지</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->

				<%@ include file="/views/include/tabMypage.jsp"%>
				<!--신청자부분 -->
				<%if(loginUser.getUser_div().equals("신청자")){ %>
				<!-- <div class="titNavi">
						마이페이지
					<span>홈 &gt; 마이페이지</span>
					</div>
					 -->
					</li>
					<!--내공고목록 최신 4개 출력  -->
						<ul class="mypgBox mt50">
						<li class="bx">
						<p class="font24">내 공고 목록</p>
						<ul class="boardShort">
						<%
							for (int i=0; i<4; i++) {
						%>
							<input type="hidden" value="<%=list.get(i).getG_NO()%>">
							<li>&bull; <a href="#"><%=list.get(i).getG_CONTEXT()%></a></li>
					
						<%
							}
						%>
						</ul>
					</li>
						<!--기사부분 -->
			<%}else{ %>
			
						<ul class="mypgBox mt50">
					<li class="bx">
						<p class="font24">내 배송 목록</p>
						<ul class="boardShort">
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
						</ul -->
					
					
					<%} %>
					
					
					<li class="bx">
						<p class="font24">충전/적립 내역</p>
						<ul class="boardShort">
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
						</ul>
					</li>
					<li class="bx mt30">
						<p class="font24">환전 내역</p>
						<ul class="boardShort">
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
						</ul>
					</li>
					<li class="bx mt30">
						<p class="font24">나의 문의내역</p>
						<ul class="boardShort">
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
						</ul>
					</li>
			</div>
		</div>
		<!--// inner E-->
	</div>

	<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>