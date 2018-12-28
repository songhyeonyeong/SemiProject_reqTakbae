<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<% 
	String bigtabon="3";
ArrayList<MyR_M_article> list = (ArrayList<MyR_M_article>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");


int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>
<%@ include file="/views/include/common.jsp" %>

<title>배송중 공고목록</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

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
					<th scope="col">No</th>
					<th scope="col">구분</th>
					<th scope="col">공고번호</th>
					<th scope="col">공고내용</th>
					<th scope="col">신청자ID</th>
					<th scope="col">상세</th>
					<th scope="col" colspan="2">배송상태</th>
				</tr>
			</thead>
			<tbody>
				<!--  내공고 목록 출력 tr -->
						<%
							for (MyR_M_article m : list) {
						%>
						<tr>
							<input type="hidden" value="<%=m.getG_no()%>">
							<tr>
							<td><label for=""> 체크</label> <input id="" name=""
								class="check" type="checkbox"></td>
							<td><%=m.getG_div()%></td>
							<td><%=m.getG_no()%></td>
							<td><%=m.getG_context()%></td>
							<td><%=m.getUser_id()%></td>
							<td><a class="sbtn gy" href="#">상세보기</a></td>
							<td>
							<form 
							<select id="selectDel" name="selectDel">
							<option value="default ">선택</option>
							<option value="인수중">인수중</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
							</select>
							&nbsp;&nbsp;<button onclick="changeST()">적용</button></td>
							<td style="color:blue"><%=m.getB_status()%></td>
						</tr>
						<%
							}
						%>
			</tbody>
		</table>
				<script type="text/javascript">
					function changeST(){
						var t=$("option:selected").val();
						$("option").attr("default");
						console.log(t);
					}
				
				</script>
		<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/matchingdellist.mp?currentPage=<%=currentPage - 1%>">&lt;</a></span>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/matchingdellist.mp?currentPage=<%= p %>"><%= p %></a></span>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/matchingdellist.mp?currentPage=<%=currentPage + 1%>">></a></span>
			<% } %>
			
			
		</div>
		

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>