<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import ="com.kh.jinkuk.border.review.model.vo.*"%>
<%
	Review r = (Review)request.getAttribute("r");
%>
<%@ include file="/views/include/common.jsp" %>

<title>후기게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">후기게시판</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			후기게시판
			<span>홈 &gt; 후기게시판</span>
		</div>

		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">글 번호 </th>
				<td><span><%=r.getHno() %></span></td>
				<th scope="row">제목</th>
				<td><span><%=r.gethTitle() %></span></td>
				
			</tr>
			<tr>
				<th scope="row">기사명</th>
				<td><span><%=r.getDriname() %></span></td>
				<th scope="row">신청자</th>
				<td><span><%=r.getUname() %></span></td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>
								<%for(int i=0; i<r.gethGrade(); i++){%>
								<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
							<%}for(int i=0; i<5-r.gethGrade(); i++){	%>
							<span><img src="/reqtakbae/views/common/images/contents/starOff.png" alt="별off"></span>
							<%}%>
							</td>
				<th scope="row">작성일</th>
				<td><span><%=r.gethDate() %></span></td>
			</tr>
			<tr>
				<td colspan="4" class="">
					<span><%=r.gethContext() %></span>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->
		

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href='<%=request.getContextPath()%>/selectReview'>목록</a></span>
			<% if(loginUser != null && loginUser.getUser_id().equals(r.getUname())){ %>
			<span><a class="mbtn gy" href='<%=request.getContextPath()%>/updateReview?hno=<%=r.getHno()%>&driId=<%=r.getDriId()%>'>수정</a></span>
			<span><a class="mbtn rd" href='<%=request.getContextPath()%>/deleteReview?hno=<%=r.getHno()%>'>삭제</a></span>
			<%}%>  
		</div><!--// btnbox E-->



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>