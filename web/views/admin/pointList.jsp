<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String tabon="2";
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 포인트 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_point.jsp" %>

			<table class="boardList mt20">
			<caption>충전적립 리스트입니다.</caption>
			<colgroup>
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
				<th scope="col">날짜</th>
				<th scope="col">이용 포인트</th>
				<th scope="col">누적 포인트</th>
				<th scope="col">비고</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>충전</td>
				<td>2018-12-12 12:44:24</td>
				<td>500,000</td>
				<td>504,155</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>2</td>
				<td>사용</td>
				<td>2018-12-13 22:44:24</td>
				<td>-50,000</td>
				<td>454,155</td>
				<td>금천구 배송 부탁드립니다!</td>
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