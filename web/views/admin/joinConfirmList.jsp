<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 배송기사 승인</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<div class="flo_right mt30 mb30">
				<span><a class="mbtn wh" href="#">전체선택</a></span>
				<span><a class="mbtn db" href="#">승인</a></span>
				<span><a class="mbtn rd" href="#">거부</a></span>
			</div>

			<table class="boardList mt20">
				<caption>배송기사 승인 리스트입니다.</caption>
				<colgroup>
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
				</colgroup>
				<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">No</th>
					<th scope="col">이름</th>
					<th scope="col">아이디</th>
					<th scope="col">주소</th>
					<th scope="col">이메일</th>
					<th scope="col">계좌번호</th>
					<th scope="col">핸드폰번호</th>
					<th scope="col">신청자</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>20180112</td>
					<td>김길동</td>
					<td>test1234</td>
					<td>경기도 화성시</td>
					<td>abc@gmail.com</td>
					<td>123-45-678900</td>
					<td>010-1234-5678</td>
					<td><a class="sbtn gy" href="#">확인</a></td>
				</tr>
				</tbody>
			</table>

			<div class="numbox pt40 pb50"> 
				<span><a class="num" href="#">&lt;</a></span>
				<span><a class="num on" href="#">1</a></span>
				<span><a class="num" href="#">2</a></span>
				<span><a class="num" href="#">3</a></span>
				<span><a class="num" href="#">4</a></span>
				<span><a class="num" href="#">5</a></span>
				<span><a class="num" href="#">6</a></span>
				<span><a class="num" href="#">7</a></span>
				<span><a class="num" href="#">8</a></span>
				<span><a class="num" href="#">9</a></span>
				<span><a class="num" href="#">&gt;</a></span>
			</div>

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>