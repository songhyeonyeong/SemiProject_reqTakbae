<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="5";
%>
<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>환전내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/hyun/myPost/include/tabMypage.jsp" %>

		<p class="flo_right mb10"><a class="mbtn or" href="#">환전하기</a></p>

		<table class="boardList mt20">
			<caption>충전적립 리스트입니다.</caption>
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
				<th scope="col">no</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">포인트</th>
				<th scope="col">실수령액</th>
				<th scope="col">계좌번호</th>
				<th scope="col">은행명</th>
				<th scope="col">일시</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>일반</td>
				<td>ssss11234</td>
				<td>홍길동</td>
				<td>50,000</td>
				<td>45,000</td>
				<td>123-45-678900</td>
				<td>우리</td>
				<td>2018-12-12 18:05:33</td>
			</tr>
			<tr>
				<td>2</td>
				<td>일반</td>
				<td>ssss11234</td>
				<td>홍길동</td>
				<td>50,000</td>
				<td>45,000</td>
				<td>123-45-678900</td>
				<td>우리</td>
				<td>2018-12-12 18:05:33</td>
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

	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>