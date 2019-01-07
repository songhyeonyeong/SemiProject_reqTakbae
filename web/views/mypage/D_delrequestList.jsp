<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<% 
	String bigtabon="2";
ArrayList<MyR_M_article> list = (ArrayList<MyR_M_article>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");


int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>
<%@ include file="/views/include/common.jsp" %>

<title>내 공고 목록</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>
		
		<!-- <div class="titNavi">
			내 공고 목록
			<span>홈 &gt; 마이페이지 &gt; 내 공고 목록</span>
		</div> -->

		<table class="boardList mt20">
			<caption>전체공고 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
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
					<th scope="col">구분</th>
					<th scope="col">공고번호</th>
					<th scope="col">공고제목</th>
					<th scope="col">배송날짜</th>
					<th scope="col">신청자 ID</th>
					<th scope="col">상세보기</th>
					<th scope="col">상태</th>
					
				</tr>
			</thead>
			<tbody id="tbody">
			<!--  내공고 목록 출력 tr -->
						<%
							for (MyR_M_article m : list) {
						%>
						<tr>
							<input type="hidden" value="<%=m.getG_no()%>">
							<td><%=m.getG_div()%></td>
							<td><%=m.getG_no()%></td>
							<td><%=m.getG_title()%></td>
							<td><%=m.getG_day()%></td>
							<td><%=m.getUser_id()%></td>
							<td><a class="sbtn gy">상세보기</a></td>
							<td><%=m.getG_p_div()%></td>
						</tr>
						<%
							}
						%>
			</tbody>
		</table>
	<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%=currentPage - 1%>">&lt;</a></span>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%= p %>"><%= p %></a></span>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/reqList.mp?currentPage=<%=currentPage + 1%>">></a></span>
			<% } %>
			
			
		</div>
	<script type="text/javascript">
	$(function(){
	$("#tbody td .sbtn.gy").click(function(){
		console.log("클릭하셨습니다");
		var num = $(this).parent().parent().children("input").val();
		var gongdiv=$(this).parent().parent().children("input").next().text();
		location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num+"&&gongdiv="+gongdiv;
		
	});
		
	});
	
	</script>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>