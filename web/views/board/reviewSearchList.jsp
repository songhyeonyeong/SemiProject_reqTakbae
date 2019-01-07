<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.border.review.model.vo.*"%>

<%
	ArrayList<Review> list = (ArrayList<Review>) request.getAttribute("list");
	String select=(String)request.getAttribute("select");
	
%>

<%@ include file="/views/include/common.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>후기게시판</title>

</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">후기게시판</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->

				<div class="titNavi">
					후기게시판 <span>홈 &gt; 후기게시판</span>
				</div>
			
			<div class="topsearch mt30 mb30">
					<!-- topsearch S -->
			<form action="<%=request.getContextPath()%>/searchRe.re" method="post">
					<span> <label for="col01"></label> 
					<select id="col01" name="select" class="wth140">
						<option selected disabled hidden>선택</option>
							<option value="title">제목</option>
							<option value="driname">기사명</option>
							<option value="writer">작성자</option>
					</select>

					<span>
					<label for="Keyword"></label><input type="text" id="Keyword" name="searchText" class="wth240" >
					<input type="submit" value="검색">
					<!-- <a class="sch" href="#"> -->
					<!-- <img src="/reqtakbae/views/common/images/contents/icoSearch.png" alt="검색" title="검색" ></a> -->
			</span>
					</form>
					
				</div>

			<!-- 전체 목록 확인하기 기능 만들기  -->
			
				<table class="boardList mt20" >
					<caption>후기게시판 리스트입니다.</caption>
					<colgroup>
						<col style="width: 7%;">
						<!-- No -->
						<col style="width: %;">
						<!--  -->
						<col style="width: 10%;">
						<!--  -->
						<col style="width: 10%;">
						<!--  -->
						<col style="width: 13%;">
						<!--  -->
						<col style="width: 10%;">
						<!--  -->
					</colgroup>
				
					<thead id="listArea">
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">기사명</th>
							<th scope="col">작성자</th>
							<th scope="col">평점</th>
							<th scope="col">작성일</th>
						</tr>
						<%
							for (Review r : list) {
						%>
						<tr>
							<input type="hidden" value="<%=r.getHno()%>">
							<td> <%=r.getRnum()%></td>
							<td><%=r.gethTitle()%></td>
							<td><%=r.getDriname()%></td>
							<input type="hidden" name="driId" value="<%=r.getDriId()%>">
							<td><%=r.getUname()%></td>
							<td>
								<%for(int i=0; i<r.gethGrade(); i++){%>
								<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
							<%}for(int i=0; i<5-r.gethGrade(); i++){	%>
							<span><img src="/reqtakbae/views/common/images/contents/starOff.png" alt="별off"></span>
							<%}%>
							</td>
							<td><%=r.gethDate()%></td>
						</tr>
						<%
							}
						%>
					</thead>
				</table>

				<%-- <!-- paging -->
				<div class="numbox pt40 pb50" align="center">
					<span><a class="num" href="#" 
					onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=1'"><<</a></span>
					<% if (currentPage <= 1) {%>
					<span disabled><a class="num" href="#" ><</a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=currentPage - 1%>'"><</a></span>
					<%}%>

					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
					<span disabled><a class="num" href="#" ><%=p%></a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=p%>'"><%=p%></a></span>
					<%}%>
					<%}%>

					<%
						if (currentPage >= maxPage) {
					%>
					<span disabled><a class="num" href="#" >></a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=currentPage + 1%>'">></a></span>
					<%}%>

					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=maxPage%>'">>></a></span>
				</div>
			<!-- //paging --> --%>


			</div>
			<!--// inner E-->
		</div>
		<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				var driId=$(this).parent().children("input").eq(1).val();
				
				
				location.href="<%=request.getContextPath()%>/selectOneRe?num=" + num+"&driId="+driId;
				
			});
		});
		</script>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>