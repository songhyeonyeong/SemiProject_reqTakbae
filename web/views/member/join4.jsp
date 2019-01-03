<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>
<%
	String userId = (String)request.getParameter("userId");
%>

<title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>
		
		<form id="imgForm" action="<%=request.getContextPath()%>/GisaJoinImg" method="post" encType="multipart/form-data">
		<table class="boardWrite wth700 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원가입 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			
			<tr>
				<th scope="row">신분증</th>
				<td>
					<div id="showImgArea1">
						<img id="showImg1" name="showImg1" width="350" height="200"> 
						<td><input id="id" name="id" type="text" value="<%=userId %>" hidden></td>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">본인 얼굴사진</th>
				<td>
					<div id="showImgArea2">
						<img id="showImg2" name="showImg2" width="350" height="200"> 
					</div>
				</td>
			</tr>
			 
			</tbody>
			</table>
			
		
			<div id="fileArea">
				<input type="file" id="IdCardImg" name="IdCardImg" onchange="loadImg(this, 1)">
				<input type="file" id="faceImg" name="faceImg" onchange="loadImg(this, 2)">
			</div>
			
			<div class="btnbox mt20"><!-- btnbox S-->
			<button type="submit" class="mbtn db">회원가입</button>
		</div>
		</form>
		</div>
		</div>
		

		
<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>	
	$(function(){
/* 		$("#sendEmailClick").hide(); */
		$("#fileArea").hide();
	});
	
	$("#showImgArea1").click(function(){
		$("#IdCardImg").click();
	});
	
	$("#showImgArea2").click(function(){
		$("#faceImg").click();
	});
	

	
	function loadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#showImg1").attr("src",e.target.result); break;
				case 2 : $("#showImg2").attr("src",e.target.result); break;
				}
			}
		reader.readAsDataURL(value.files[0]);
		}
	}
	

	
	
	

	</script>


</body>
</html>
















