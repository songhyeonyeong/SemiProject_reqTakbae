<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="2";
	ArrayList<Announcment> list = (ArrayList<Announcment>)request.getAttribute("list");	
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

		<div class="tit">&bull; 공고게시물 관리 - 당일공고 관리</div>

		<div class="contBox mt30"><!-- contBox S -->
	
			<%@ include file="include/tab_notice.jsp" %>

			<table class="searchTbl mt30 mb30"><!-- searchTbl S -->
				<caption>공고 검색입니다.</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:%;">
					<col style="width:15%;">
					<col style="width:%;">
					<col style="width:15%;">
					<col style="width:%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="col">도착</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="wth150">
							<option value="" selected="selected">서울시 전체</option>
							<option value="">강남구</option>
							<option value="">---</option>
						</td>
						<th scope="col">크기</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="wth150">
							<option value="" selected="selected">전체</option>
							<option value="">소</option>
							<option value="">중</option>
							<option value="">대</option>
						</td>
						<th scope="col">상태</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="wth150">
							<option value="" selected="selected">전체</option>
							<option value="">모집중</option>
							<option value="">배송중</option>					
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btnbox mb30">
				<span><a class="mbtn db wth60" href="#">검색</a></span>
			</div>

			<p class="flo_right mb10"><a class="mbtn or" onclick="deleteNotice();">삭제하기</a></p><!-- user에게만 보임 -->

			<table class="boardList mt20">
				<caption>전체공고 리스트입니다.</caption>
				<colgroup>
					<col style="width:7%;"><!-- No -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:13%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">공고번호</th>
						<th scope="col">출발지</th>
						<th scope="col">도착지</th>
						<th scope="col">공고내용</th>
						<th scope="col">배송날짜</th>
						<th scope="col">크기</th>
						<th scope="col">금액</th>
						<th scope="col">상태</th>
						<th scope="col">상세</th>
					</tr>
				</thead>
				<tbody>
					<% for(Announcment m : list){ %>
					<tr>
						<td>
							<label for=""> 체크</label>
							<input id="memCheck" name="memCheck" class="check" type="checkbox" value="<%=m.getG_NO()%>">
						</td>
						<td><%= m.getG_NO() %></td>
						<td><%= m.getG_S_AREA() %></td>
						<td><%= m.getG_E_AREA()%></td>
						<td><%= m.getG_TITLE()%></td>
						<td><%= m.getG_DAY() %></td>
						<td><%= m.getG_SIZE() %></td>
						<td><%= m.getG_PRICE() %></td>
						<td><%= m.getG_P_DIV() %></td>
						<td><a class="sbtn gy" href="/views/admin/allNoticeView.jsp">상세보기</a></td>
					</tr>
				<% } %> 
				</tbody>
			</table>
			
		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.to?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.to?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.to?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.to?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.to?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>
			
		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->
	<script>
		function deleteNotice(){
			$("input[name=memCheck]:checked").each(function() {
				
				
				var test =$(this).val();

				console.log(test);
				
				location.href="<%=request.getContextPath()%>/delete.to?name=" + test; 

			});
			
		}
		
				
			
	
			
	</script>

</body>
</html>