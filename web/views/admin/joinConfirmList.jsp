<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>

<%
	ArrayList<Admin> list = (ArrayList<Admin>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 배송기사 승인</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<div class="flo_right mt30 mb30">
				<span><a class="mbtn wh" href="#">전체선택</a></span>
				<span><a class="mbtn db" href="#">승인</a></span>
				<span><a class="mbtn rd" href="#">거부</a></span>
			</div>

			<table class="boardList mt20">
				<caption>배송기사 승인 리스트입니다.</caption>
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
					<th scope="col">선택</th>
					<th scope="col">No</th>
					<th scope="col">이름</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">은행</th>
					<th scope="col">계좌번호</th>
					<th scope="col">핸드폰번호</th>
					<th scope="col">신분증</th>
				</tr>
				</thead>
				<tbody>
				<% for(Admin m : list){%>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td><%=m.getUno() %></td>
					<td><%=m.getUserName() %></td>
					<td><%=m.getUserId() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getB_name() %></td>
					<td><%=m.getB_num()%></td>
					<td><%=m.getPhone() %></td>
					<td><a class="sbtn gy" href="#">확인</a></td>
					<div id="spot" style="position:absolute; left:520px; top:500px; visibility:hidden;">
<%-- 					<img src="<%=m.getPath() %> + <%=m.getI_name() %>" alt="신분증 사진" /> --%>
					</div>
				</tr>
				<%} %>
				</tbody>
			</table>

				<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/select.jo?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/select.jo?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.jo?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.jo?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/select.jo?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>

		</div><!--// contBox E-->

	</div><!--// container E-->
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->


	<script>
	$(function(){
		$('a').eq(3).click(function(){
			var num = $(this).parent().parent().children().eq(3).text();
			
			console.log(num);
	<%-- 		location.href="<%=request.getContextPath()%>/selectOne.in?num=" + num;  --%>
			
		});
		
	});

	
	
	function showmap() { 
	 if(document.all.spot.style.visibility=="hidden") {
	   document.all.spot.style.visibility="visible";
	   return false;
	 }
	 if(document.all.spot.style.visibility=="visible") {
	  document.all.spot.style.visibility="hidden";
	  return false;
	 }
	}
	</script>




</body>
</html>