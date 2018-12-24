<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>내 문의내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">내 문의내역</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			내 문의내역
			<span>홈 &gt; 내 문의내역</span>
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
					<p><a href="#"></a></p>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<table class="boardWrite"><!-- boardWrite S-->
			<caption>답변내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row" class="blue80">답변 내용</th>
				<td class="minh100 clfix">
					안녕하십니까 홍길동회원님<br>
					1:1문의 담당자 둘리입니다.<br><br>

					문의하신사항 확인 후 안내드리려 하였으나, 고객님께서 문의 남겨주신 후 배송받으신것으로 확인됩니다.<br>
					빠른도움드리지 못한점 진심으로 사과드립니다.<br><br>
					
					좋은하루되시길바랍니다.<br>
					감사합니다
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="qnaList.jsp">목록</a></span>
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