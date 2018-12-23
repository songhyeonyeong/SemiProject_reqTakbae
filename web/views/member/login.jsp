<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>로그인</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">로그인</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->

		<table class="boardWrite wth500 mr_auto mt30"><!-- boardWrite S-->
			<caption>로그인 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">이메일 주소</th>
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
				<th scope="row">연락처</th>
				<td>
					<span><label for=""></label><input id="" name="" class="wth50" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="" name="" class="wth60" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="" name="" class="wth60" type="text" value="" ></span>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">새로입력</a></span>
			<span><a class="mbtn db" href="join3.jsp">로그인하기</a></span>
		</div><!--// btnbox E-->

	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>