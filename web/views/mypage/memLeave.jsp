<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="9";
%>
<%@ include file="/views/include/common.jsp" %>

<title>탈퇴하기</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<table class="boardWrite wth500 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원가입 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">탈퇴사유</th>
				<td>
					<input type="hidden" id="uno" name="uno" value="<%=loginUser.getU_no()%>">
					<select id="leaveSelect" name="leaveSelect" class="input wth200">
						<option selected="selected">선택하세요</option>
						<option value="#">타 사이트의 유사서비스 이용</option>
						<option value="#">속도가 느림</option>
						<option value="#">찾고자 하는 정보가 없음</option>
						<option value="#">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">상세내용</th>
				<td>
					<textarea class="wth90p" cols="24" id="leaveText" name="leaveText"></textarea>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">취소</a></span>
			<span><a class="mbtn rd" onclick="leave();">탈퇴하기</a></span>
		</div><!--// btnbox E-->

	</div><!--// inner E-->
</div>

<script>
	var uno = $("#uno").val();

	function leave(){
		if($("#leaveSelect option:selected").text()==("선택하세요") && $("#leaveText").val()==""){
			alert("사유를 선택하거나 작성해주세요")
		}else{
			location.href="/reqtakbae/leaveMember?uno="+uno;			
		}
		
		
	}
</script>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>