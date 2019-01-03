<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	Review re = (Review)request.getAttribute("re");	
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
				<th scope="row">제목</th>
				<td colspan="3"><%=re.gethTitle() %></td>
			</tr>
			<tr>
				<th scope="row">기사명</th>
				<td><%=re.getDriname() %> 기사님</td>
				<th scope="row">신청자</th>
				<td><%=re.getUname() %></td>
			</tr>
			<tr>
				<th scope="row">별점</th>
					<td>
						<%for(int i=0; i<re.gethGrade(); i++){%>
							<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
						<%}for(int i=0; i<5-re.gethGrade(); i++){	%>
							<span><img src="/reqtakbae/views/common/images/contents/starOff.png" alt="별off"></span>
						<%}%>
					</td>
				<th scope="row">작성일</th>
				<td><%=re.gethDate() %></td>
			</tr>
			<tr>
				<td colspan="4" class=""><%=re.gethContext() %></td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->
		

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="/reqtakbae/selectAll.re">목록</a></span>
			<span><a class="mbtn rd" href="#">삭제</a></span>
		</div><!--// btnbox E-->

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>