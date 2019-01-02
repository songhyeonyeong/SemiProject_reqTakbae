<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	ArrayList<Change> list = (ArrayList<Change>)request.getAttribute("list");	
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

		<div class="tit">&bull; 충전 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_point.jsp" %>

			<table class="boardList mt20" >
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
				<th scope="col">No</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">신청금액</th>
				<th scope="col">실금액</th>
				<th scope="col">계좌번호</th>
				<th scope="col">은행</th>
				<th scope="col">날짜</th>
			</tr>
			</thead>
			<tbody>
			<%for(Change m : list){ %>
			<tr>
				<td><%=m.getCh_no() %></td>
				<td>충전</td>
				<td><%=m.getUser_id() %></td>
				<td><%=m.getUser_name() %></td>
				<td><%=m.getCh_rmoney() %></td>
				<td><%=m.getCh_cmoney() %></td>
				<td><%=m.getBank_num() %></td>
				<td><%=m.getBank_name() %></td>
				<td><%=m.getCh_date() %></td>
			</tr>
			<%} %>
			</tbody>
		</table>
		
		<br>
		<button class="mbtn bk" onclick="printCharge();">인쇄하기</button>

		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<% } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=maxPage%>'">>></a></span>
		</div>
	

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
		function printCharge(){
			window.print();


		}
	</script>

</body>
</html>