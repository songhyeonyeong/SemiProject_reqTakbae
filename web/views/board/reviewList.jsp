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

					<span> <label for="col01"></label> <select id="col01"
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


				<table class="boardList mt20">
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
					<thead>
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
							<td><%=r.getHno()%></td>
							<td><%=r.gethTitle()%></td>
							<td><%=r.getGno()%></td>
							<td><%=r.getUno()%></td>
							<td><%=r.gethGrade()%></td>
							<td><%=r.gethDate()%></td>
						</tr>
						<%
							}
						%>
					</thead>
				</table>


				<p class="flo_right mt10">
					<a class="mbtn or" href="reviewWrite.jsp">후기작성하기</a>
				</p>



				<div class="pagingArea" align="center">
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=1'"><<</button>
					<%
						if (currentPage <= 1) {
					%>
					<button disabled><</button>
					<%
						} else {
					%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=currentPage - 1%>'"><</button>
					<%
						}
					%>

					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
					<button disabled><%=p%></button>
					<%
						} else {
					%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=p%>'"><%=p%></button>
					<%
						}
					%>

					<%
						}
					%>


					<%
						if (currentPage >= maxPage) {
					%>
					<button disabled>></button>
					<%
						} else {
					%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=currentPage + 1%>'">></button>
					<%
						}
					%>

					<button
						onclick="location.href='<%=request.getContextPath()%>/selectReview?currentPage=<%=maxPage%>'">>></button>
				</div>



			</div>
			<!--// inner E-->
		</div>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>