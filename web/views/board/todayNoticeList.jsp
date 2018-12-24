<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>오늘의 공고</title>

<script type="text/javascript">
function fn_open() {
   window.open('reportPop.jsp','reportPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=600,height=600');
}
</script>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">오늘의 공고</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			오늘의 공고
			<span>홈 &gt; 오늘의 공고</span>
		</div>

		
		<h2 class="tcen cal mt20">당일 날짜 : <em class="font20 darkred">2019.01.01</em></h2>

		<table class="searchTbl mt20 mb30"><!-- searchTbl S -->
			<caption>공고 검색입니다.</caption>
			<colgroup>
				<col style="width:15%;">
				<col style="width:%;">
				<col style="width:15%;">
				<col style="width:%;">
				<col style="width:15%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">도착</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">서울시 전체</option>
						<option value="">강남구</option>
						<option value="">---</option>
					</td>
					<th scope="col">크기</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">전체</option>
						<option value="">소</option>
						<option value="">중</option>
						<option value="">대</option>
					</td>
					<th scope="col">상태</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">전체</option>
						<option value="">모집중</option>
						<option value="">배송중</option>					
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="btnbox mb30">
			<span><a class="mbtn db wth60" href="#">검색</a></span>
		</div>

		<p class="flo_left mb10"><a class="mbtn rd"  href="#fn_open" onclick="fn_open()">신고하기</a></p><!-- user에게만 보임 -->
		<p class="flo_right mb10"><a class="mbtn or" href="todayNoticeWrite.jsp">공고등록하기</a></p><!-- user에게만 보임 -->

		<table class="boardList mt20">
			<caption>전체공고 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:13%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">공고번호</th>
					<th scope="col">출발지</th>
					<th scope="col">도착지</th>
					<th scope="col">공고내용</th>
					<th scope="col">배송날짜</th>
					<th scope="col">크기</th>
					<th scope="col">금액</th>
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
					<td>20181217</td>
					<td>강서구</td>
					<td>강남구</td>
					<td>맥북 배송</td>
					<td>2018-12-03</td>
					<td>중</td>
					<td>8000</td>
					<td class="darkblue bold">모집중</td>
					<td><a class="sbtn gy" href="todayNoticeView.jsp">상세보기</a></td>
				</tr>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>20181217</td>
					<td>강서구</td>
					<td>강남구</td>
					<td>맥북 배송</td>
					<td>2018-12-03</td>
					<td>중</td>
					<td>8000</td>
					<td class="orange bold">배송중</td>
					<td><a class="sbtn gy" href="todayNoticeView.jsp">상세보기</a></td>
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