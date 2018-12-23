<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 신고내역</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			
			<table class="boardList mt20">
				<caption>신고내역 리스트입니다.</caption>
				<colgroup>
					<col style="width:%;"><!--  -->
				</colgroup>
				<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">신고자ID</th>
					<th scope="col">신고글번호</th>
					<th scope="col">신고글제목</th>
					<th scope="col">작성자</th>
					<th scope="col">선택사유</th>
					<th scope="col">신고사유</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td>testid12</td>
					<td>22</td>
					<td>@@알바급구@@</td>
					<td>albagogo</td>
					<td>부적절한 홍보글</td>
					<td>홍보글 너무싫습니다 ㅡㅡ</td>
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