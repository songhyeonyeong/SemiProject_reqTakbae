<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String tabon="1";
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
				<td colspan="3">넘친절해용~~~~~~~~~~~~~~~ㅎㅎ</td>
			</tr>
			<tr>
				<th scope="row">기사명</th>
				<td>현빈 기사님</td>
				<th scope="row">신청자</th>
				<td>김**</td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>
					<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
				</td>
				<th scope="row">작성일</th>
				<td>2018-12-12</td>
			</tr>
			<tr>
				<td colspan="4" class="">
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
					넘친절해용~~~~~~~~~~~~~~~ㅎㅎ<br>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->
		

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="reviewList.jsp">목록</a></span>
			<span><a class="mbtn gy" href="#">수정</a></span>
			<span><a class="mbtn rd" href="#">삭제</a></span>
		</div><!--// btnbox E-->

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>