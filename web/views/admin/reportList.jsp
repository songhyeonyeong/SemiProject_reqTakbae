<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>

<%@ include file="/views/admin/include/common.jsp" %>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 신고내역</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			
			<table class="boardList mt20">
				<caption>신고내역 리스트입니다.</caption>
				<colgroup>
					<col style="width:%;"><!--  -->
				</colgroup>
				<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">신고자ID</th>
					<th scope="col">신고글번호</th>
					<th scope="col">신고글제목</th>
					<th scope="col">작성자</th>
					<th scope="col">선택사유</th>
					<th scope="col">신고사유</th>
				</tr>
				</thead>
				<tbody>
				<%for(Report m : list){ %>
				<tr>
					<td><%=m.getS_no() %></td>
					<td><%=m.getU_no1() %></td>
					<td><%=m.getG_no() %></td>
					<td><%=m.getS_title() %></td>
					<td><%=m.getU_no2() %></td>
					<td><%=m.getS_s_reason() %></td>
					<td><%=m.getS_reason() %></td>
				</tr>
				<%} %>
				</tbody>
			</table>

			<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/select.rp?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/select.rp?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.rp?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.rp?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.rp?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>
	
		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>