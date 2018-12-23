<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="7";
%>
<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>회원정보수정</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/hyun/myPost/include/tabMypage.jsp" %>

		
		<div class="rtv of mt30">

			<div class="flo_left wth300"><!-- flo_left S-->
				<img src="http://via.placeholder.com/300x300" alt="상품이미지">
				<div class="input-file mt10"> 
					<input type="text" readonly="readonly" class="file-name wth295" /> 
					<label for="upload01" class="file-label">상품 이미지 업로드</label> 
					<input type="file" name="" id="upload01" class="file-upload" /> 
				</div>
			</div><!--// flo_left E-->

			<div class="flo_right wth850"><!-- flo_right S-->
			
			<table class="boardWrite wth850"><!-- boardWrite S-->
			<caption>회원정보수정 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td colspan="3">
					<label for=""></label>
					<input id="" name="" class="wth300" type="text" value="" >
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td>
					<label for=""></label>
					<input id="" name="" class="wth300" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td>
					<label for=""></label>
					<input id="" name="" class="wth300" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<label for=""></label>
					<input id="" name="" class="wth300" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>
					<span><label for=""></label><input id="" name="" class="wth50" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="" name="" class="wth60" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="" name="" class="wth60" type="text" value="" ></span>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>
					<span><label for=""></label><input id="" name="" class="wth100" type="text" value="" ></span>
					<span>@</span>
					<span><label for=""></label><input id="" name="" class="wth100" type="text" value="" ></span>
					<span><a class="sbtn db" href="#">인증하기</a></span>
				</td>
			</tr>
			<tr>
				<th scope="row">계좌번호</th>
				<td>
					<span><label for=""></label><input id="" name="" class="wth230" type="text" value="" ></span>
					<span><a class="sbtn db" href="#">인증하기</a></span>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		</div><!--// flo_right E-->
		</div>

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">취소</a></span>
			<span><a class="mbtn db" href="#">수정하기</a></span>
		</div><!--// btnbox E-->
	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>