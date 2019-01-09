<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*, com.kh.jinkuk.border.announcment.model.vo.*"%>

<% 
	Announcment a = (Announcment)request.getAttribute("a"); 
	InsertAnnouncment i = (InsertAnnouncment)request.getAttribute("i");
	int num = (int)request.getAttribute("num");
	Images img =(Images)request.getAttribute("img");
	String gongdiv=(String)request.getAttribute("gongdiv");
%>

<%@ include file="/views/include/common.jsp" %>

<title>전체 공고</title>

<script type="text/javascript">

(function($){
  var $fileBox = null;
  
  $(function() {
    init();
  })
  
  function init() {
    $fileBox = $('.input-file');
    fileLoad();
  }
  
  function fileLoad() {
    $.each($fileBox, function(idx){
      var $this = $fileBox.eq(idx),
          $btnUpload = $this.find('[type="file"]'),
          $label = $this.find('.file-label');
      
      $btnUpload.on('change', function() {
        var $target = $(this),
            fileName = $target.val(),
            $fileText = $target.siblings('.file-name');
        $fileText.val(fileName);
      })
      
      $btnUpload.on('focusin focusout', function(e) {
        e.type == 'focusin' ?
          $label.addClass('file-focus') : $label.removeClass('file-focus');
      })
      
    })
  }
  
  
})(jQuery);



</script>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">공고 -상세보기</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			전체 공고
			<span>홈 &gt; 공고&gt; 상세보기</span>
			<!-- <p class="flo_left mb10"><a class="mbtn rd"  href="#fn_open" onclick="fn_open()">신고하기</a></p>user에게만 보임 -->
		<script>
		function fn_open() {
			   window.open('<%=request.getContextPath()%>/views/board/reportPop.jsp?gno=<%=num%>&title=<%= a.getG_TITLE() %>&name=<%= loginUser.getUser_name() %>&uno=<%=loginUser.getU_no()%>','reportPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=500,width=600,height=600');
			}
		
		</script>	
		
		</div>
		
		
		<div class="rtv of mt30">

			<div class="flo_left wth300"><!-- flo_left S-->
				<%if(img!=null){ %>
				
				<p><img src="<%=request.getContextPath()%>/upload/<%=img.getI_c_name()%>" alt="상품이미지"  width="300" height="250"></p>
				<%}else{%>
					<img src="http://via.placeholder.com/250x250" alt="기사사진">
				<%} %>
				<p class="font30 tcen">신청자 인원 <em class="font30 orange"><%= a.getCount() %></em>명</p>
			</div><!--// flo_left E-->

			<div class="flo_right wth850"><!-- flo_right S-->
				<table class="noticeWrite"><!-- boardWrite S-->
					<caption>공고 리스트입니다.</caption>
					<colgroup>
						<col style="width:20%;">
						<col style="width:%;">
						<col style="width:20%;">
						<col style="width:%;">
					</colgroup>
						<% if(loginUser != null){ %>
						<p class="flo_right mb10"><a class="mbtn rd"  href="#fn_open" onclick="fn_open()">신고하기</a></p>
						<% } %>
					<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3"><span><%= a.getG_TITLE() %></span></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><%= a.getUSER_ID() %></td>
						<th scope="row" class="gray80">등록일</th>
						<td><%= a.getG_S_DATE() %></td>
					</tr>
					<tr>
						<th scope="row">제품 종류</th>
						<td><%= a.getG_TYPE() %></td>
						<th scope="row" class="red100">마감일</th>
						<td><%= a.getG_E_DATE() %></td>
					</tr>
					<tr>
						<th scope="row">물품 크기</th>
						<td><%= a.getG_SIZE() %></td>
						<th scope="row">물품 가액</th>
						<td><%= a.getG_PRICE() %></td>
					</tr>
					<tr>
						<th scope="row">출발지</th>
						<td><%= a.getG_S_AREA() %></td>
						<th scope="row">도착지</th>
						<td><%= a.getG_E_AREA() %></td>
					</tr>
					<tr>
						<th scope="row">배송날짜</th>
						<td colspan="3"><%= a.getG_DAY() %></td>
					</tr>
					<tr>
						<th scope="row">상세내용</th>
						<td colspan="3">
						<%= a.getG_CONTEXT() %>
						</td>
					</tr>
					</tbody>
				</table><!--// boardWrite E-->
			</div><!--// flo_right E-->

		</div>

		<div class="clear btnbox mt30 mb30">
		<%-- 	<span><a class="mbtn gy wth60" href='<%=request.getContextPath()%>/selectList.bo?gongdiv=<%=gongdiv%>'>공고목록</a></span> --%>

			
			<%if(loginUser!=null){
						if(loginUser.getUser_div().equals("신청자")){ %>
				<%if(loginUser.getUser_id().equals(a.getUSER_ID())) {%>
			<span><a class="mbtn gy wth60" href="<%=request.getContextPath()%>/updateBO?gongdiv=<%=gongdiv%>&&gno=<%=num%>">수정하기</a></span>
			
			<span><a class="mbtn rd wth60" href="<%=request.getContextPath()%>/deleteBoard.bo?gongdiv=<%=gongdiv%>&&gno=<%=num%>">삭제</a></span>
				<%}%>
			<%}else{ %>
			<span><a class="mbtn db wth60" href="<%=request.getContextPath()%>/ReqAnnouncement.bo?gongdiv=<%=gongdiv%>&&gno=<%=num%>">신청하기</a></span>
			<%} 
			}%>
			<span><a class="mbtn bk wth60"  href='<%=request.getContextPath()%>/selectList.bo?gongdiv=<%=gongdiv%>&&gno=<%=num%>'>돌아가기</a></span>
			
		</div>



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views//include/myNav.jsp" %>

</body>
</html>