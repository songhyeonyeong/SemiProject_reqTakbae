<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="8";
%>

<%
	/* ArrayList<String> imgList = (ArrayList<String>)request.getAttribute("imgList");

	String fir=imgList.get(0);
	String sec=imgList.get(1); */
	
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


		<form id="imgForm" action="<%=request.getContextPath()%>/GisaJoinImg" method="post" encType="multipart/form-data">
		<table class="boardWrite wth700 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원사진 수정 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			
			<tr>
				<th scope="row">신분증</th>
				<td>
					<div id="showImgArea1">
						<img id="showImg1" name="showImg1" width="350" height="200" > 
						<input id="id" name="id" type="text"  hidden>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">본인 얼굴사진</th>
				<td>
					<div id="showImgArea2">
						<img id="showImg2" name="showImg2" width="350" height="200" > 
					</div>
				</td>
			</tr>
			 
			</tbody>
			</table>
		</form>
		
		<div id="fileArea">
			<input type="file" id="IdCardImg" name="IdCardImg" onchange="loadImg(this, 1)">
			<input type="file" id="faceImg" name="faceImg" onchange="loadImg(this, 2)">
		</div>
			
		<div class="btnbox mt20"><!-- btnbox S-->
		<button type="submit" class="mbtn db">사진 수정</button>
		</div>
		

		<!-- <div class="btnbox mt20">btnbox S
			<span><a class="mbtn gy" href="#">취소</a></span>
			<span><a class="mbtn rd" onclick="leave();">탈퇴하기</a></span>
		</div>// btnbox E -->

	</div><!--// inner E-->
</div>
<script>	
	var addr;
	$(function(){
		$("#fileArea").hide();
		
		
		var uno = <%=loginUser.getU_no()%>;
		$.ajax({
			url:"/reqtakbae/GisaImg",
			type:"post",
			data:{uno:uno},
			success:function(data){
				addr = data.split("&");
				console.log(addr[0]);
				console.log(addr[1]);
				
				$("#showImg1").attr("src","<%=request.getContextPath()%>/upload/"+addr[1]);
				$("#showImg2").attr("src","<%=request.getContextPath()%>/upload/"+addr[0]);
			}
		});
		
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



<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>