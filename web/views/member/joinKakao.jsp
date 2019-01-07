<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

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
		
		<form id="joinForm" action="<%=request.getContextPath()%>/insertKakoMember.me" method="post">
		<table class="boardWrite wth700 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원가입 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>
					<input name="userDiv" value="신청자" type="hidden">
					<input id="SId" name="userId" type="text">
					<span>
						<a id="idCheckBtn" class="sbtn db" >중복확인</a>
						<span id="idCheckMsg"></span>
						<input type="hidden" id="userPwd" name="userPwd" value="1">
						<input type="hidden" id="email" name="email" value=kakaoId>
					</span>
				</td>
				<td><img id="idCheckImg" class="checkTest" src=""></td>
			</tr>
			<!-- <tr>
				<th scope="row">비밀번호</th>
				<td>
					<input id="SPwd" name="userPwd" type="password"> 
					<span id="pwdCheckMsg"></span>
				</td>
				<td><img id="pwdCheckImg" class="checkTest" src=""></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td>
					<input id="SPwd2" type="password"> 
				</td>
				<td><img id="pwdCheckImg2" class="checkTest" src=""></td>
			</tr> -->
			<tr>
				<th scope="row">이름</th>
				<td>
					<label for=""></label>
					<input id="SName" name="userName" type="text"> 
				</td>
				<td><img id="nameCheckImg" class="checkTest" src=""></td>
			</tr>
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>
					<span>
						<input id="Sphone" name="phone" type="text" placeholder="-없이 입력">
					</span>
				 </td>
				<td><img id="phoneCheckImg" class="checkTest" src=""></td>
			</tr>
		<%-- 	<tr>
				<th scope="row">이메일</th>
				<td>
					<input id="Semail1" name="email1" class="wth100" type="text">
					<span>@</span>
					<input id="Semail2" name="email2" class="wth100" type="text">
					<select id="email">
							<option value="self" selected>직접입력</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="google">google.com</option>
					</select>
					<span>
						<a class="sbtn db" id="sendEmail">인증번호 발송</a>
					</span>
					
					<%!
						public int getRandom(){
							int randomCode=0;
							randomCode = (int)Math.floor((Math.random()*99999-10000+1))+10000;
							return randomCode;
						}
					%>
					
					<input type="hidden" value="<%=getRandom()%>" id="randomCode">
					
					<span id="sendEmailClick">
						<br><br>
						<input id="authCode" type="text" placeholder="인증번호를 입력하세요">
						<a class="sbtn db" onclick="auth();">인증하기</a>
					</span>
				</td>
				<td><img id="emailCheckImg" class="checkTest" src=""></td>
			</tr> --%>
			
			<tr>
				<th scope="row" rowspan="3">계좌번호</th>
				<td>
					은행명  <select name="bankcode" id="bankcode">
							<option value="004">국민은행</option>
							<option value="003">기업은행</option>
							<option value="088">신한은행</option>
							<option value="011">농협</option>
							<option value="020">우리은행</option>
						</select>
						<br>
					계좌번호<input type="text" size="25" placeholder="'-'를 제외하고 입력" name="accnum" id="accnum"><br>
					생년월일<input type="text" size="25" placeholder="'-'를 제외하고 6자리" name="birth" id="birth">&nbsp;
					<span class="sbtn db" id="confirmacc" onclick="fnSearchAccessToken()">계좌인증</span>
					
				</td>
				<td><img id="accountCheckImg" class="checkTest" src=""></td>
			</tr>
			</tbody>
			</table>
			
		
			<div id="fileArea">
				<input type="file" id="IdCardImg" name="IdCardImg" onchange="loadImg(this, 1)">
				<input type="file" id="faceImg" name="faceImg" onchange="loadImg(this, 2)">
			</div>
			
			<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">새로입력</a></span>
			<span><a class="mbtn db" onclick="insertMember();">회원가입</a></span>
		</div>
		</form>
		</div>
		</div>
		


		<div>
		<table>
			<colgroup>
				<col style="width: 180px" />
				<col style="width: *" />
			</colgroup>
			<tbody>
				<tr><!-- 내가 넣음 tr -->
					<form name="authCodeFrm" id="authCodeFrm" method="GET" action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">
						<input type="hidden" id="response_type" name="response_type" value="code" /> 
						<input type="hidden" id="scope" name="scope" value="inquiry" /> 
						<input type="hidden" id="redirect_uri" name="redirect_uri" value="http://localhost:8880/html/callback.html" />
					
				</tr>
				<tr>
					<th>
						<%
							Calendar cal = Calendar.getInstance();
							java.util.Date date = cal.getTime();
							String today = (new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date));
						%>
						<input id="today" type="hidden" value="<%= today %>" ><br>
					</th>
					<td><span><input type="hidden" id="access_token" name="access_token"></span> 
				</tr>
				<tr>
					<th>
						<!-- <span>은행코드</span> -->
					</th>
					<td><span><input type="hidden" class="txt" id="bank_code_std" name="bank_code_std"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>계좌번호</span> -->
					</th>
					<td><span><input type="hidden" class="txt" id="account_num" name="account_num"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>예금주 생년월일</span> -->
					</th>
					<td><span> <input type="hidden" class="txt" id="account_holder_info" name="account_holder_info"
														 /></span>
				
				</tr>
				<tr>
					<th>
						<!-- <span>요청일시</span> -->
					</th>
					<td><span style="width: 200px"><input type="hidden"
														class="txt" id="tran_dtime" title="요청일시 입력"
														name="tran_dtime" /></span>
						<!-- <button type="button" onclick="fnSearchRealName()">계좌실명조회</button> --></td>
				</tr>
				<!-- <tr> 		
					<th><span>계좌실명조회결과</span></th>
					<td> 				
						<textarea style="height:220px;width:250px" id="real_name" name="real_name"></textarea>
					</td>
				</tr> -->
				</form>
			</tbody>
			
		</table>

	</div>
	
<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>
	var checkImgPath="/reqtakbae/views/common/images/contents/check.PNG";
	
	$(function(){
		$("#sendEmailClick").hide();
		$("#fileArea").hide();
	});
	
	
	
	
	//아이디 정규표현식 && 중복체크
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
	
	
	/* //비밀번호 유효성체크
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
		
	}); */
	
	
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
	
	
	/* //이메일 select 선택시 값 변경
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
	
	
	
	
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	 
	 
	 
	 
	/* //원본 
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
	 
	
	//이미지 미리보기
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
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
/* 	
	//회원가입 버튼 클릭시 && 널값
	function insertMember(){
		if($("#SId").val() == ""){
			alert("아이디를 입력하세요");
		}else if($("#idCheckImg").attr("src") == ""){
			alert("아이디 중복을 확인하세요");
		}else if($("#SPwd").val() == ""){
			alert("비밀번호를 입력하세요");
		}else if($("#SPwd2").val() == ""){
			alert("비밀번호확인을 입력하세요");
		}else if($("#SPwd").val() != $("#SPwd2").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#SPwd").val("");
			$("#SPwd2").val("");
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else if($("#SName").val() == ""){
			alert("이름 입력하세요");
		}else if($("#Sphone").val() == ""){
			alert("휴대폰 번호를 입력하세요");
		}else if($("#Semail1").val() == ""){
			alert("이메일을 입력하세요");
		}else if($("#Semail2").val() == ""){
			alert("이메일을 입력하세요");
		}else if($("#emailCheckImg").attr("src") == ""){
			alert("이메일을 인증하세요");
		}else if($("#accountNum").val() == ""){
			alert("계좌번호를 입력하세요");
		}else if($("#birth").val() == ""){
			alert("생년월일을 입력하세요");
		}else if($("#accountCheckImg").attr("src") == ""){
			alert("계좌번호를 입력 입력하세요");
		}else{
			$("#joinForm").submit();
		} */
		
		/* var SId = $("#SId").val();
		$("#userNo").val(SId);
		
		 function insertMember(){
			$("#joinForm").submit();
			//$("#insertGisaImg").submit();
		} */
		 
		
		/* var userDiv = $("#userDiv").val();
		var SId = $("#SId").val();
		var SPwd = $("#SPwd").val();
		var SName = $("#SName").val();
		var Sphone = $("#Sphone").val();
		var mainWay = $("#mainWay").val();
		
		var Semail1 = $("#Semail1").val();
		var Semail2 = $("#Semail2").val();
		var email = Semail1+Semail2;
		
		var bankName = $("#bankName").val();
		var accountNum = $("#accountNum").val();
		
		var data={
				"userDiv": userDiv,"SId": SId, "SPwd": SPwd, "SName": SName,"Sphone": Sphone,"mainWay": mainWay, "email": email, "bankName": bankName,"accountNum":accountNum	
		} */
		

		


		
		function insertMember(){
			/* var form = $("#insertGisaImg")[0];
			var formData = new FormData(form);
			console.log("form : " + form);
			console.log("formData : " + formData);

			$.ajax({
					url : "/reqtakbae/GisaJoinImg",
					type : "POST",
					processData: false,
                    contentType: false,
               		data: formData,
					success : function(data) {
						alert("업로드 성공!!");

					},
					error : function(data) {
					}
				});  */
				
				$("#joinForm").submit();
			
		}
	

	</script>


	<script type="text/javascript">
	 
	
	 $.support.cors = true;
		/* 사용자인증 Access Token 획득 */
		function fnSearchAccessToken() {
			$("#bank_code_std").val($("#bankcode").val());
			$("#account_num").val($("#accnum").val());
			$("#tran_dtime").val($("#today").val());
			
			var client_id = "l7xx4d589e5dd8fb46d6afcf7e22fd7039ed";
			var client_secret = "2b229cffd50b45c08f0cde6158ab69c1";
			var grant_type = "client_credentials";
			var scope = "oob";
			$.ajax({
				//url: "/tpt/test/getOauthToken",
				url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
				type : "POST",
				contenttype:"application/x-www-form-urlencoded; charset=UTF-8",
				//cache: false,
				contenType : "application/json",
				data : {
					"client_id" : client_id,
					"client_secret" : client_secret,
					"grant_type" : grant_type,
					"scope" : scope
				},
				dataType : "json",
				success : function(data, data2, data3) {
					var list = JSON.parse(data3.responseText);
					$("#access_token").val(list.access_token);
					//$("#user_seq_no").val(list.user_seq_no);
					fnSearchRealName();
				},
				error : function(data, data2, data3) {
					alert('error!!!');
				}
			});
		}
		/* 계좌실명조회API */
		function fnSearchRealName() {
			var depositor = $("#SName").val();
			var bank_code_std = $("#bank_code_std").val();
			var account_num = $("#account_num").val();
			var account_holder_info = $("#birth").val();
			var tran_dtime = $("#tran_dtime").val();
			
			var access_token = "Bearer " + $("#access_token").val();
			
			console.log("depositor : " + depositor);
			console.log("bank_code_std : " + bank_code_std);
			console.log("account_num : " + account_num);
			console.log("account_holder_info : " + account_holder_info);
			console.log("tran_dtime : " + tran_dtime);
			console.log("access_token" + access_token);
			
			
			var resData = {
				"bank_code_std" : bank_code_std,
				"account_num" : account_num,
				"account_holder_info" : account_holder_info,
				"tran_dtime" : tran_dtime
			};
			$.ajax({
						url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
						beforeSend : function(request) {
							request.setRequestHeader("Authorization",
									access_token);
						},
						type : "POST",
						data : JSON.stringify(resData),
						dataType : "json",
						success : function(data, data2, data3) {
							console.log(data)
							if (data.account_holder_name == depositor && data.account_holder_info == account_holder_info &&
							data.account_num == account_num && data.bank_code_std == bank_code_std) {
								alert("계좌 인증 성공");
								$("#accountCheckImg").attr("src", checkImgPath);
							} else {
								alert("계좌 인증 실패");
								$("#accountCheckImg").attr("src", "");
							}
						}
				
					});
		}
	
	
	
	</script>

</body>
</html>
















