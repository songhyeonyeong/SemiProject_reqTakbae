<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<% 
	String bigtabon="7";
%>

<%@ include file="/views/include/common.jsp" %>

<title>회원정보수정</title>

</head>
<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		
		<!-- <div class="rtv of mt30">

			<div class="flo_left wth300">flo_left S
				<img src="http://via.placeholder.com/300x300" alt="상품이미지">
				<div class="input-file mt10"> 
					<input type="text" readonly="readonly" class="file-name wth295" /> 
					<label for="upload01" class="file-label">상품 이미지 업로드</label> 
					<input type="file" name="" id="upload01" class="file-upload" /> 
				</div>
			</div>// flo_left E

			<div class="flo_right wth850">flo_right S -->
			
		<form id="updateForm" action="<%=request.getContextPath()%>/modifyMember.me" method="post">
			<table class="boardWrite wth700 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원정보수정 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td colspan="3">
					<input type="hidden" id="uno" name="uno" value="<%=loginUser.getU_no()%>">
					<input class="wth200" type="text" value="<%=loginUser.getUser_id() %>" readonly>
				</td>
			</tr>
			<tr>
				<th scope="row">새 비밀번호</th>
				<td>
					<input id="pwd1" name="userPwd" class="wth200" type="password"> 
				</td>
			</tr>
			<tr>
				<th scope="row">새 비밀번호 확인</th>
				<td>
					<input id="pwd2" class="wth200" type="password"> 
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<input class="wth200" id="name" type="text" value="<%=loginUser.getUser_name() %>" readonly> 
				</td>
			</tr>
			
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>
					<span>
						<input id="phone" name="phone" class="wth200" type="text" placeholder="-없이 입력" value="<%=loginUser.getPhone()%>">
					</span>
				 </td>
			</tr>
			
			<tr>
				<th scope="row">이메일</th>
				<td>
					<span><input id="email" name="email" class="wth200 emailArea" type="text" value="<%=loginUser.getEmail() %>" readonly></span>
					
					<span class="changeArea" style="display: none;">
						<input id="email1" class="wth100" type="text">@<input id="email2" class="wth100" type="text">
						<select id="emailSelect">
							<option value="self" selected>직접입력</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="google">google.com</option>
					</select></span>
					
					
					
					<%!
						public int getRandom(){
							int randomCode=0;
							randomCode = (int)Math.floor((Math.random()*99999-9999))+10000;
							return randomCode;
						}
					%>
					<input type="hidden" value="<%=getRandom()%>" id="randomCode" name="randomCode">
					
					<a id="changeEmailBtn" class="sbtn db emailArea" onclick="emailChange()">변경하기</a>
					<a class="sbtn db changeArea" onclick="sendCode()" style="display: none">인증번호 발송</a><br>
					
					<span id="sendEmailClick" style="display: none">
						<br><br>
						<input id="authCode" type="text" placeholder="인증번호를 입력하세요">
						<a class="sbtn db" onclick="auth();">인증하기</a>
					</span>
					
					<a class="sbtn gy wth60 changeArea" onclick="emailChangeCancle()" style="display: none">취소하기</a>
					<input type="hidden" id="emailAuthArea" value="이메일 인증 실패">
				</td>
				
				<script>
					
					//이메일 변경하기 버튼
					function emailChange(){
						$(".changeArea").show();
						$(".emailArea").hide();
					}
					
					//이메일 취소하기 버튼
					function emailChangeCancle(){
						$(".changeArea").hide();
						$(".emailArea").show();
						$("#sendEmailClick").hide();
					}
					
					
					//인증번호 발송 버튼
					var randomCode = $("#randomCode").val();
					function sendCode(){
						$("#sendEmailClick").show();
						
						//이메일 인증번호 발송
						var email1 = $("#email1").val();
						var email2 = $("#email2").val();
						var fullEmail = email1 + "@" +email2;
					
						if(email1 == "" || email2 == ""){
							alert("이메일을 입력하세요");
						}else{
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
						}
						
					}
					
					//이메일 인증코드 확인
					function auth(){
						if($("#authCode").val() == randomCode){
							alert("이메일 인증 성공");
							
							var email1 = $("#email1").val();
							var email2 = $("#email2").val();
							var fullEmail = email1+"@"+email2;
							
							$("#email").val(fullEmail);
							$("#emailAuthArea").val("이메일 인증 성공");
							
						}else{
							alert("이메일 인증 실패");
						}
						
					}
					
					//이메일 주소 셀렉트
					$("#emailSelect").change(function(){
						var emailAfter = $("#emailSelect option:selected").text();
						if(emailAfter=="직접입력"){
							$("#email2").val("");
						}else{
							$("#email2").val(emailAfter);
						}
					}); 
				</script>
				
			</tr>
			<tr>
				<th scope="row" rowspan="3">계좌번호</th>
				<td>
					<span class="memberBank"><!-- 변경 전  -->
						은행명&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="memberBankName" name="bankName" class="wth80"  value="<%=loginUser.getBank_name()%>" readonly><br>
						계좌번호&nbsp;<input type="text" class="wth150" id="memberAccountNum" name="accnum" value="<%=loginUser.getBank_num()%>" readonly>
						<a class="sbtn db" onclick="changeBank()">변경하기</a>
					</span>
					
					<span class="bankArea" style="display: none"><!-- 변경 후  -->
						은행명  <select id="bankcode" name="bankcode" >
								<option value="004">국민은행</option>
								<option value="003">기업은행</option>
								<option value="088">신한은행</option>
								<option value="011">농협</option>
								<option value="020">우리은행</option>
							</select>
							<br>
						계좌번호<input type="text" size="25" placeholder="'-'를 제외하고 입력" id="accnum"><br>
						생년월일<input type="text" size="25" placeholder="'-'를 제외하고 6자리" id="birth" >&nbsp;
						<a class="sbtn db" id="confirmacc" onclick="fnSearchAccessToken()">계좌인증</a>
						<a class="sbtn gy wth60" onclick="bankChangeCancle()">취소하기</a>
						<input type="hidden" id="AccountlAuthArea" value="계좌 인증 실패">
					</span>
				</td>
				<td><input type="hidden" name="changeDiv" id="changeDiv"></td>
			</tr>
			
			<script>
				/* $(function(){
					$(".bankArea").hide();
				}); */
				
				//계좌 변경하기 버튼
				function changeBank(){
					$(".bankArea").show();
					$(".memberBank").hide();
				}
				
				//계좌 취소하기 버튼
				function bankChangeCancle(){
					$(".bankArea").hide();
					$(".memberBank").show();
				}
				
				
				
			</script>
			
			
			</tbody>
		</table><!--// boardWrite E-->

		<!-- </div>// flo_right E
		</div> -->

		</form>
		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">취소</a></span>
			<span><a class="mbtn db" onclick="infoChange()">수정하기</a></span>
		</div><!--// btnbox E-->
	</div><!--// inner E-->
	
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
			var depositor = $("#name").val();
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
								var accNum = $("#accnum").val();
								var bankName = $("#bankcode option:selected").text()
								
								$("memberBankName").val(bankName);
								$("#memberAccountNum").val(accNum);
								
								$("#AccountlAuthArea").val("계좌 인증 성공");
								
							} else {
								alert("계좌 인증 실패");
					
							}
						}
				
					});
		}
		
		
		
		
	
		
		
	
	
	
		function infoChange(){
			if($("#pwd1").val() == ""){
				alert("새 비밀번호를 입력하세요");
			}else if($("#pwd1").val() != $("#pwd2").val()){
				alert("새 비밀번호를 확인을 올바르게 입력하세요");
			}else if($("#phone").val() == ""){
				alert("핸드폰 번호를 입력하세요");
			}else if($(".changeArea").css("display") != "none" && $("#emailAuthArea").val() != "이메일 인증 성공"){
				alert("이메일을 인증하세요");
			}else if($(".bankArea").css("display") != "none" && $("#AccountlAuthArea").val() != "계좌 인증 성공"){
				alert("계좌를 인증하세요");
			}else{
				$("#updateForm").submit();
			}
			
			
			
			
		}
		
		
		
	</script>
	
	
	
<!-- </div> -->

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>