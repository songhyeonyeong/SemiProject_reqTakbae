<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String bigtabon="6";
Inquiry n = (Inquiry)request.getAttribute("n");	
	Inquiry m = (Inquiry)request.getAttribute("m");	
%>
<%@ include file="/views/include/common.jsp" %>

<title>내 공고 목록</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
		<tr>
				<th scope="row">글번호</th>
				<td id="inquiryNo"><%=n.getM_no()%></td>
			</tr> 
		 	<tr>
				<th scope="row">작성자</th>
				<td id="answer"><%=n.getU_no()%></td>
			</tr> 
			<tr>
				<th scope="row">문의 제목</th>
				<td><%=n.getM_title()%></td>
			</tr>
			<tr>
				<th scope="row">문의 내용</th>
				<td class="minh100 clfix"><%=n.getM_context() %></td>
			</tr>
			<tr>
			<tr>
				<th scope="row">답변</th>
				<td>
				<%if(m != null){ %>
					<%=m.getM_context()%>
							
					<div id="replySelectArea">
						<table>
							<td scope="row" id="replySelectTable"></td>
							
							<br><br>
							<p align="right">작성날짜 : <%=m.getM_date() %></p>
						</table>
					</div>
					<%}else{ %>
					<div id="replySelectArea">
						<table>
						<%-- 	<td scope="row" id="replySelectTable"></td>
							<td><%=m.getM_date() %></td> --%>
						</table>
					</div>
					<%} %>
					
				</td>
			</tbody>
		</table><!--// boardWrite E-->

		<table class="boardWrite"><!-- boardWrite S-->
			<caption>답변내역 리스트입니다.</caption>
		<colgroup>
					<col style="width:20%;">
				</colgroup>
				<tbody>
				<%if(m !=null){ %>
				<tr style="width:100%; height:100%;" hidden>
					<th scope="row" class="blue80">답변 내용</th>
					<td class="clfix">
						<textarea cols="20" rows="5" id="replyContent" style="width:100%;" class="minh100"></textarea>
					</td>
				</tr>
				<%}else{%>
				<tr style="width:100%; height:100%;">
					<th scope="row" class="blue80">답변 내용</th>
					<td class="clfix">
						<textarea cols="20" rows="5" id="replyContent" style="width:100%;" class="minh100"></textarea>
					</td>
				</tr>
				
				<%} %>
				</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="<%=request.getContextPath()%>/SelectMyInquiry.mp">목록</a></span>
			<span><a class="mbtn rd" href="#">삭제</a></span>
		</div><!--// btnbox E-->



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>