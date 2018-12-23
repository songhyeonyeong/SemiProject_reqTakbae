<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>신고하기</title>

</head>
<body>


<div id="pop"><!-- Wrap S -->

	<div class="tit">신고하기</div>

	<div class="popCont">
		
		<table class="boardWrite"><!-- boardWrite S-->
			<caption>신고하기 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">공고번호</th>
				<td>20181217</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>배송구합니다.</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th scope="row">사유선택</th>
				<td>
					<p>해당하는 사유를 선택해주세요.</p>
					<ul>
						<li>
							<label for=""></label><input id="" name="" class="" type="radio" value="" > 부적절한 홍보 게시글
						</li>
						<li>
							<label for=""></label><input id="" name="" class="" type="radio" value="" > 음란성 또는 청소년에게 부적합한 내용
						</li>
						<li>
							<label for=""></label><input id="" name="" class="" type="radio" value="" > 명예훼손/사생활 침해 및 저작권 침해 등
						</li>
						<li>
							<p><label for=""></label><input id="" name="" class="" type="radio" value="" > 기타</p>
							<p><textarea class="inp_info tf_info" cols="24" id="" name=""></textarea></p>
						</li>
					</ul>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn rd" href="#">신고하기</a></span>
			<span><a class="mbtn gy" href="#">취소</a></span>
		</div><!--// btnbox E-->

	</div>

</div><!--// Wrap E-->


</body>
</html>