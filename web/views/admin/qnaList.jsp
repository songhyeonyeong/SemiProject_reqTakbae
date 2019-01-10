<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 문의내역 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<table class="boardList mt30">
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:6%;"><!-- No -->
				<col style="width:14%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:15%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">문의제목</th>
				<th scope="col">문의내용</th>
				<th scope="col">등록날짜</th>
				<th scope="col">작성자</th>
			</tr>
			</thead>
			<tbody>
			<% for(Inquiry m : list){ %>
					<tr id="listArea">
						<td><%=m.getRnum() %></td>
						<td><a><%= m.getM_title()%></a></td>
						<td><%= m.getM_context() %></td>
						<td><%=m.getM_date()%></td>
						<td><%= m.getU_no()%></td>

					</tr>
				<% } %> 

			</tbody>

		</table>
		
		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.in?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.in?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.in?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.in?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.in?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>
	

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray","cursor":"pointer"});//td의 부모는 tr -> tr에 css적용

			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				
				console.log(num);
				location.href="<%=request.getContextPath()%>/selectOne.in?num=" + num; 
	
				
			});
			
		});
		
		
		
		
		
	</script>

</body>
</html>