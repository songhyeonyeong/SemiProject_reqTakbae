<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>문의하기</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">문의하기</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			문의하기
			<span>홈 &gt; 문의하기</span>
		</div>

		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">문의 분류</th>
				<td>배송문의</td>
			</tr>
			<tr>
				<th scope="row">문의 제목</th>
				<td>배송이 안와요</td>
			</tr>
			<tr>
				<th scope="row">문의 내용</th>
				<td class="minh100 clfix">
					배송 왜 안오나요!!!!!!!!!!!!!<br>
					배송 왜 안오나요!!!!!!!!!!!!!<br>
					배송 왜 안오나요!!!!!!!!!!!!!<br>
					배송 왜 안오나요!!!!!!!!!!!!!<br>
					배송 왜 안오나요!!!!!!!!!!!!!<br>
				</td>
			</tr>
			<tr>
				<th scope="row">파일 첨부</th>
				<td>
					<p><a href="#">12351251255.jpg</a></p>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->
		<table class="boardWrite"><!-- boardWrite S-->
			<caption>문의하기 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row" class="blue80">답변 내용</th>
				<td>
					<label for=""></label>
					<textarea class="inp_info tf_info" cols="24" id="" name=""></textarea>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">목록</a></span>
			<span><a class="mbtn db" href="qnaList.jsp">답변완료</a></span>
		</div><!--// btnbox E-->
		



	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>