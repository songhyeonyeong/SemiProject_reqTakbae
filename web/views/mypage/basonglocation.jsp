<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>API Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<a id="navi"  onclick="navi();">
네비키기
</a>
<script type='text/javascript'>

    Kakao.init('df9b4b2c505f7b6860e9e73d0c22e278');
    
    function navi(){
        Kakao.Navi.start({
            name: "현대백화점 판교점",
            x: 127.11205203011632,
            y: 37.39279717586919,
            coordType: 'wgs84'
        });
    }
  //]]>
</script>








</body>
</html>