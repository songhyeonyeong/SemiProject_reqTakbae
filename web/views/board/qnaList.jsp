<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*,
 com.kh.jinkuk.border.inquire.model.vo.*"%>

<%
	ArrayList<Inquire> list = (ArrayList<Inquire>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<%@ include file="/views/include/common.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>내 문의내역</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual"> 문의내역</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 


		<table class="boardList mt30">
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:6%;"><!-- No -->
				<col style="width:14%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:15%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead id="listArea">
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">답변여부</th>
			</tr>
			<%
				
				for(Inquire i : list){
					
			%>
			<tr>
			<input type="hidden" value="<%=i.getM_no() %>">
			<td><%=i.getRnum() %></td>
				<td><%=i.getM_title() %></td>
				<td><%=i.getM_context()%></td>
				<td><%=i.getUser_id() %></td>
				<td><%=i.getM_date() %></td>
				<td><%=i.getRefstatus() %></td>
				
			</tr>
				<%
				
				}%>
		
		</thead>
		</table>
		<p class="flo_right mb10"><button class="mbtn or" onclick="location.href='views/board/qnaWrite.jsp'">후기 작성</button></p>

	


	</div><!--// inner E-->
</div>
<div class="numbox pt40 pb50" align="center">
					<span><a class="num" href="#" 
					onclick="location.href='<%=request.getContextPath()%>/selectInquireList?currentPage=1'"><<</a></span>
					<% if (currentPage <= 1) {%>
					<span disabled><a class="num" href="#" ><</a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectInquireList?currentPage=<%=currentPage - 1%>'"><</a></span>
					<%}%>

					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
					<span disabled><a class="num" href="#" ><%=p%></a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectInquireList?currentPage=<%=p%>'"><%=p%></a></span>
					<%}%>
					<%}%>

					<%
						if (currentPage >= maxPage) {
					%>
					<span disabled><a class="num" href="#" >></a></span>
					<%} else {%>
					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectInquireList?currentPage=<%=currentPage + 1%>'">></a></span>
					<%}%>

					<span><a class="num" href="#" 
						onclick="location.href='<%=request.getContextPath()%>/selectInquireList?currentPage=<%=maxPage%>'">>></a></span>
				</div>
				
				<!-- 상세 보기 클릭 -->
				<script>
				$(function(){
				$("#listArea td").mouseenter(function(){
					$(this).parent().css({"background":"darkgray", "cursor":"pointer"})
					}).mouseout(function(){
						$(this).parent().css({"background":"white"});
					}).click(function(){
						var num=$(this).parent().children("input").val();
					
						location.href="<%=request.getContextPath()%>/selectOneIn?num="+num;
					});
				});
				
				
				</script>
				
				
				
				
<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>