<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = (String)request.getParameter("num"); 
	int money = Integer.parseInt(request.getParameter("money"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	p { margin:20px 0px; }
</style> 
</head>

<body>
	<div class="container" align="center">
		<div class="row">
			<div class="col">
				<p><strong id="p1"></strong></p>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-1" class="custom-control-input" value="10000">
					<label id="1" class="custom-control-label" for="jb-radio-1">10000원</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-2" class="custom-control-input" value="20000">
					<label id="2" class="custom-control-label" for="jb-radio-2">20000원</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-3" class="custom-control-input" value="30000">
					<label id="3" class="custom-control-label" for="jb-radio-3">30000원</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-4" class="custom-control-input" value="50000">
					<label id="4" class="custom-control-label" for="jb-radio-4">50000원</label>
				</div>
				<br>
				<button type="submit" class="btn btn-outline-primary" onclick="submit();">환전신청</button>
				<button type="reset" class="btn btn-outline-danger" onclick="cl();">취소</button>
			</div>
		</div>
	</div>
<script>
	$(function(){
		$("#p1").text('보유 사이버머니  : '+ <%=money%> + '원');
		
		if(<%=money%>>=50000){
			
		}else if(<%=money%>>=30000){
			$("#jb-radio-4").attr('onclick', "return false");
			$('#4').css('color', 'lightgrey');
		}else if(<%=money%>>=20000){
			$("#jb-radio-4").attr('onclick', "return false");
			$('#4').css('color', 'lightgrey');
			$("#jb-radio-3").attr('onclick', "return false");
			$('#3').css('color', 'lightgrey');
		}else if(<%=money%>>=10000){
			$("#jb-radio-4").attr('onclick', "return false");
			$('#4').css('color', 'lightgrey');
			$("#jb-radio-3").attr('onclick', "return false");
			$('#3').css('color', 'lightgrey');
			$("#jb-radio-2").attr('onclick', "return false");
			$('#2').css('color', 'lightgrey');
		}else{
			$("#jb-radio-4").attr('onclick', "return false");
			$('#4').css('color', 'lightgrey');
			$("#jb-radio-3").attr('onclick', "return false");
			$('#3').css('color', 'lightgrey');
			$("#jb-radio-2").attr('onclick', "return false");
			$('#2').css('color', 'lightgrey');
			$("#jb-radio-1").attr('onclick', "return false");
			$('#1').css('color', 'lightgrey');
		}
	});
	
	function submit(){
	    var select = $('input[name="radio"]:checked').val();
	    
		if(<%=money%> >= select){
			 var theURL = "<%=request.getContextPath()%>/ExchangeInsertServlet?uno=<%=num%>&radio="+select; // 전송 URL
			 opener.window.location = theURL;
			 close();
		}
	} 
	
	function cl(){
		 window.close();
	}
	
	
</script>
		
</body>
</html>


