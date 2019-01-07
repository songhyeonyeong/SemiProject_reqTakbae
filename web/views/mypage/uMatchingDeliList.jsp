<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<%
	String bigtabon = "3";
	ArrayList<MyDeliverNotice> list = (ArrayList<MyDeliverNotice>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<%@ include file="/views/include/common.jsp"%>

<title>배송중 공고목록</title>

</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">마이페이지</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->

				<%@ include file="/views/include/tabMypage.jsp"%>

				<table class="boardList mt20">
					<caption>배송공고 리스트입니다.</caption>
					<colgroup>
						<col style="width: 7%;">
						<!-- No -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
						<col style="width: %;">
						<!--  -->
					</colgroup>
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">공고번호</th>
							<th scope="col">공고내용</th>
							<th scope="col">배송날짜</th>
							<th scope="col">선택기사</th>
						<!-- 	<th scope="col">상세주소선택</th> -->
							<th scope="col">상태</th>
							<th scope="col">상세</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<!--  내공고 목록 출력 tr -->
						<%
							for (MyDeliverNotice m : list) {
						%>
						<tr>
							<input type="hidden" value="<%=m.getG_NO()%>">
							<input type="hidden" value="<%=m.getU_no()%>">
							<td><%=m.getG_DIV()%></td>
							<td><%=m.getG_NO()%></td>
							<td><%=m.getG_CONTEXT()%></td>
							<td><%=m.getG_DAY()%></td>
							<td><%=m.getUSER_ID()%></td>
							<!-- <td><a class="sbtn sk">주소선택</a></td> -->
							<%
								if (m.getD_STATUS().equals("배송완료")) {
							%>
							<td style="color: grey; font-weight: bold"><%=m.getD_STATUS()%></td>
							<td><a class="sbtn rd">배송확정</a></td>
							<%}else if(m.getD_STATUS().equals("배송확정")){ %>
								<td style="color: ; font-weight: bold"><%=m.getD_STATUS()%></td>
							<td><a class="sbtn yl">리뷰쓰기</a></td>
							<%
								} else {
							%>
							<td><%=m.getD_STATUS()%></td>
							<td><a class="sbtn db">배송조회</a></td>
							<%
								}
							%>
						</tr>
						<%
							}
						%>
				
					</tbody>
				</table>
				<script type="text/javascript">
					$(function(){
						$("#tbody td .sbtn.rd").click(function(){
							var t=confirm("배송확정 하시겠습니까?");
							var num = $(this).parent().parent().children("input").eq(0).val();
							var uno = $(this).parent().parent().children("input").eq(1).val();
							var value="배송확정";
							if(t==true)
								{
							alert("배송확정 되었습니다!");
								location.href="<%=request.getContextPath()%>/updatebstatusU.mp?num="+num+"&&value="+value+"&&uno="+uno;
								}
							
						});
						
						$("#tbody td .sbtn.yl").click(function(){
							alert("리뷰쓰기페이지로 이동합니다.");
							var num = $(this).parent().parent().children("input").val();
							var delId=$(this).parent().prev().prev().text();
							
 							location.href="/reqtakbae/views/board/reviewWrite.jsp?delId="+delId+"&&gno="+num;
							
						});
						$("#tbody td .sbtn.sk").click(function(){
							//상세주소 선택부분
							location.href="/reqtakbae/views/mypage/selectDetailADDR.jsp";
						});

						
						$("#tbody td .sbtn.db").click(function(){
							var num = $(this).parent().parent().children("input").eq(0).val();
							var uno = $(this).parent().parent().children("input").eq(1).val();
							location.href="/reqtakbae/views/mypage/selectDetailADDR.jsp";
						});
						
						
						
						
					});
					
					
					
					
				</script>

				<div class="numbox pt40 pb50">
					<%
						if (currentPage <= 1) {
					%>
					<span><a class="num" disabled>&lt;</a></span>
					<%
						} else {
					%>
					<span><a class="num"
						href="<%=request.getContextPath()%>/SelectMydeliverlist.mp?currentPage=<%=currentPage - 1%>">&lt;</a></span>
					<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage - 1%>'"><</button> --%>
					<%
						}
					%>

					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
					<span><a class="num on" disabled><%=p%></a></span>
					<%-- 					<button disabled><%= p %></button> --%>
					<%
						} else {
					%>
					<span><a class="num"
						href="<%=request.getContextPath()%>/SelectMydeliverlist.mp?currentPage=<%=p%>"><%=p%></a></span>
					<%-- 					<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%= p %>'"><%= p %></button> --%>
					<%
						}
					%>

					<%
						}
					%>


					<%
						if (currentPage >= maxPage) {
					%>
					<span><a class="num" disabled>></a></span>
					<!-- 			<button disabled>></button> -->
					<%
						} else {
					%>
					<span><a class="num"
						href="<%=request.getContextPath()%>/SelectMydeliverlist.mp?currentPage=<%=currentPage + 1%>">></a></span>
					<%-- 			<button onclick="location.href='<%=request.getContextPath()%>/selectMyNoticeList.mp?currentPage=<%=currentPage + 1%>'">></button> --%>
					<%
						}
					%>


				</div>




				<!-- <div class="numbox pt40 pb50"> 
			<span><a class="num" href="#">&lt;</a></span>
			<span><a class="num on" href="#">1</a></span>
			<span><a class="num" href="#">2</a></span>
			<span><a class="num" href="#">3</a></span>
			<span><a class="num" href="#">4</a></span>
			<span><a class="num" href="#">5</a></span>
			<span><a class="num" href="#">6</a></span>
			<span><a class="num" href="#">7</a></span>
			<span><a class="num" href="#">8</a></span>
			<span><a class="num" href="#">9</a></span>
			<span><a class="num" href="#">&gt;</a></span>
		</div> -->

			</div>
			<!--// inner E-->
		</div>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>

</html>