<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.exchange.model.vo.*, java.sql.*"%>
<% 
	String bigtabon="5";

	ArrayList<Exchange> list = (ArrayList<Exchange>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");


	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 

%>
<%@ include file="/views/include/common.jsp" %>

<title>환전내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<p class="flo_right mb10"><a class="mbtn or" href="#">환전하기</a></p>

		<table class="boardList mt20">
			<caption>충전적립 리스트입니다.</caption>
			<colgroup>
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
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
				<!-- <th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th> -->
				<th scope="col">포인트</th>
				<th scope="col">실수령액</th>
				<th scope="col">계좌번호</th>
				<th scope="col">은행명</th>
				<th scope="col">일시</th>
				<th scope="col">상태</th>
			</tr>
			</thead>
			<tbody>
			
			<%
				for(Exchange e : list){
			%>
			<tr>
			<td><%=e.getrNum() %></td>
			<td><%=e.getcMoney() %></td>
			<td><%=e.getrMoney() %></td>
			<td><%=e.getBankNum() %></td>
			<td><%=e.getBankName() %></td>
			<td><%=e.getcDate() %></td>
			<td><%=e.geteStatus() %></td>
			
			</tr>
			<%
				}
			%>
			<!-- <tr>
				<td>1</td>
				<td>일반</td>
				<td>ssss11234</td>
				<td>홍길동</td>
				<td>50,000</td>
				<td>45,000</td>
				<td>123-45-678900</td>
				<td>우리</td>
				<td>2018-12-12 18:05:33</td>
			</tr>
			<tr>
				<td>2</td>
				<td>일반</td>
				<td>ssss11234</td>
				<td>홍길동</td>
				<td>50,000</td>
				<td>45,000</td>
				<td>123-45-678900</td>
				<td>우리</td>
				<td>2018-12-12 18:05:33</td>
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
		</div> -->
		<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/ExchangeServlet?currentPage=<%=currentPage - 1%>">&lt;</a></span>
<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage - 1%>'"><</button> --%>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
<%-- 					<button disabled><%= p %></button> --%>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/ExchangeServlet?currentPage=<%= p %>"><%= p %></a></span>
<%-- 					<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%= p %>'"><%= p %></button> --%>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
<!-- 			<button disabled>></button> -->
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/ExchangeServlet?currentPage=<%=currentPage + 1%>">></a></span>
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