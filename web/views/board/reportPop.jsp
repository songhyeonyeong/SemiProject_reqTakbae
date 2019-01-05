<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	int gno = Integer.parseInt(request.getParameter("gno"));
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	int uno = Integer.parseInt(request.getParameter("uno"));
%>
<%@ include file="/views/include/common.jsp" 
%>

<title>신고하기</title>

</head>
<body>


<div id="pop"><!-- Wrap S -->

	<div class="tit">신고하기</div>

	<div class="popCont">
		
		<table class="boardWrite"><!-- boardWrite S-->
			<caption>신고하기 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">공고번호</th>
				<td><%= gno %></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td><%= title %></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th scope="row">사유선택</th>
				<td>
					<p>해당하는 사유를 선택해주세요.</p>
					<ul>
						<li>
							<label for=""></label><input id="" name="report" class="" type="radio" value="부적절한 홍보 게시글" > 부적절한 홍보 게시글
						</li>
						<li>
							<label for=""></label><input id="" name="report" class="" type="radio" value="음란성 또는 청소년에게 부적합한 내용" > 음란성 또는 청소년에게 부적합한 내용
						</li>
						<li>
							<label for=""></label><input id="" name="report" class="" type="radio" value="명예훼손/사생활 침해 및 저작권 침해 등" > 명예훼손/사생활 침해 및 저작권 침해 등
						</li>
						<li>
							<p><label for=""></label><input id="" name="report" class="" type="radio" value="기타" > 기타</p>
							<p><textarea id="tarea" class="inp_info tf_info" cols="24"name="area"></textarea></p>
						</li>
					</ul>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a id="a1" class="mbtn rd">신고하기</a></span>
			<span><a id="a2" class="mbtn gy">취소</a></span>
		
		</div><!--// btnbox E-->
		
	</div>

</div><!--// Wrap E-->
<script>
	$("#a1").click(function(){
		var report = $('input[name="report"]:checked').val();
		var area = $('#tarea').val();
		if(report!=null){
			location.href="<%=request.getContextPath()%>/ReportServlet?gno=<%= gno %>&title=<%= title %>&name=<%= name %>&report="+report+"&area="+area+"&uno=<%=uno%>";
		}else{
			alert("해당 사유를 선택해주세요!");
		}	
	});
	
	$("#a2").click(function(){
		window.close();
	});
</script>

</body>
</html>