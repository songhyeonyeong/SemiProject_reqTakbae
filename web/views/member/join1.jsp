<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>

		<div class="agreebox mt40">

			<div class="box"><!-- leftbox S-->
				<h1>이용약관(필수)</h1>
				<div class="agreecont mt10">
				제 1 장 총칙<br><br>

				제 1 조 (목적)<br><br>

				본 약관은 한국교육개발원(이하 KEDI)이 운영하는 영재교육종합데이터베이스 사이트(이하 당 사이트)가 제공하는 모든 서비스(이하 서비스)의 이용조건 및 절차, 회원과 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>

				제 2 조 (용어의 정의)<br><br>

				본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>

				</div>
				<div class="checkbox mt10">
					<span>
						<label for="check1">체크</label>
						<input id="checkYn1" title="check1" type="checkbox" value="Y"> 회원 이용약관에 동의 합니다.
					</span>
				</div>
			</div><!--// leftbox E-->

			<div class="box mt50"><!-- rightbox S-->
				<h1>개인정보수집 및 이용안내(필수)</h1>

				<div class="agreecont mt10">

				[ 개인정보 수집 및 이용에 대한 안내 ]<br><br>

				한국교육개발원 영재교육연구센터에서 취급하는 모든 개인정보는 개인정보보호법 및 관련 법령상의 개인정보보호 규정을 준수하여 정보주체의 동의 또는 관련 법령에 의한 소정의 행정업무를 수행하기 위해 다음과 같이 수집&middot;보유&middot;처리되고 있습니다.<br><br>

				제1조 개인정보의 수집&middot;이용목적<br><br>

				</div>
				<div class="checkbox mt10">
					<span>
						<label for="">체크</label>
						<input id="" title="" type="checkbox" value="Y"> 회원 이용약관에 동의 합니다.
					</span>
				</div>
			</div><!--// rightbox E-->

			<div class="clear tcen pt50">
				<span><a class="mbtn db"  id="" href="join2.jsp">동의합니다.</a></span>
				<span><a class="mbtn rd m15" href="#">동의하지 않습니다</a></span>
			</div>

		</div>


	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>