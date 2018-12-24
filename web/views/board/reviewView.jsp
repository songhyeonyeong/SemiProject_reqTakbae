<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>후기게시판</title>

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



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>