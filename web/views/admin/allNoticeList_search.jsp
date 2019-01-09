<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	ArrayList<Announcment> list = (ArrayList<Announcment>)request.getAttribute("list");	
	int i = 0;
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<style>
	#submit,button{
		width:70px;
		
		height:28px;

   		background-color: gray;

    	border: none;

    	color:#fff;

    	padding: 6px 2px;

    	text-align: center;

    	text-decoration: none;

   		display: inline-block;

    	font-size: 13px;

    	margin: 4px;

    	cursor: pointer;
		border-radius:3px;
	}
</style>
<script>

 	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};

</script>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="/views/admin/include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 공고게시물 관리 - 전체공고 관리</div>

		<div class="contBox mt30"><!-- contBox S -->
	
			<%@ include file="/views/admin/include/tab_notice.jsp" %>

			<table class="searchTbl mt30 mb30"><!-- searchTbl S -->
				<caption>공고 검색입니다.</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:%;">
					<col style="width:15%;">
					<col style="width:%;">
					<col style="width:15%;">
					<col style="width:%;">
				</colgroup>
				<tbody>
				<form action="<%=request.getContextPath() %>/search.fi" method="POST" name="fr">
					<tr>
						<th scope="col">도착</th>
						<td>
							<label for=""></label>
							<select id="destination" name="destination" class="wth150">
							<option value="" selected="selected" selected disabled hidden>도착지 선택</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</td>
						<th scope="col">크기</th>
						<td>
							<label for=""></label>
							<select id="size" name="size" class="wth150">
							<option value="" selected="selected" selected disabled hidden>전체</option>
							<option value="소">소</option>
							<option value="중">중</option>
							<option value="대">대</option>
						</td>
						<th scope="col">상태</th>
						<td>
							<label for=""></label>
							<select id="status" name="status" class="wth150">
							<option value="" selected="selected" selected disabled hidden>전체</option>
							<option value="매칭중">매칭중</option>
							<option value="매칭완료">매칭완료</option>					
						</td>
					</tr>
				</tbody>

			</table>
			
			<div class="btnbox mb30">
				<input type="submit" value="검색하기" id="submit">
			</div>
	</form>

			<p class="flo_right mb10"><a class="mbtn or" onclick="deleteNotice();">삭제하기</a></p><!-- admin에게만 보임 -->

			<table class="boardList mt20">
				<caption>전체공고 리스트입니다.</caption>
				<colgroup>
					<col style="width:7%;"><!-- No -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:13%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">공고번호</th>
						<th scope="col">출발지</th>
						<th scope="col">도착지</th>
						<th scope="col">공고내용</th>
						<th scope="col">배송날짜</th>
						<th scope="col">크기</th>
						<th scope="col">금액</th>
						<th scope="col">상태</th>
						<th scope="col">상세</th>
					</tr>
				</thead>
				<tbody>
				<form  id="add" method="get" action="<%=request.getContextPath()%>/delete.no">
				<% for(Announcment m : list){ %>
					<tr>
						<td>
							<label for=""> 체크</label>
							<input id="memCheck" name="memCheck" class="check" type="checkbox" value="<%=m.getG_NO()%>">
						</td>
						<input type="hidden" value="<%=i++%>">
						<td><%= m.getG_NO() %></td>
						<td><%= m.getG_S_AREA() %></td>
						<td><%= m.getG_E_AREA()%></td>
						<td><%= m.getG_TITLE()%></td>
						<td><%= m.getG_DAY() %></td>
						<td><%= m.getG_SIZE() %></td>
						<td><%= m.getG_PRICE() %></td>
						<td><%= m.getG_P_DIV() %></td>
						<td><a class="sbtn gy" href="#">상세보기</a></td>
						
						<script>	

							var t=$('#money').children().eq(<%=i%>).children().eq(8).text();	
		 					$('#money').children().eq(<%=i%>).children().eq(8).text(Number(t).format());


						</script>
					</tr>
				<% } %> 
				</form>
				</tbody>
			</table>
			

			
		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="/views/admin/include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>

	
	$(function() { 
		 
	    $("#datePicker").datepicker({dateFormat: 'yy-mm-dd'});
	 
	    }); 
	 
	    function show_dp(){ 
	 
	     $("#datePicker").datepicker('show'); //Show on click of button 
	 
	    } 
	 
	
		function deleteNotice(){
			$("input[name=memCheck]:checked").each(function() {
				
				
				var test =$(this).val();

				console.log(test);
				$("#add").submit();

			});
			
		}

		$(function(){
			$(".sbtn").click(function(){
				var num = $(this).parent().parent().children().eq(1).text();
				console.log(num);
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; 
			});
			
		});
				
			

/*  		function check() {

			if(fr.destination.value==null) {
				fr.destination.value = "0";
				System.out.println(fr.destination.value);
				return true;
				
			}else if(fr.size.value==null) {
				fr.size.value = "0";
				System.out.println(fr.size.value);
				return true;
				
			}else if(fr.status.value==null) {
				fr.status.value = "0";
				System.out.println(fr.status.value);
				return true;
			}

		}
	  */
			
	</script>

</body>
</html>