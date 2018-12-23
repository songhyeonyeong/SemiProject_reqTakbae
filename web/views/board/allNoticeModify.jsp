<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

<title>오늘의 공고</title>

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

<%@ include file="/hyun/myPost/include/header.jsp" %>

<div id="subvisual">전체 공고</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			전체 공고
			<span>홈 &gt; 전체 공고</span>
		</div>

		<div class="rtv of mt30">

			<div class="flo_left wth300"><!-- flo_left S-->
				<img src="http://via.placeholder.com/300x250" alt="상품이미지">
				<div class="input-file mt10"> 
					<input type="text" readonly="readonly" class="file-name wth295" /> 
					<label for="upload01" class="file-label">상품 이미지 업로드</label> 
					<input type="file" name="" id="upload01" class="file-upload" /> 
				</div>
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
					<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3"><label for=""></label><input id="" name="" class="wth90p" type="text" value="" > </td>
					</tr>
					<tr>
						<th scope="row">제품 종류</th>
						<td colspan="3">
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">----</option>
								<option value="#">----</option>
								<option value="#">----</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th scope="row">물품 크기</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">----</option>
								<option value="#">----</option>
								<option value="#">----</option>
							</select> 
						</td>
						<th scope="row">물품 가액</th>
						<td><label for=""></label><input id="" name="" class="wth200" type="text" value="" > </td>
					</tr>
					<tr>
						<th scope="row">출발지</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">----</option>
								<option value="#">----</option>
								<option value="#">----</option>
							</select> 
						</td>
						<th scope="row">도착지</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">----</option>
								<option value="#">----</option>
								<option value="#">----</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th scope="row">배송날짜</th>
						<td colspan="3">
							<span><label for=""></label><input id="" name="" class="wth150" type="text" value="" ></span><!-- 클릭하면 달력 -->
							<span>
								<label for=""></label>
								<select id="" name="" class="input wth100">
									<option selected="selected">시간 선택</option>
									<option value="#">08:00</option>
									<option value="#">09:00</option>
									<option value="#">10:00</option>
								</select> 
							</span>
						</td>
					</tr>
					<tr>
						<th scope="row">금액 계산</th>
						<td colspan="3">
							<span><a class="sbtn gy" href="#">계산하기</a></span>
							<span class="red ml10">0원</span>
							<span class="gray clfix mt5">* 출발지와 도착지를 설정 후 <em class="red">계산하기</em> 버튼을 눌러주세요.</span>
						</td>
					</tr>
					</tbody>
				</table><!--// boardWrite E-->
			</div><!--// flo_right E-->

		</div>

		<div class="clear btnbox mt30 mb30">
			<span><a class="mbtn or wth60" href="#">등록</a></span>
			<span><a class="mbtn gy wth60" href="#">취소</a></span>
		</div>



	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>