<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="6";
%>
<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>나의 문의내역</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/hyun/myPost/include/tabMypage.jsp" %>

		<table class="boardList mt30">
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:6%;"><!-- No -->
				<col style="width:14%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:15%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
				<th scope="col">답변여부</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>배송문의</td>
				<td class="tleft"><a href="myQnaView.jsp">택배가 안와요!!</a></td>
				<td>2018-11-11</td>
				<td>답변완료</td>
			</tr>
			<tr>
				<td>2</td>
				<td>아이디/비밀번호문의</td>
				<td class="tleft"><a href="myQnaView.jsp">비밀번호가 생각이안나요</a></td>
				<td>2018-11-11</td>
				<td>대기중</td>
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