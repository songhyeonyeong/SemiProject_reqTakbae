<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>후기게시판</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">후기게시판</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			후기게시판
			<span>홈 &gt; 후기게시판</span>
		</div>


		<div class="topsearch mt30 mb30"><!-- topsearch S -->
			<span>
				<label for="col01"></label>
				<select id="col01" name="col01" class="wth140">
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">기사명</option>
					<option value="">작성자</option>
				</select> 
			</span>
			<span>
				<label for="Keyword"></label><input id="Keyword" name="Keyword" class="wth240" type="text">
				<a class="sch" href="#"><img src="../common/images/contents/icoSearch.png" alt="검색" title="검색"></a> 
			</span>
		</div>


		<table class="boardList mt20">
			<caption>후기게시판 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
				<col style="width:%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:13%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">제목</th>
					<th scope="col">기사명</th>
					<th scope="col">작성자</th>
					<th scope="col">평점</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>9</td>
					<td class="tleft"><a href="reviewView.jsp">넘친절해용~~~~~~~~~~~~~~~ㅎㅎ</a></td>
					<td>현빈 기사님</td>
					<td>박**</td>
					<td>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
					</td>
					<td>2018-12-03</td>
				</tr>
				<tr>
					<td>8</td>
					<td class="tleft"><a href="reviewView.jsp">눈이부셔서 평점1!!!!!</a></td>
					<td>박보검 기사님</td>
					<td>이**</td>
					<td>
						<span><img src="../common/images/contents/starOn.png" alt="별on"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
						<span><img src="../common/images/contents/starOff.png" alt="별off"></span>
					</td>
					<td>2018-12-03</td>
				</tr>
			</tbody>
		</table>

		
		<p class="flo_right mt10"><a class="mbtn or" href="reviewWrite.jsp">후기작성하기</a></p>
		
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