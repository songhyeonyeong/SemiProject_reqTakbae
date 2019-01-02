<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"
	import="com.kh.jinkuk.border.inquire.model.vo.*"%>

<%@ include file="/views/include/common.jsp"%>

<%
	Inquire i = (Inquire) request.getAttribute("i");
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int date = cal.get(Calendar.DATE);
	String tyear = String.valueOf(year);
	String tmonth = String.valueOf(month);
	String tdate = String.valueOf(date);
	String Todat = tyear + "-" + tmonth + "-" + tdate;
%>

<title>문의하기</title>

</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">문의하기</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->

				<div class="titNavi">
					문의하기 <span>홈 &gt; 문의하기</span>
				</div>
				<form id="updateForm" method="post">
					<table class="boardWrite mt30">
						<!-- boardWrite S-->
						<caption>문의하기 리스트입니다.</caption>
						<%
							if (loginUser != null) {
						%>
						<colgroup>
							<col style="width: 20%;">
							<col style="width: %;">
						</colgroup>


						<tbody>
							<tr>
								<th scope="row">작성일</th>
								<td><label for=""></label> <input id="date" name="date"
									id="date" class="inputText" value="<%=Todat%>" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td><label for=""></label> <textarea
										class="inp_info tf_info" cols="24" id="title" name="title" value="<%=i.getM_title() %>"><%=i.getM_title() %></textarea>
										<input type="hidden" name="mno" value="<%=i.getM_no()%>">	
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td><label for=""></label> <textarea
										class="inp_info tf_info" cols="24" id="context" name="context" value="<%=i.getM_context()%>"><%=i.getM_context()%></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td><input type="text" value="<%=i.getUser_id()%>"
									name="writer" readonly> <input type="hidden"
									value="<%=i.getU_no()%>" name="uno"></td>
							</tr>

						</tbody>
					</table>
					<!--// boardWrite E-->

					<div class="btnbox mt20">
						<!-- btnbox S-->
						<span><button class="mbtn bk" onclick="complete()">수정하기</button></span>


					</div>
					<!--// btnbox E-->
					<script>
		function complete(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/updateInquireOne");
						}
					</script>
				</form>
				<%
					} else {
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

</body>
</html>