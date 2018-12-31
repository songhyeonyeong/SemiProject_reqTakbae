<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

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

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">전체 공고</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	<% if(loginUser != null){%> 
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
								<option value="#">전자제품</option>
								<option value="#">생활용품</option>
								<option value="#">식품</option>
								<option value="#">기타</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th scope="row">물품 크기</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">소</option>
								<option value="#">중</option>
								<option value="#">대</option>
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
								<option value="#">강남구</option>
								<option value="#">강동구</option>
								<option value="#">강북구</option>
								<option value="#">강서구</option>
								<option value="#">관악구</option>
								<option value="#">광진구</option>
								<option value="#">구로구</option>
								<option value="#">금천</option>
								<option value="#">노원구</option>
								<option value="#">도봉구</option>
								<option value="#">동대문구</option>
								<option value="#">동작구</option>
								<option value="#">마포구</option>
								<option value="#">서대문구</option>
								<option value="#">서초구</option>
								<option value="#">성동구</option>
								<option value="#">성북구</option>
								<option value="#">송파구</option>
								<option value="#">양천구</option>
								<option value="#">영등포구</option>
								<option value="#">용산구</option>
								<option value="#">은평구</option>
								<option value="#">종로구</option>
								<option value="#">중구</option>
								<option value="#">중랑구</option>
							</select> 
						</td>
						<th scope="row">도착지</th>
						<td>
							<label for=""></label>
							<select id="" name="" class="input wth200">
								<option selected="selected">선택하세요</option>
								<option value="#">강남구</option>
								<option value="#">강동구</option>
								<option value="#">강북구</option>
								<option value="#">강서구</option>
								<option value="#">관악구</option>
								<option value="#">광진구</option>
								<option value="#">구로구</option>
								<option value="#">금천</option>
								<option value="#">노원구</option>
								<option value="#">도봉구</option>
								<option value="#">동대문구</option>
								<option value="#">동작구</option>
								<option value="#">마포구</option>
								<option value="#">서대문구</option>
								<option value="#">서초구</option>
								<option value="#">성동구</option>
								<option value="#">성북구</option>
								<option value="#">송파구</option>
								<option value="#">양천구</option>
								<option value="#">영등포구</option>
								<option value="#">용산구</option>
								<option value="#">은평구</option>
								<option value="#">종로구</option>
								<option value="#">중구</option>
								<option value="#">중랑구</option>
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
					<tr>
						<th scope="row">상세 내용</th>
						<td colspan="3">
							<label for=""></label>
							<textarea class="wth90p" cols="24" id="" name=""></textarea>
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
	<% }else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp");
	} %>


	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>