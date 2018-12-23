<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>

		<table class="boardWrite wth500 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원가입 리스트입니다.</caption>
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
					<span><label for=""></label><input id="" name="" class="wth300" type="text" value="" ></span>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">새로입력</a></span>
			<span><a class="mbtn db" href="join3.jsp">회원가입하기</a></span>
		</div><!--// btnbox E-->

	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>