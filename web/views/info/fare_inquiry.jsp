<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String bigtabon="2";
%>
<%@ include file="/views/include/common.jsp" %>

<title>요금조회</title>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">이용안내</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->

		<%@ include file="/views/include/tabInfo.jsp" %>	 

		<div class="titNavi">
			요금조회
			<span>홈 &gt; 이용안내 &gt; 요금조회</span>
		</div>

		<table class="lineBoard2 mt20">
			<caption>요금조회 리스트입니다.</caption>
			<colgroup>
				<col style="width:10%;"><!--  -->
				<col style="width:30%;"><!--  -->
				<col style="width:30%;"><!--  -->
				<col style="width:30%;"><!--  -->
			</colgroup>
			<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">소</th>
				<th scope="col">중</th>
				<th scope="col">대</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>규격</td>
				<td>
					<p><img src="/reqtakbae/views/common/images/contents/boxM.png" alt="box small"></p>
					<p class="mt20">가로:100cm<br>세로:100cm</p>
				</td>
				<td>
					<p class="mt10"><img src="/reqtakbae/views/common/images/contents/boxM.png" alt="box middle"></p>
					<p class="mt20">가로:120cm<br>세로:120cm</p>
				</td>
				<td>
					<p class="mt10"><img src="/reqtakbae/views/common/images/contents/boxB.png" alt="box big"></p>
					<p class="mt20">가로:160cm<br>세로:160cm</p>
				</td>
			</tr>
			<tr>
				<td>무게</td>
				<td>5kg</td>
				<td>10kg</td>
				<td>20kg</td>
			</tr>
			<tr>
				<td>금액</td>
				<td>4500원</td>
				<td>4800원</td>
				<td>5500원</td>
			</tr>
			</tbody>
		</table>
		
		<ul class="inlineUl mt30 tcen">
			<li>
				<span>무게 : </span>
				<span>
				<label for=""></label>
				<input id="weight" name="" class="wth100" type="text" >
				</span>
				<span>kg</span>
			</li>
			<li class="ml100">
				<!-- <span>크기 : </span>
				<span><label for=""></label><input id="small" name="" class="" type="radio" value="" > </span>
				<span>소</span>
				<span><label for=""></label><input id="" name="" class="" type="radio" value="" > </span>
				<span>중</span>
				<span><label for=""></label><input id="" name="" class="" type="radio" value="" > </span>
				<span>대</span> -->
				
				<span>크기 : </span>
				<input type="radio" id="size" name="size" value="s">소
				<input type="radio" id="size" name="size" value="m">중
				<input type="radio" id="size" name="size" value="l" checked>대
				
				
			</li>
			<li class="ml100">
				<span><button id="moneyCheck" class="mbtn gy" >요금조회</button></span>
				<span>금액 : </span>
				<span>
				<label for=""></label>
				<!-- <input id="" name="" class="wth100" type="label" value="" > -->
				<span id="money" style="font-size: 1.5em"></span>
				</span>
				<!-- <span>원</span> -->
			</li>
		</ul>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>
   $("#moneyCheck").click(function(){
      var weight = $("#weight").val();
      var size = $("#size").val();
      
      
   if(weight == ""){
      alert("무게를 입력하세요");
   }else if(weight > 20){
      alert("20kg 이상은 배송이 불가합니다.")
   }else{
      if(weight<=5){
         if(size == "m"){
            $("#money").html("4800원");
         }else if(size == "m"){
            $("#money").html("5500원");
         }else{
            $("#money").html("4500원");
         }
      }else if(weight<=10){
         if(size == "l"){
            $("#money").html("5500원");
         }else{
            $("#money").html("4800원");
         }
      }else{
         $("#money").html("5500원");   
         }
      }   
   });
</script>



</body>
</html>