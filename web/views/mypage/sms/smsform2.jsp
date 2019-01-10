<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <head>
 <% 
 	String phone=request.getParameter("phone");
 
 %>
        <title>메세지보내기 </title>
        <script type="text/javascript">
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
        }
            }

            function loadJSON() {
                var data_file = "/reqtakbae/views/mypage/sms/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>
    </head>
<body>
 <body onload="loadJSON()">
    <h1>메세지전송하기</h1>
    <form method="post" name="smsForm" action="/reqtakbae/views/mypage/sms/sms1.jsp">
        <input type="hidden" name="action" value="go">
          <input type="hidden" name="smsType" value="S">
          <input type="hidden" name="smsType" value="L">
        <input type="hidden" name="subject" value="제목">
                전송메세지<br>
        <textarea name="msg" cols="30" rows="10" style="width:455px;">택배를 부탁해!
받는사람의 상세정보를 기사님께 알려주세요~! 
        
</textarea>
        <br />
                   전송번호
        <input type="text" name="rphone" value=<%=phone %> readonly>
        <input type="hidden" name="destination" value="" size=80>
        <br /> 보내는 번호
        <input type="hidden" name="sphone1">
        <input type="hidden" name="sphone2">
        <input type="hidden" name="sphone3">
        <span id="sendPhoneList"></span>
        <input type="hidden" name="rdate" maxlength="8">
        <input type="hidden" name="rtime" maxlength="6">
        <input type="hidden" name="returnurl" maxlength="64" value="">
        <input type="hidden" name="testflag" maxlength="1">
        <input type="hidden" name="nointeractive" maxlength="1">
        <input type="hidden" name="repeatFlag" value="Y">
        <input type="hidden" name="repeatNum" value="">
       <!--  <select name="repeatNum">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select> 예) 1~10회 가능. -->
         <input type="hidden" name="repeatTime" value="">
      <!--   <select name="repeatTime"> 예)15분 이상부터 가능.
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="25">25</option>
        </select>분마다 -->
        <br>
        <input type="submit" value="전송">
    </form>
</body>
</html>