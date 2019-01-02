<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
	<%
		String userid=(String)request.getParameter("id");
		String username=(String)request.getParameter("name");
		String phone =(String)request.getParameter("phone");
		int count=Integer.parseInt(request.getParameter("count"));
		int grade=Integer.parseInt(request.getParameter("grade"));
	%>
<%@ include file="/views/include/common.jsp" %>

<title>기사정보</title>
<script type="text/javascript">
 $(function(){
	
	 
	 
	 
	 
 });
 
 
</script>
</head>
<body onload="window.resizeTo(700,600)">
<div id="pop"><!-- Wrap S -->

	<div class="tit">기사정보</div>

	<div class="popCont">
		
		<div class="rtv of mt30">

			<div class="flo_left wth250"><!-- flo_left S-->
				<img src="http://via.placeholder.com/250x250" alt="기사사진">
			</div><!--// flo_left E-->

			<div class="flo_right wth380"><!-- flo_right S-->
			
				<table class="boardWrite wth380"><!-- boardWrite S-->
				<caption>기사정보 리스트입니다.</caption>
				<colgroup>
					<col style="width:30%;">
					<col style="width:%;">
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td colspan="3"><%=userid %></td>
				</tr>				
				<tr>
					<th scope="row">이름</th>
					<td><%=username %></td>
				</tr>
				<tr>
					<th scope="row">휴대폰번호</th>
					<td><%=phone %></td>
				</tr>
				<tr>
					<th scope="row">배송 누적 횟수</th>
					<td><%=count %></td>
				</tr>
				<tr>
					<th scope="row">별점</th>
					<td>
								<%for(int i=0; i<grade; i++){%>
								<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
							<%}for(int i=0; i<5-grade; i++){	%>
							<span><img src="/reqtakbae/views/common/images/contents/starOff.png" alt="별off"></span>
							<%}%>
							</td>
				</tr>
				</tbody>
			</table><!--// boardWrite E-->

		</div><!--// flo_right E-->
		</div>
		<!-- <table class="boardList mt10">
			<caption>후기 리스트입니다.</caption>
			<colgroup>
				<col style="width:33.33%;">
				<col style="width:33.33%;">
				<col style="width:33.33%;">
			</colgroup>
			<thead>
			<tr>
				<th scope="col">후기</th>
				<th scope="col">작성자</th>
				<th scope="col">별점</th>
			</tr>
			</thead>
			<tbody> -->
	<!-- 		<tr>
				<td class="tleft pl10">배송기사님 너무 친절하세요</td>
				<td>te****</td>
				<td>
				<span><img src="/reqtakbae/views/common/images/contents/starOn.png" alt="별on"></span>
				</td>
			</tr>
			<tr>
				<td class="tleft pl10">무난합니다</td>
				<td>st****</td>
				<td>
					<span><img src="/reqtakbae/views/common/images/contents/starOff.png" alt="별on"></span>
				</td>
			</tr> -->
			</tbody>
		</table>

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" onclick="window.close()">닫기</a></span>
		</div><!--// btnbox E-->

	</div>

</div><!--// Wrap E-->


</body>
</html>