<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="2";
%>
<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>내 공고 목록</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/hyun/myPost/include/tabMypage.jsp" %>
		
		<!-- <div class="titNavi">
			내 공고 목록
			<span>홈 &gt; 마이페이지 &gt; 내 공고 목록</span>
		</div> -->

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
					<th scope="col">상세</th>
					<th scope="col">기사선택</th>
					<th scope="col">선택기사</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>당일</td>
					<td>20181217001</td>
					<td>맥북 배송</td>
					<td>2018-12-03</td>
					<td><a class="sbtn gy" href="deliView.jsp">상세보기</a></td>
					<td><a class="sbtn db" href="deliDetail.jsp">기사선택</a></td>
					<td>기사미지정</td>
				</tr>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>일반</td>
					<td>20181217002</td>
					<td>맥북 배송</td>
					<td>2018-12-03</td>
					<td><a class="sbtn gy" href="deliView.jsp">상세보기</a></td>
					<td><a class="sbtn gy" href="deliDetail.jsp">선택완료</a></td>
					<td>ddeded112</td>
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