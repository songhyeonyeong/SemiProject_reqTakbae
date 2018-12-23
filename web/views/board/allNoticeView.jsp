<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/hyun/myPost/include/common.jsp" %>

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
				<p><img src="http://via.placeholder.com/300x250" alt="상품이미지"></p>
				<p class="font30 tcen">신청자 인원 <em class="font30 orange">3</em>명</p>
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
						<td colspan="3">노트북배송하실분</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>testid12</td>
						<th scope="row" class="gray80">등록일</th>
						<td>2018-12-02</td>
					</tr>
					<tr>
						<th scope="row">제품 종류</th>
						<td>전자 제품</td>
						<th scope="row" class="red100">마감일</th>
						<td>2018-12-11</td>
					</tr>
					<tr>
						<th scope="row">물품 크기</th>
						<td>중</td>
						<th scope="row">물품 가액</th>
						<td>700,000</td>
					</tr>
					<tr>
						<th scope="row">출발지</th>
						<td>강남구 태보 역삼아이타워</td>
						<th scope="row">도착지</th>
						<td>강동구 성내동 319</td>
					</tr>
					<tr>
						<th scope="row">배송날짜</th>
						<td colspan="3">2018-12-11 16:00</td>
					</tr>
					<tr>
						<th scope="row">상세내용</th>
						<td colspan="3">
							11일 오후4시까지 성내동으로 배송해주실 기사분 모집합니다~<br>
							가격이 있으니 조심해주세요^^
						</td>
					</tr>
					</tbody>
				</table><!--// boardWrite E-->
			</div><!--// flo_right E-->

		</div>

		<div class="clear btnbox mt30 mb30">
			<span><a class="mbtn gy wth60" href="allNoticeList.jsp">목록</a></span>
			<span><a class="mbtn gy wth60" href="#">수정</a></span>
			<span><a class="mbtn rd wth60" href="#">삭제</a></span>
			<span><a class="mbtn db wth60" href="#">신청하기</a></span>
		</div>



	</div><!--// inner E-->
</div>

<%@ include file="/hyun/myPost/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/hyun/myPost/include/myNav.jsp" %>

</body>
</html>