<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="2";
%>
<%@ include file="/views/include/common.jsp" %>

<title>요금조회</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">이용안내</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->

		<%@ include file="/views/include/tabInfo.jsp" %>	 

		<div class="titNavi">
			요금조회
			<span>홈 &gt; 이용안내 &gt; 요금조회</span>
		</div>

		<table class="lineBoard2 mt20">
			<caption>요금조회 리스트입니다.</caption>
			<colgroup>
				<col style="width:10%;"><!--  -->
				<col style="width:30%;"><!--  -->
				<col style="width:30%;"><!--  -->
				<col style="width:30%;"><!--  -->
			</colgroup>
			<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">소</th>
				<th scope="col">중</th>
				<th scope="col">대</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>규격</td>
				<td>
					<p><img src="../common/images/contents/boxS.png" alt="box small"></p>
					<p class="mt20">가로:100cm<br>세로:100cm</p>
				</td>
				<td>
					<p class="mt10"><img src="../common/images/contents/boxM.png" alt="box middle"></p>
					<p class="mt20">가로:120cm<br>세로:120cm</p>
				</td>
				<td>
					<p class="mt10"><img src="../common/images/contents/boxB.png" alt="box big"></p>
					<p class="mt20">가로:160cm<br>세로:160cm</p>
				</td>
			</tr>
			<tr>
				<td>무게</td>
				<td>5kg</td>
				<td>10kg</td>
				<td>20kg</td>
			</tr>
			<tr>
				<td>금액</td>
				<td>4500</td>
				<td>4800</td>
				<td>5500</td>
			</tr>
			</tbody>
		</table>
		
		<ul class="inlineUl mt30 tcen">
			<li>
				<span>무게 : </span>
				<span>
				<label for=""></label>
				<input id="" name="" class="wth100" type="text" value="" >
				</span>
				<span>kg</span>
			</li>
			<li class="ml100">
				<span>크기 : </span>
				<span><label for=""></label><input id="" name="" class="" type="radio" value="" > </span>
				<span>소</span>
				<span><label for=""></label><input id="" name="" class="" type="radio" value="" > </span>
				<span>중</span>
				<span><label for=""></label><input id="" name="" class="" type="radio" value="" > </span>
				<span>대</span>
			</li>
			<li class="ml100">
				<span>금액 : </span>
				<span>
				<label for=""></label>
				<input id="" name="" class="wth100" type="text" value="" >
				</span>
				<span>원</span>
			</li>
		</ul>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>