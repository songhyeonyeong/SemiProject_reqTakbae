<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*, java.sql.*"%>
<% 
	String bigtabon="4";
 	ArrayList<Cybermoney_breakdown> list = (ArrayList<Cybermoney_breakdown>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
%>
<%@ include file="/views/include/common.jsp" %>

<title>충전/적립 내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<table class="searchTbl mt30 mb30"><!-- searchTbl S -->
			<caption>공고 검색입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">내역 선택</th>
					<td>
						<span>
						<label for=""></label>
						<form name="form" action="/reqtakbae/csearch" method="post">
						<select id="" name="select" class="wth140">
							<option selected="selected" value="all">전체</option>
							<option value="충전">충전</option>
							<option value="공고등록">공고등록</option>
							<option value="공고취소">공고취소</option>
							<option value="포인트적립">포인트적립</option>
							<option value="포인트사용">포인트사용</option>
						</select>
						 
						</span>
						<span><button class="sbtn db">검색</button></span>
						</form>
						<!-- <span><a class="sbtn db" href="">검색</a></span> -->
					
					</td>
				</tr>
			</tbody>
		</table>
		<p class="flo_right mb10"><a class="mbtn or" href="/reqtakbae/views/mypage/chargeMoney.jsp">충전하기</a></p>
		
		<table class="boardList mt20">
			<caption>충전적립 리스트입니다.</caption>
			<colgroup>
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
			</colgroup>
			<thead>
			<tr>
				<th scope="col">no</th>
				<th scope="col">구분</th>
				<th scope="col">날짜</th>
				<th scope="col">이용 포인트</th>
				<th scope="col">누적 포인트</th>
				<th scope="col">비고</th>
			</tr>
			</thead>
			<tbody>
			<%
				for(Cybermoney_breakdown c : list){
			%>
			<tr>
			<td><%=c.getR_num() %></td>
			<td><%=c.getCm_div() %></td>
			<td><%=c.getCm_date() %></td>
			<td><%=c.getCm_use() %></td>
			<td><%=c.getC_money()%></td>
			<td><%=c.getCm_note() %></td>
			</tr>
			<%
				}
			%>
			<!-- <tr>
				<td>1</td>
				<td>충전</td>
				<td>2018-12-12 12:44:24</td>
				<td>500,000</td>
				<td>504,155</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>2</td>
				<td>사용</td>
				<td>2018-12-13 22:44:24</td>
				<td>-50,000</td>
				<td>454,155</td>
				<td>금천구 배송 부탁드립니다!</td>
			</tr> -->
			
			</tbody>
		</table>

		<!-- <div class="numbox pt40 pb50"> 
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
		</div>
 -->		
		<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/Cybermoney_breakdownServlet?currentPage=<%=currentPage - 1%>">&lt;</a></span>
<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage - 1%>'"><</button> --%>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
<%-- 					<button disabled><%= p %></button> --%>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/Cybermoney_breakdownServlet?currentPage=<%= p %>"><%= p %></a></span>
<%-- 					<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%= p %>'"><%= p %></button> --%>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
<!-- 			<button disabled>></button> -->
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/Cybermoney_breakdownServlet?currentPage=<%=currentPage + 1%>">></a></span>
<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage + 1%>'">></button> --%>
			<% } %>
			
			
		</div>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>