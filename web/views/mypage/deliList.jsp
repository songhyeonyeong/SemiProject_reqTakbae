<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<%
	String bigtabon = "2";
	ArrayList<Mynotice> list = (ArrayList<Mynotice>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<%@ include file="/views/include/common.jsp"%>

<title>내 공고 목록</title>

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

				<!-- <div class="titNavi">
			내 공고 목록
			<span>홈 &gt; 마이페이지 &gt; 내 공고 목록</span>
		</div> -->

				<table class="boardList mt20">
					<caption>전체공고 리스트입니다.</caption>
					<colgroup>
						<col style="width: 7%;">
						<!-- No -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">구분</th>
							<th scope="col">공고번호</th>
							<th scope="col">공고내용</th>
							<th scope="col">배송날짜</th>
							<th scope="col">상세</th>
							<th scope="col">기사선택</th>
							<th scope="col">선택기사</th>
						</tr>
					</thead>
					<tbody>
						<!--  내공고 목록 출력 tr -->
						<%
							for (Mynotice m : list) {
						%>
						<tr>
							<input type="hidden" value="<%=m.getG_NO()%>">
							<tr>
							<td><label for=""> 체크</label> <input id="" name=""
								class="check" type="checkbox"></td>
							<td><%=m.getG_DIV()%></td>
							<td><%=m.getG_NO()%></td>
							<td><%=m.getG_CONTEXT()%></td>
							<td><%=m.getG_DAY()%></td>
							<td><a class="sbtn gy" href="deliView.jsp#">상세보기</a></td>
							<%if(m.getUSER_ID()==null){ %>
							<td><a class="sbtn db" href="deliDetail.jsp#">기사선택</a></td>
							<td>기사미지정</td>
							<%}else{ %>
							<td><a class="sbtn gy">선택완료</a></td>
							<td><%=m.getUSER_ID()%></td>
							<%} %>
						</tr>
						<%
							}
						%>
					
					</tbody>
				</table>
				<!--페이징 부분  -->
				<!--  <div class="numbox pt40 pb50"> 
			<span><a class="num" href="#">&lt;</a></span>
			<span><a class="num on" href="#">1</a></span>
			<span><a class="num" href="#">2</a></span>
			<span><a class="num" href="#">3</a></span>
			<span><a class="num" href="#">4</a></span>
			<span><a class="num" href="#">5</a></span>
			<span><a class="num" href="#">6</a></span>
			<span><a class="num" href="#">7</a></span>
			<span><a class="num" href="#">8</a></span>
			<span><a class="num" href="#">9</a></span>
			<span><a class="num" href="#">&gt;</a></span>
		</div> -->
	 		<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%=currentPage - 1%>">&lt;</a></span>
<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage - 1%>'"><</button> --%>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
<%-- 					<button disabled><%= p %></button> --%>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%= p %>"><%= p %></a></span>
<%-- 					<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%= p %>'"><%= p %></button> --%>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
<!-- 			<button disabled>></button> -->
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%=currentPage + 1%>">></a></span>
<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage + 1%>'">></button> --%>
			<% } %>
			
			
		</div>



 <!--  -->

			</div>
			<!--// inner E-->
		</div>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>