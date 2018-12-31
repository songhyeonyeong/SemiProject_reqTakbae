<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.border.review.model.vo.*"%>

<%
	ArrayList<Review> list = (ArrayList<Review>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
		
					<span> <label for="col01"></label> 
					<select id="col01"
						name="col01" class="wth140">
							<option value="">제목</option>
							<option value="">내용</option>
							<option value="">기사명</option>
							<option value="">작성자</option>
					</select>

					</span> <span> <label for="Keyword"></label><input id="Keyword"
						name="Keyword" class="wth240" type="text"> <a class="sch"
						href="#"><img src="../common/images/contents/icoSearch.png"
							alt="검색" title="검색"></a>
					</span>
				</div>


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
							<td> <%=r.getHno()%></td>
							<td><%=r.gethTitle()%></td>
							<td><%=r.getDriname()%></td>
							<td><%=r.getUname()%></td>
							<td><%=r.gethGrade()%></td>
							<td><%=r.gethDate()%></td>
						</tr>
						<%
							}
						%>
					</thead>
				</table>


				

				<!-- paging -->
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
			<!-- //paging -->


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
				
				
				location.href="<%=request.getContextPath()%>/selectOneRe?num=" + num;
			});
		});
		</script>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>