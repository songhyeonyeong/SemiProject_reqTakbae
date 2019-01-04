<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp"%>

<title>오늘의 공고</title>
<!--  jQuery UI CSS파일  -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
jQuery 기본 js파일
jQuery UI 라이브러리 js파일
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   -->

<!-- <script type="text/javascript">

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


(jQuery);



</script> -->
</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">전체 공고</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->
				<%
					if (loginUser != null) {
				%>
				<div class="titNavi">
					전체 공고 <span>홈 &gt; 전체 공고</span>
				</div>

				<div class="rtv of mt30">

						<form id="insertano" action="<%=request.getContextPath()%>/insert.bo" method="POST" encType="multipart/form-data">
					<div class="flo_left wth300">
						<!-- flo_left S-->
						<img id="gisaImg" src="http://via.placeholder.com/300x250" width="300" height="250" alt="상품이미지">
						<div class="input-file mt10">
							<input type="text" readonly="readonly" class="file-name wth295" />
							<label for="upload01" class="file-label">상품 이미지 업로드</label> <input
								type="file" name="" id="upload01" class="file-upload"
								onchange="loadImg(this)" />
						</div>
					</div>
					<!--// flo_left E-->

					<div class="flo_right wth850">
						<!-- flo_right S-->
							<table class="noticeWrite">
								<!-- boardWrite S-->
								<caption>공고 리스트입니다.</caption>
								<colgroup>
									<col style="width: 20%;">
									<col style="width: %;">
									<col style="width: 20%;">
									<col style="width: %;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td colspan="3"><label for=""></label><input name="title"
											class="wth90p" type="text"></td>
									</tr>
									<tr>
										<th scope="row">제품 종류</th>
										<td colspan="3"><label for=""></label> <select id=""
											name="product" class="input wth200">
												<option selected="selected">선택하세요</option>
												<option value="전자제품">전자제품</option>
												<option value="생활용품">생활용품</option>
												<option value="식품">식품</option>
												<option value="기타">기타</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row">물품 크기</th>
										<td><label for=""></label> <select id="sizeM" name="size"
											class="input wth200">
												<option selected="selected">선택하세요</option>
												<option value="4500">소</option>
												<option value="4800">중</option>
												<option value="5500">대</option>
										</select></td>
										<th scope="row">물품 가액</th>
										<td><label for=""></label><input id="a" name="value" class="wth190" type="text" placeholder="숫자만 입력하세요"></td>
									</tr>
									<tr>
										<th scope="row">출발지</th>
										<td><label for=""></label> <select id="" name="start"
											class="input wth200">
												<option selected="selected">선택하세요</option>
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
										</select></td>
										<th scope="row">도착지</th>
										<td><label for=""></label> <select id="" name="end"
											class="input wth200">
												<option selected="selected">선택하세요</option>
												<option value="강남구">강남구</option>
												<option value="강동구">강동구</option>
												<option value="강북구">강북구</option>
												<option value="강서구">강서구</option>
												<option value="관악구">관악구</option>
												<option value="광진구">광진구</option>
												<option value="구로구">구로구</option>
												<option value="금천">금천</option>
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
										</select></td>
									</tr>
									<tr>
										<th scope="row">배송날짜</th>
										<td colspan="3"><span><label for=""></label><input
												id="dateP" name="d" class="wth150" type="date"></span> <!-- 클릭하면 달력 -->
											<span> <label for=""></label> <select id="" name="h"
												class="input wth100">
													<option selected="selected">시간 선택</option>
													<option value="01">01시</option>
													<option value="02">02시</option>
													<option value="03">03시</option>
													<option value="04">04시</option>
													<option value="05">05시</option>
													<option value="06">06시</option>
													<option value="07">07시</option>
													<option value="08">08시</option>
													<option value="09">09시</option>
													<option value="10">10시</option>
													<option value="11">11시</option>
													<option value="12">12시</option>
													<option value="13">13시</option>
													<option value="14">14시</option>
													<option value="15">15시</option>
													<option value="16">16시</option>
													<option value="17">17시</option>
													<option value="18">18시</option>
													<option value="19">19시</option>
													<option value="20">20시</option>
													<option value="21">21시</option>
													<option value="#">22시</option>
											</select>
										</span> <span> <label for=""></label> <select id="" name="m"
												class="input wth100">
													<option selected="selected">분 선택</option>
													<option value="00">00분</option>
													<option value="10">10분</option>
													<option value="20">20분</option>
													<option value="30">30분</option>
													<option value="40">40분</option>
													<option value="50">50분</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<th scope="row">금액 계산</th>
										<td colspan="3"><span><a class="sbtn gy"
												onclick="a();">계산하기</a><span class="aaaa"></span>원</span>
											<span class="red ml10"></span> <span class="gray clfix mt5">출발지와
												도착지를 설정 후 <em class="red">계산하기</em> 버튼을 눌러주세요.
										</span></td>
									</tr>
									<tr>
									<th scope="row">포인트사용</th>
									<td><label for=""></label><input id="point" name="point"
											class="wth190" type="text" value="0" placeholder="0">
											<span><a class="sbtn gy" onclick="pointminus();">사용하기</a></span>
											</td>
											
									</tr>
									<tr>
									<th scope="row">총 결제금액</th>
									<td><input type="text" id="total" name="total"  readonly>원</td>
									</tr>
									<tr>
										<th scope="row">상세 내용</th>
										<td colspan="3"><label for=""></label> <textarea
												class="wth90p" cols="24" id="" name="area"></textarea></td>
									</tr>
								</tbody>
							</table>
							<!--// boardWrite E-->
					</div>
					<!--// flo_right E-->
				<div class="clear btnbox mt30 mb30">
				<!-- 	<span><button type="submit" class="mbtn or wth60">등록</button></span>
					<span><button type="reset" class="mbtn or wth60">취소</button></span> -->
			 <span><a class="mbtn or wth60" id="sbm">등록</a></span>
			 <span><a class="mbtn gy wth60" href="/reqtakbae/selectList.bo">취소</a></span> 
				</form>
				</div>

				</div>
				<%
					} else {
						request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
						request.getRequestDispatcher("../common/errorPage.jsp");
					}
				%>


			</div>
			<!--// inner E-->
		</div>

		<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>
	<script>
		$(function(){
			$("#sbm").click(function(){
				$("#insertano").submit();
			});
		
		});
		function pointminus(){
			var point=$("#point").val();
			var value=$(".aaaa").text();
			total=Number(value)-Number(point);
			$("#total").val(Number(total));
		}
		function a() {

			var b = $("#sizeM option:selected").val();
			if (b=="선택하세요") {
			} else {
				$(".aaaa").text(b);
			}
		}
		function loadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("#gisaImg").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>

</body>
</html>