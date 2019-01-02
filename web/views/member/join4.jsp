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

<%-- <%@ include file="/views/include/header.jsp" %> --%>

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
						<td><input id="id" name="id" type="text" value="<%=userId %>"></td>
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
			<span><a class="mbtn db" onclick="insertMember();">회원가입</a></span>
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
	
	
	function insertMember(){
			$("#imgForm").submit();
		
	}
	
	
	
	/* //아이디 정규표현식 && 중복체크
	$("#idCheckBtn").click(function(){
		var SId = $("#SId").val();
		var regExp = /\w{3,}/;
		
		if(regExp.test(SId)){
			$.ajax({
				url:"/reqtakbae/idCheck.me",
				type:"post",
				data:{SId:SId},
				success:function(data){
					if(data=="YES"){
						if(SId != "") {
							$("#idCheckMsg").html("");
							//$("#idCheckMsg").css("color","black");
							$("#idCheckImg").attr("src",checkImgPath);
						}
					}else{
						$("#idCheckMsg").html("이미 사용중인 아이디입니다");
						$("#idCheckMsg").css("color","red");
						$("#idCheckImg").attr("src","");
					}
				}
				
			})
		}else{
			alert("아이디 : 영어/숫자 조합 3자리 이상");
			$("#idCheckMsg").html("");
			$("#idCheckImg").attr("src","");
		}
	});
	
	
	//비밀번호 유효성체크
	$("#SPwd").change(function(){
		var pwd1 = $("#SPwd").val();
		
		var regExp=/\w{3,}/;
		
		if(!regExp.test(pwd1)){
			alert("비밀번호 : 영어/숫자 조합 3자리 이상");
			$("#SPwd").val("");
			$("#SPwd2").val("");
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}
	});
	
	//비밀번호 체크
	$("#SPwd2").change(function(){
		var pwd1 = $("#SPwd").val();
		var pwd2 = $("#SPwd2").val();
		
		if(pwd1 != pwd2){
			$("#pwdCheckMsg").html("비밀번호가 일치하지 않습니다");
			$("#pwdCheckMsg").css("color","red");
			
			$("#SPwd").val("");
			$("#SPwd2").val("");
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else if(pwd2==null || pwd1==null){
			$("#pwdCheckMsg").html('');
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else{
			$("#pwdCheckMsg").html('');
			$("#pwdCheckImg").attr("src",checkImgPath);
			$("#pwdCheckImg2").attr("src",checkImgPath);
		}
		
	});
	
	
	//이름 체크
	$("#SName").change(function(){
		var name = $("#SName").val();
		var regExp =/[ㄱ-ㅎㅏ-ㅣ가-힣]{1,}/;
		
		if(regExp.test(name)){
			$("#nameCheckImg").attr("src",checkImgPath);
		}else{
			alert("이름 : 한글 ");
			$("#nameCheckImg").attr("src","");
		}
	});
	
	
	//핸드폰 체크
	$("#Sphone").change(function(){
		var phone = $("#Sphone").val();
		var regExp=/[^-]{11,12}$/;
		
		if(regExp.test(phone)){
			$("#phoneCheckImg").attr("src",checkImgPath);
		}else{
			alert("휴대폰번호 : -없이 11-12자리");
			$("#phoneCheckImg").attr("src","");
		}
		
	});
	
	
	//이메일 select 선택시 값 변경
	 $("#email").change(function(){
		if($("#email option:selected").val() == "naver"){
			//$("#Semail2").attr("value",$(this).find("option[value='" + $(this).val() + "']").text());
			$("#Semail2").attr("value","naver.com");
		}else if($("#email option:selected").val() == "daum"){
			$("#Semail2").attr("value","daum.net");
		}else if($("#email option:selected").val() == "google"){
			$("#Semail2").attr("value","google.com");
		}else if($("#email option:selected").val() == "self"){
			$("#Semail2").attr("value","");
		}
	}); 
	
	
	var randomCode = $("#randomCode").val();
	//이메일 인증번호 발송
	$("#sendEmail").click(function(){		
		$("#sendEmailClick").show();
		
		var email1 = $("#Semail1").val();
		var email2 = $("#Semail2").val();
		var fullEmail = email1 + "@" +email2;
	
		$.ajax({
			url:"/reqtakbae/sendEmail",
			type:"post",
			data:{fullEmail:fullEmail,randomCode:randomCode},
			success:function(data){
				if(data == "YES"){
					alert("인증코드 발송");
				}else{
					alert("인증코드 발송 실패");
				}
			}
			
		});
	});
	
	//이메일 인증코드 확인
	function auth(){
		if($("#authCode").val() == randomCode){
			alert("이메일 인증 성공");
			$("#emailCheckImg").attr("src",checkImgPath);
		}else{
			alert("이메일 인증 실패");
			$("#emailCheckImg").attr("src","");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	 
	 
	 
	//원본 
	//계좌 인증
	var token;
	 
	function testtest(){
		var cId="l7xx4d589e5dd8fb46d6afcf7e22fd7039ed";
		var cSecret="2b229cffd50b45c08f0cde6158ab69c1";
		
		$.ajax({
			url:"https://testapi.open-platform.or.kr/oauth/2.0/token",
			type:"POST",
			contenttype:"application/x-www-form-urlencoded; charset=UTF-8",
			data:{client_id:cId, client_secret:cSecret, scope:"oob", grant_type:"client_credentials"},
			success:function(data){
				console.log(data);
				
				token=data.access_token;
				console.log(token);
				
				bankbank();
			}
		});
	}
	
	function bankbank(){
			var accountNum = $("#accountNum").val();
			var depositor = $("#SName").val();
			var birth = $("#birth").val();
			var today = $("#today").val();
			var bankName = $("#bankName option:selected").val();
			
			var bankNum="0";
			if(bankName=="nongHyup"){
				bankNum="011";
			}else if(bankName=="shinHan"){
				bankNum="088";
			}else if(bankName=="ibk"){
				bankNum="003";
			}else if(bankName=="kb"){
				bankNum="004";
			}else if(bankName=="woori"){
				bankNum="020";
			}
			
			console.log("bankName: "+bankName);
			console.log("bankNum: "+bankNum);
			console.log("accountNum: "+accountNum);
			console.log("depositor: "+depositor);
			console.log("birth: "+birth);
			console.log("today: "+today); 
			console.log("token: "+token); 
			
			var data={
					"bank_code_std": bankNum,"account_num": accountNum, "account_holder_info": birth, "tran_dtime": today		
			}
			
			
			
		
			$.ajax({
				url:"https://testapi.open-platform.or.kr/inquiry/real_name",
				type:"POST",
				ContentType:"application/json; charset=UTF-8",
				//redirect_uri:"http://localhost:8880/html/callback.html",
			    headers: {'Authorization': ('Bearer ' + token)},
				data:JSON.stringify(data),
				success:function(data){
					console.log(data);
					if(bankNum==data.bank_code_std && accountNum==data.account_num && depositor==data.account_holder_name && birth == data.account_holder_info){
						alert("계좌 인증 성공");
						$("#accountCheckImg").attr("src", checkImgPath);
					}else{
						alert("계좌 인증 실패");
						$("#accountCheckImg").attr("src","");
					}
				},
				error:function(data){
					alert("오류");
				}
				
			});
	} 
	 */
	
	
	

	</script>


</body>
</html>
















