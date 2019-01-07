<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="4";
%>
<%@ include file="/views/include/common.jsp" %>

<title>충전하기</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">마이페이지</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<%@ include file="/views/include/tabMypage.jsp" %>

		<p class="font30 bold tcen">충전하기</p>
		
		<div class="chargeBox">
			<dl>
				<dt class="font20 bold">사이버머니 5,000원</dt>
				<dd class="font18">5,000원(부가세별도)</dd>
				<dd class="mt5"><a class="bbtn db" href="javascript:void(0);" onclick="a(5000);">충전하기</a></dd>
			</dl>

			<dl>
				<dt class="font20 bold">사이버머니 10,000원</dt>
				<dd class="font18">10,000원(부가세별도)</dd>
				<dd class="mt5"><a class="bbtn db" href="javascript:void(0);" onclick="a(10000);">충전하기</a></dd>
			</dl>

			<dl>
				<dt class="font20 bold">사이버머니 20,000원</dt>
				<dd class="font18">20,000원(부가세별도)</dd>
				<dd class="mt5"><a class="bbtn db" href="javascript:void(0);" onclick="a(20000);">충전하기</a></dd>
			</dl>
			<dl>
				<dt class="font20 bold">사이버머니 50,000원</dt>
				<dd class="font18">50,000원(부가세별도)</dd>
				<dd class="mt5"><a class="bbtn db" href="javascript:void(0);" onclick="a(50000);">충전하기</a></dd>
			</dl>
		</div>

	</div><!--// inner E-->
</div>
<script>
	 function a(m){
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp54655431');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '사이버머니 '+ m +'P',
		    amount : m+m*0.1,
		    buyer_email : '<%= loginUser.getEmail() %>',
		    buyer_name : '<%= loginUser.getUser_name() %>',
		    buyer_tel : '<%= loginUser.getPhone() %>'
		}, function(rsp,m) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        var amount = rsp.paid_amount;
		        var apply = rsp.apply_num;
		       	var chDiv = rsp.pay_method;
		       	location.href="<%=request.getContextPath()%>/ChangeServlet?amount=" +amount+ "&apply="+apply+"&msg="+msg+"&chDiv="+chDiv;
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		 
		});
	} 
	
</script>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>


</body>
</html>