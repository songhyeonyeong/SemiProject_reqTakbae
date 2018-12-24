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
				<td colspan="3"><label for=""></label><input id="" name="" class="wth90p" type="text" value="" ></td>
			</tr>
			<tr>
				<th scope="row">기사명</th>
				<td><label for=""></label><input id="" name="" class="" type="text" value="" ></td>
				<th scope="row">신청자</th>
				<td>김**</td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>
					<label for=""></label>
					<select id="" name="" class="input wth200">
						<option selected="selected">별점 선택</option>
						<option value="#">5점</option>
						<option value="#">4점</option>
						<option value="#">3점</option>
						<option value="#">2점</option>
						<option value="#">1점</option>
					</select> 
				</td>
				<th scope="row">작성일</th>
				<td>2018-12-12</td>
			</tr>
			<tr>
				<td colspan="4">
					<label for=""></label>
					<textarea class="wth90p" cols="24" id="" name=""></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">파일 첨부</th>
				<td colspan="3">
					<div class="input-file"> 
						<input type="text" readonly="readonly" class="file-name wth600" /> 
						<label for="upload01" class="file-label">파일 업로드</label> 
						<input type="file" name="" id="upload01" class="file-upload" /> 
					</div>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="reviewList.jsp">목록</a></span>
			<span><a class="mbtn db" href="#">등록하기</a></span>
		</div><!--// btnbox E-->
		



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>