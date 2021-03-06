<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>

	<h1><a href="#INSERT" onClick="submitForm();"><em class="orange font30 bold">택배를 부탁해</em> 관리자페이지</a></h1>

	<div class="inner"><!-- inner S -->
		<ul class="gnbMenu">
			<li><a href="#INSERT" onClick="submitForm();">회원 관리</a></li>
			<li><a href="#INSERT" onClick="SelectAllJoinConfirm();">배송기사 승인</a></li>
			<li><a href="#INSERT" onClick="SelectAllAnnoucement();">공고 게시물 관리</a></li>
			<li><a href="#INSERT" onClick="SelectAllMoney();">충전/포인트/환전 내역</a></li>
			<li><a href="#INSERT" onClick="SelectAllInquiry();">문의 내역</a></li>
			<li><a href="#INSERT" onClick="SelectAllReport();">신고 내역</a></li>
			<li><a href="#INSERT" onClick="SelectAllReview();">후기 게시물 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/SelectChartToday?year=2019&month=01">통계 관리</a></li>

		</ul>
	</div><!--// inner E-->
	
	<script>
		function submitForm(){
			location.href="<%=request.getContextPath()%>/admin.no";
		}
		
		function SelectAllAnnoucement(){
			location.href="<%=request.getContextPath()%>/selectAll.an";
		}
		
		function SelectAllInquiry(){
			location.href="<%=request.getContextPath()%>/selectAll.in";
		}
		
		
		function SelectAllMoney(){
			location.href="<%=request.getContextPath()%>/selectAll.mo";
		}
		
		function SelectAllReview(){
			location.href="<%=request.getContextPath()%>/selectAll.re";
		}
		
		function SelectAllJoinConfirm(){
			location.href="<%=request.getContextPath()%>/select.jo";
		}
		
		function SelectAllReport(){
			location.href="<%=request.getContextPath()%>/select.rp";
		}
		
		
	
	</script>
	
</header>
