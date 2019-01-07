<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.util.Calendar"
import="com.kh.jinkuk.border.review.model.vo.*" %>

<%
	Review r=(Review)request.getAttribute("r");
	
	Calendar cal = Calendar.getInstance();
	int year= cal.get(Calendar.YEAR);
	int month =cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
	String tyear = String.valueOf(year);
	String tmonth = String.valueOf(month);
	String tdate = String.valueOf(date);
	String Todat =tyear+"-"+tmonth+"-"+tdate;
%>
<%@ include file="/views/include/common.jsp" %>

<title>후기게시판</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">후기게시판</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			후기게시판
			<span>홈 &gt; 후기게시판</span>
		</div>
		
		<form id="updateForm" method="post">
		
		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<%
							if (loginUser != null) {
						%>
			<colgroup>
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>
			
			
			<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td><input id="hno" name="hno" class="wth90p" type="text" value="<%=r.getHno() %>" readonly></td>
				<th scope="row">제목</th>
				<td><input id="title" name="title" class="wth90p" type="text" value="<%=r.gethTitle() %>"></td>
			</tr>
			<tr>
				<th scope="row">기사명</th>
				
				<td><input id="driname" name="driname" class="" type="text" value="<%=r.getDriname() %>" readonly>
					<input type="hidden" value="<%=r.getDriId() %>" name="driId">
				</td>
				<th scope="row">신청자</th>
				<td>
					<input type="text" value="<%=loginUser.getUser_id()%>" name="writer" readonly>
					<input type="hidden" value="<%=loginUser.getU_no() %>" name="uno">
					<input type="hidden" value="<%=r.getGno() %>" name="gno" id="gno">
				</td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>
					<label for=""></label>
					<select id="starScore" name="starScore" class="input wth200">
						<option selected="selected">별점 선택</option>
						<option value="5">5점</option>
						<option value="4">4점</option>
						<option value="3">3점</option>
						<option value="2">2점</option>
						<option value="1">1점</option>
					</select> 
				</td>
				<th scope="row">작성일</th>
				<td>
					<input type="text" value="<%=Todat%>" name="date" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<label for=""></label>
					<textarea class="wth90p" cols="24" id="" name="reviewContext" value="<%=r.gethContext()%>"><%=r.gethContext()%></textarea>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->
		
		
		
		</div>

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><button class="mbtn gy" onclick="complete()">수정하기</button></span>
		
		</div>
		
		
		<script>
		function complete(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/updateOneR");
						}
					</script>
				
				
				</form>
				<%
					} else {
						request.getRequestDispatcher("../common/errorPage.jsp");
					}
				%>
		
		<!--// btnbox E-->
		
		
		



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>