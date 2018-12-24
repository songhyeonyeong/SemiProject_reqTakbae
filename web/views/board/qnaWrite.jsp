<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>문의하기</title>

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

<div id="subvisual">문의하기</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			문의하기
			<span>홈 &gt; 문의하기</span>
		</div>

		<table class="boardWrite mt30"><!-- boardWrite S-->
			<caption>문의하기 리스트입니다.</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">문의 분류*</th>
				<td>
					<span>
						<label for=""></label>
						<select id="" name="" class="input wth200">
							<option selected="selected">카테고리 선택</option>
							<option value="#">회원가입문의</option>
							<option value="#">아이디/비밀번호문의</option>
							<option value="#">배송문의</option>
							<option value="#">기사 신고</option>
							<option value="#">공고자 신고</option>
							<option value="#">구매/결제문의</option>
							<option value="#">기타</option>
						</select> 
					</span>
					<!-- <span>
						<label for=""></label>
						<select id="" name="" class="input wth200">
							<option selected="selected">2차 선택</option>
							<option value="#">이용자</option>
						</select> 
					</span> -->
				</td>
			</tr>
			<tr>
				<th scope="row">문의 제목*</th>
				<td>
					<label for=""></label>
					<input id="" name="" class="inputText" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">문의 내용 *</th>
				<td>
					<label for=""></label>
					<textarea class="inp_info tf_info" cols="24" id="" name=""></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">파일 첨부</th>
				<td>
					<div class="input-file"> 
						<input type="text" readonly="readonly" class="file-name wth600" /> 
						<label for="upload01" class="file-label">파일 업로드</label> 
						<input type="file" name="" id="upload01" class="file-upload" /> 
					</div>
				</td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn bk" href="qnaList.jsp">접수하기</a></span>
			<!-- <span><a class="mbtn rd" href="#">삭제</a></span> -->
		</div><!--// btnbox E-->
		



	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>