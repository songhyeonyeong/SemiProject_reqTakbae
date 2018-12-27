<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="3";
%>
<%@ include file="/views/include/common.jsp" %>

<title>배송중 공고목록</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<table class="boardList mt20">
			<caption>전체공고 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
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
					<th scope="col">No</th>
					<th scope="col">구분</th>
					<th scope="col">공고번호</th>
					<th scope="col">공고내용</th>
					<th scope="col">배송날짜</th>
					<th scope="col">선택기사</th>
					<th scope="col">상태</th>
					<th scope="col">상세</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>당일</td>
					<td>20181217002</td>
					<td>맥북 배송</td>
					<td>2018-12-03</td>
					<td>ddeded112</td>
					<td>인수</td>
					<td><a class="sbtn gy" href="deliView.jsp">상세보기</a></td>
				</tr>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>일반</td>
					<td>20181217004</td>
					<td>나이키 신발</td>
					<td>2018-12-03</td>
					<td>suhyun003</td>
					<td>배송중</td>
					<td><a class="sbtn gy" href="deliView.jsp">상세보기</a></td>
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

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>