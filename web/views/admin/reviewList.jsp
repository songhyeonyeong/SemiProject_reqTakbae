<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");	
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

		<div class="tit">&bull; 후기게시물 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<div class="topsearch mt30 mb30"><!-- topsearch S -->
			<span>
				<label for="col01"></label>
				<select id="col01" name="col01" class="wth140">
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">기사명</option>
					<option value="">작성자</option>
				</select> 
			</span>
			<span>
				<label for="Keyword"></label><input id="Keyword" name="Keyword" class="wth240" type="text">
				<a class="sch" href="#"><img src="../common/images/contents/icoSearch.png" alt="검색" title="검색"></a> 
			</span>
		</div>


		<table class="boardList mt20">
			<caption>후기게시판 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
				<col style="width:%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:13%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">제목</th>
					<th scope="col">기사명</th>
					<th scope="col">작성자</th>
					<th scope="col">평점</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody id="listArea">
			<% for(Review m : list){ %>
				<tr>
					<td><%=m.getHno() %></td>
					<td class="tleft"><a href="reviewView.jsp"><%=m.gethTitle() %></a></td>
					<td>현빈 기사님</td>
					<td><%=m.getUname() %></td>
					<td>
						<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="/reqtakbae/views//common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="/reqtakbae/views//common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="/reqtakbae/views//common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="/reqtakbae/views//common/images/contents/starOn.png" alt="별on"></span>
					</td>
					<td><%=m.gethDate() %></td>
				</tr>
			<% } %> 
			</tbody>
		</table>

		
		<p class="flo_right mt10"><a class="mbtn or" href="/reqtakbae/views/board/reviewWrite.jsp">후기작성하기</a></p>
		
		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.re?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.re?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.re?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.re?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.re?currentPage=<%=maxPage%>'">>></a></span>
			
			
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