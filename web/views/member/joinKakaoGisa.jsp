<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<%
	String kakaoId = (String)request.getAttribute("kakaoId");
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
		
		<form id="joinForm" method="post">
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
					<input id="userDiv" name="userDiv" value="기사" type="hidden">
					<input id="SId" name="userId" type="text">
					<input id="kakaoId" name="kakaoId" type="hidden" value="<%=kakaoId%>">
					<input type="hidden" id="userPassword" name="userPassword" value="1">
					<span>
						<a id="idCheckBtn" class="sbtn db" >중복확인</a>
						<span id="idCheckMsg"></span>
					</span>
				</td>
				<td><img id="idCheckImg" class="checkTest" src=""></td>
			</tr>
			
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
			
			<tr>
				<th scope="row">주 교통수단</th>
				<td>
					<span>
						<select name="mainWay" id="mainWay">
							<option value="차">차</option>
							<option value="오토바이">오토바이</option>
							<option value="대중교통">대중교통</option>
							<option value="자전거">자전거</option>
							<option value="기타">기타</option>
						</select>
					</span>
				</td>
				<td><img id="mainWayCheckImg" class="checkTest" src=""></td>
			</tr>
			
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
		</form>
		
		


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
						<!-- <tr>
							<th>
							</th>
							<td><span><input type="hidden" id="client_id" name="client_id" style="width: 200px"
										 value="l7xx4d589e5dd8fb46d6afcf7e22fd7039ed"></span></td>
						</tr> -->
					
				</tr>
				
				<tr>
					<th>
						<span><input type="hidden" id="client_id" name="client_id" style="width: 200px"
										 value="l7xx4d589e5dd8fb46d6afcf7e22fd7039ed"></span>
					</th>
					<td><span><input type="hidden" id="client_secret" name="client_secret" style="width: 200px"
								 value="2b229cffd50b45c08f0cde6158ab69c1"></span></td>
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

	
	
	
	

	
	
	
	
	<form id="imgForm"  action="<%=request.getContextPath()%>/GisaJoinImg" method="post" encType="multipart/form-data">
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
						<img id="showImg1" name="showImg1" width="450" height="200"> 
						<input id="GisaId" name="id" type="text" hidden>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">본인 얼굴사진</th>
				<td>
					<div id="showImgArea2">
						<img id="showImg2" name="showImg2" width="450" height="200"> 
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
			<!-- <button type="submit" class="mbtn db">회원가입</button> -->
			<a class="mbtn db" onclick="joinjoin()">회원가입</a>
			
			</div>
		</form>
		</div>
		</div>
	</div>
		
<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>
	var checkImgPath="/reqtakbae/views/common/images/contents/check.PNG";
	
	$(function(){
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
	
	
	
	
		
		/* function insertMember(){
				
				$("#joinForm").submit();
			
		} */
	

	</script>


	<script type="text/javascript">
	 
	
	 $.support.cors = true;
		var reqDate = new Date();
		
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
				contenttype:"application/x-www-form-urlencoded; charset=UTF-8",/*내가 넣음  */
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
								alert('계좌 인증 실패');
								$("#accountCheckImg").attr("src", "");
							}
						}
				
					});
		}
	
	
		
		function joinjoin(){
			
			var userDiv = $("#userDiv").val();
			var userId = $("#SId").val();
			var userPwd = $("#userPassword").val();
			var userName = $("#SName").val();
			var phone = $("#Sphone").val();
			var kakaoId = $("#kakaoId").val();
			var mainWay = $("#mainWay").val();
			
			//var bankName = $("#bankName").val();
			var bankcode = $("#bankcode").val();
			
			var accnum = $("#accnum").val();
			
			//사진삽입용 uno
			$("#GisaId").val(userId);
			
			console.log("userDiv : "+userDiv);
			console.log("userId : "+userId);
			console.log("userPwd : "+userPwd);
			console.log("userName : "+userName);
			console.log("phone : "+phone);
			console.log("mainWay : "+mainWay);
			console.log("bankcode : "+bankcode);
			console.log("accnum : "+accnum);
			console.log("kakaoId : "+kakaoId);
			
			
			$.ajax({
				url : "/reqtakbae/insertKakoMember.me",
				type : "POST",
				data:{userDiv:userDiv, userId:userId, userPwd:userPwd, userName:userName, phone:phone, mainWay:mainWay, bankcode:bankcode, accnum:accnum, kakaoId:kakaoId},
				success : function(data) {
					if(data=="회원정보인서트성공"){
						$("#imgForm").submit();
					}else{
						alert("회원가입 실패")
					}
					
				}
				
			})
		}
		
		
		
	
	</script>

</body>
</html>
















