<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	Inquiry n = (Inquiry)request.getAttribute("n");	
 	Inquiry m = (Inquiry)request.getAttribute("m");	

%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<style>
	textarea{
		width:100px;
		height:100px;
	}
</style>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 문의내역 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의내역 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">글번호</th>
				<td id="inquiryNo"><%=n.getM_no()%></td>
			</tr> 
		 	<tr>
				<th scope="row">작성자</th>
				<td id="answer"><%=n.getU_no()%></td>
			</tr> 
			<tr>
				<th scope="row">문의 제목</th>
				<td><%=n.getM_title()%></td>
			</tr>
			<tr>
				<th scope="row">문의 내용</th>
				<td class="minh100 clfix"><%=n.getM_context() %></td>
			</tr>
			<tr>
				<th scope="row">답변</th>
				<td>
				<%if(m != null){ %>
					<%=m.getM_context()%>
							
					<div id="replySelectArea">
						<table>
							<td scope="row" id="replySelectTable"></td>
							
							<br><br>
							<p align="right">작성날짜 : <%=m.getM_date() %></p>
						</table>
					</div>
					<%}else{ %>
					<div id="replySelectArea">
						<table>
							<td scope="row" id="replySelectTable"></td>
						</table>
					</div>
					<%} %>
					
				</td>

			</tr>

		</tbody>
		</table><!--// boardWrite E-->
		
		
		
			<table class="boardWrite"><!-- boardWrite S-->
				<caption>답변내역 리스트입니다.</caption>
				<colgroup>
					<col style="width:20%;">
				</colgroup>
				<tbody>
				<%if(m !=null){ %>
				<tr style="width:100%; height:100%;" hidden>
					<th scope="row" class="blue80">답변 내용</th>
					<td class="clfix">
						<textarea cols="20" rows="5" id="replyContent" style="width:100%;" class="minh100"></textarea>
					</td>
				</tr>
				<%}else{%>
				<tr style="width:100%; height:100%;">
					<th scope="row" class="blue80">답변 내용</th>
					<td class="clfix">
						<textarea cols="20" rows="5" id="replyContent" style="width:100%;" class="minh100"></textarea>
					</td>
				</tr>
				
				<%} %>
				</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="<%=request.getContextPath()%>/selectAll.in">목록</a></span>
			<span><a class="mbtn rd" href="#">삭제하기</a></span>
			<%if(m != null){ %>
				<span hidden><a class="mbtn db" id="addReply" >답변하기</a></span>
			<%}else{%>
				<span><a class="mbtn db" id="addReply" >답변하기</a></span>
			<%} %>
		</div><!--// btnbox E-->
		

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
	$(function(){
		$(".mbtn").css("cursor","pointer");
	});
	
	
	
	$(function(){
		$("#addReply").click(function(){ //댓글등록클릭시
			var content = $("#replyContent").val(); //유저가 작성한 댓글내용
			var inquiryNo = $("#inquiryNo").text();
			console.log(content +" " + inquiryNo);
			$.ajax({
				url:"/reqtakbae/insertReply.in", //댓글삽입 서블릿으로 전송
				data:{content:content,inquiryNo:inquiryNo},
				type:"post",
				success:function(data){
					console.log(data);
					
					var $replySelectTable = $("#replySelectTable");
	
				
					//새로작성된 댓글만가져오는게아니라, 이전댓글까지 DB에서 통째로 가져오기때문에 
					//초기화해준다 생각
					
					for(var key in data){
						var $tr = $("<tr>");
						var $contentTd = $("<td>").text(data[key].m_context).css("width","400px");
						var $inquiryNoTd = $("<td>").text(data[key].m_date).css("width","400px");
						$tr.append($contentTd);
						$tr.append($inquiryNoTd);
						$replySelectTable.append($tr);
						
					}
					
				},
				error:function(){
					console.log("실패");
				}
			});
		});
	});
	
	
	
	
	 $('span').eq(1).click(function() {
		 		
				var test =<%=n.getM_no()%>;

				console.log(test);
				
				 location.href="<%=request.getContextPath()%>/delete.in?name=" + test;

			});
			
		

</script>




</body>
</html>