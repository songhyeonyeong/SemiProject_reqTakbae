<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import ="com.kh.jinkuk.border.inquire.model.vo.*"%>

<% Inquire i=(Inquire)request.getAttribute("i"); 
		Inquire ai=(Inquire)request.getAttribute("ai");%>

<%@ include file="/views/include/common.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>내 문의내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">내 문의내역</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 

		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td colspan="3"><a name="mno" value="<%=i.getM_no()%>"><%=i.getM_no()%></a></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3"><a title="mno" value="<%=i.getM_title()%>"><%=i.getM_title()%></a></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="3"><a context="mno" value="<%=i.getM_context() %>"><%=i.getM_context() %></a></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td colspan="3"><a writer="mno" value="<%=i.getUser_id()%>"><%=i.getUser_id()%></a></td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td colspan="3"><a date="mno" value="<%=i.getM_date() %>"><%=i.getM_date()%></a></td>
			</tr>
			<tr>
			
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<table class="boardWrite"><!-- boardWrite S-->
			<caption>답변내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row" class="blue80">답변 </th>
				<%if(ai != null){ %>
					<td><%=ai.getM_context() %></td>
					<td><%=ai.getM_date() %></td>
			<%}else{ %>
					<td></td>
					<td></td>
				<%} %>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href='<%=request.getContextPath()%>/selectInquireList'>목록</a></span>
			<% if(loginUser != null && loginUser.getUser_id().equals(i.getUser_id())){ %>
			<span><a class="mbtn gy" href='<%=request.getContextPath()%>/updateInquire?mno=<%=i.getM_no()%>'>수정</a></span>
			<span><a class="mbtn rd" href='<%=request.getContextPath()%>/deleteInquire?mno=<%=i.getM_no()%>'>삭제</a></span>
		<%} %>
		</div><!--// btnbox E-->
		



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>