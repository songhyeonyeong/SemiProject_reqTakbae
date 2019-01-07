<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세주소검색</title>
<style>
<%
String div=request.getParameter("To");

%>
 input[type='text']{
 		width:250px;
		height:30px;
		margin-left:10px;
		margin-right:auto;
		margin-bottom:auto;
		
		
		}
	.other{
		margin-top:10px;
	}
	#submit{
		width:60px;
		height:20px;
		text-align:center;
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
	}
	#divv{
	margin-top:20px;
	}

</style>

</head>
<%@ include file="/views/include/common.jsp" %>
<body>
<div id="divv">
<span id="top">
<input type="text" id="sample6_postcode"  placeholder="우편번호">&nbsp;&nbsp;
<!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" > -->
<a class="mbtn or" onclick="sample6_execDaumPostcode()">우편번호찾기</a><br>
</span>
<input type="text" id="sample6_address" style="width:500px;" class="other" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" class="other"  placeholder="상세주소">
<input type="text" id="sample6_extraAddress"class="other"  placeholder="참고항목">
<div align="center">
<!-- <button id="submit"onclick="addrsub()">완료</button> -->
<span><a id ="submit" class="mbtn db" onclick="addrsub()">완료</a></span>
</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
        
        
        
    }
        function addrsub(){
        	var fullAddress =sample6_postcode.value+"/"+sample6_address.value+"/"+sample6_detailAddress.value+"/"+sample6_extraAddress.value;
        	<%if(div.equals("start")){%>
        	console.log(fullAddress);
        	opener.document.getElementById("startAdrrS").innerHTML=sample6_address.value;
        	opener.document.getElementById("startAdrr").value=fullAddress;
        	window.close();
        	<%}else{%>
        	opener.document.getElementById("endAdrrS").innerHTML=sample6_address.value;
        	opener.document.getElementById("endAdrr").value=fullAddress;
        	window.close();
        	<%}%>
        }
</script>
</body>
</html>