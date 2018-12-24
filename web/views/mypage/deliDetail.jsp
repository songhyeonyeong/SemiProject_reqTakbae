<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>기사 선택</title>

<script type="text/javascript">
function fn_open() {
   window.open('deliDetailPop.jsp','deliDetailPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=700,height=600');
}
</script>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			기사 선택
			<span>홈 &gt; 마이페이지 &gt; 기사 선택</span>
		</div>

		<table class="boardList mt20">
			<caption>전체공고 리스트입니다.</caption>
			<colgroup>
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">기사ID</th>
					<th scope="col">기사이름</th>
					<th scope="col">기사 평점</th>
					<th scope="col">상세</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>testid1111</td>
					<td>홍길동</td>
					<td>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					</td>
					<td><a class="sbtn or" href="#fn_open" onclick="fn_open()">상세보기</a></td>
				</tr>
				<tr>
					<td>
						<label for=""> 체크</label>
						<input id="" name="" class="check" type="checkbox">
					</td>
					<td>testid1111</td>
					<td>홍길동</td>
					<td>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
					</td>
					<td><a class="sbtn or" href="#fn_open" onclick="fn_open()">상세보기</a></td>
				</tr>
			</tbody>
		</table>

		<p class="tcen mt30"><a class="mbtn or" href="deliList.jsp">선택하기</a></p>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>