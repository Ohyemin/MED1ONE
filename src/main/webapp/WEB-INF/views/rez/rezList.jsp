<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!-- plugin css file  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/responsive.dataTables.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/dataTables.bootstrap5.min.css">

<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.css">

<!-- SweetAlert2 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style>

#rezUpdateBtn{
margin-bottom: -10px !important;

}

.rezUpdateBtn{
padding: 0rem 0rem !important;
font-weight: 500 !important;
font-size: 13px !important;
}


#rezInfoDiv {
	margin-top:20px;
	font-size: 18px;
	font-weight: 700;
}



.rezUpdateLabel {
	margin-bottom: 6px;
	margin-top: 20px;
}

.modal-dialog-right {
	margin-left: 1100px;
	margin-top: 40px;
	display: flex;
	align-items: center;
	min-height: calc(100% - 1rem)
}

.modal-content {
	width: 450px !important;
	background-color: #f9fbfd;
}

.modal-body {
	margin-left: 30px;
	width: 400px !important;
}

.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1040;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.2) !important;
}

.schedule .grid {
	border: 1px solid #f0f0f0 !important;
}

/* 탭 항목 배경색 및 클릭 시 색 변경 */
.nav-tabs .nav-link {
	background-color: #94d4c5 !important; /* 탭 배경색 */
	transition: background-color 0.3s ease !important; /* 색 변경 트랜지션 효과 */
}

.nav-tabs .nav-link.active, .nav-tabs .nav-link:hover {
	background-color: #6aab9c !important; /* 클릭 시 색 변경 */
}

.schedule-item {
	text-align: center;
	font-size: 13px !important;
	font-weight: 500 !important;
	color: white!important;
	margin-left: 40px;
	margin-right: -150px!important;
	padding: 0rem 0rem !important;

}

.top-color {
	border-top: 3px solid #6aab9c;
}

.patientInfo th, .examPatientInfo th, .clinicPatientInfo th {
	font-size: 14px;
	width: 116px;;
}

.patientInfo td, .examPatientInfo td, .clinicPatientInfo td {
	margin-right: 20px;
	margin-bottom: 20px;
	font-size: 14px;
	color: blue;
	width: 285px;
}

.swal2-title {
	font-size: 1.5em;
}
</style>


<div class="row g-3 mb-3 row-deck" id="top"
	style="margin-left: -100px; margin-right: -100px; margin-top: -20px;">

	<!--1열  -->
	<div class="row align-items-center">



		<div
			class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
			<%
			Date currentYear = new Date();
			Date currentMonth = new Date();
			Date currentDay = new Date();
			SimpleDateFormat dateFormatYear = new SimpleDateFormat("yyyy");
			SimpleDateFormat dateFormatMonth = new SimpleDateFormat("MM");
			SimpleDateFormat dateFormatDay = new SimpleDateFormat("dd");
			String formattedYear = dateFormatYear.format(currentYear);
			String formattedMonth = dateFormatMonth.format(currentMonth);
			String formattedDay = dateFormatDay.format(currentDay);

			LocalDate currentDate = LocalDate.now();
			DayOfWeek dayOfWeek = currentDate.getDayOfWeek();
			String formattedDayOfWeek = dayOfWeek.toString();
			String formatDayOfWeek = dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.US);
			%>

			<h6 class="mb-0 fw-bold "
				style="margin-left: 1347px; margin-bottom: 5px !important; margin-top: -33px;">
				<br> <span class="text-primary">DAY &nbsp; </span> <span
					style="color: black"> <%=formattedYear%>&nbsp;- <%=formattedMonth%>&nbsp;-
					<%=formattedDay%> /<%=formatDayOfWeek%>&nbsp;&nbsp;&nbsp;
				</span> <span class="text-primary"
					style="margin-top: -20px !important; margin-bottom: 25px !important;"><i
					class="bi bi-clock fs-5"></i></span> <span class="text-primary">TIME
					&nbsp; </span><span id="timeDisplay" class="mb-0 fw-bold"></span>
			</h6>

		</div>
		<script>
        function updateTime() {
            var timeDisplay = document.getElementById("timeDisplay");
            var currentTime = new Date();
            var formattedTime = currentTime.toLocaleTimeString([], { timeStyle: 'medium', hour12: true });

            timeDisplay.innerHTML = "<span style='color: black;'>" + formattedTime + "</span>";

            setTimeout(updateTime, 1000); // 1초마다 업데이트
        }

        updateTime(); // 초기 호출
    </script>


		<div
			class="card-header no-bg bg-transparent d-flex align-items-center px-0 justify-content-end flex-wrap"
			style="margin-top: -20px">

			<div class="d-flex project-tab flex-wrap w-sm-100">
				<ul
					class="nav nav-tabs tab-body-header rounded ms-3 prtab-set w-sm-100"
					role="tablist" style="border-bottom: none;">

					<li class="nav-item"><a class="nav-link active mb-0 fw-bold"
						data-bs-toggle="tab" href="#list-view" role="tab"
						id="list-viewBtn"
						style="color: white !important; font-size: 16px;">전체조회</a></li>


					<li class="nav-item"><a class="nav-link mb-0 fw-bold"
						data-bs-toggle="tab" href="#grid-view" role="tab"
						id="clinicGrid-viewBtn"
						style="color: white !important; font-size: 16px;">외래조회</a></li>


					<li class="nav-item"><a class="nav-link mb-0 fw-bold"
						data-bs-toggle="tab" href="#grid-view2" role="tab"
						id="examGrid-viewBtn"
						style="color: white !important; font-size: 16px;">검사조회</a></li>


					<li class="nav-item"><a class="nav-link mb-0 fw-bold"
						data-bs-toggle="tab" href="#grid-view3" role="tab"
						id="ttGrid-viewBtn"
						style="color: white !important; font-size: 16px;">TimeTable</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Row end  -->
<!--1열-->

<div class="tab-content"
	style="margin-left: -100px; margin-right: -100px;">
	<!--2열 1탭  -->
	<div class="tab-pane fade show active" id="list-view">
		<div class="row clearfix g-3">
			<!--1탭2열  -->
			<div class="col-lg-4">
				<!--예약조회  -->
				<div class="card  top-color"
					style="margin-right: 5%; height: 120px; margin-top: 25.5px;">

					<div class="card-body">
						<h6 class="mb-0 fw-bold" style="margin-bottom: 10px;">&nbsp;전체예약
							조회</h6>
						<br>
						<form id="allSearchForm" action="rezTimeList.do" method="GET"
							class="row">
							<div class="col">
								<input type="date" id="resveDate" name="resveDate"
									class="form-control"
									style="font-size: 13px !important; width: 150px;" required>
							</div>
							<div class="col">
								<select id="fcltyCode" name="fcltyCode" class="form-select"
									aria-label="진료/검사실 선택"
									style="font-size: 13px !important; width: 150px;" required>
									<option selected value="X">진료과 선택</option>
									<option value="A">호흡기내과</option>
									<option value="B">소화기내과</option>
									<option value="F">내분비내과</option>
									<option value="D">심장내과</option>
									<option value="E">감염내과</option>
									<option value="C">영상의학과</option>
									<option value="G">종합검진센터</option>
									<option value="K">CT실</option>
									<option value="L">MRI실</option>
									<option value="O">임상병리검사실</option>
									<option value="M">초음파실</option>
									<option value="N">내시경실</option>
									<option value="H">일반검사실</option>
								</select>
							</div>
							<div class="col">
								<input type="submit" value="SEARCH"
									class="allSearchBtn btn btn-primary"
									style="margin-left: 5px; margin-right: 3px; font-size: 13px !important;">
								<c:url value='/rez/rezList.do' var="listURL"></c:url>
								<a class="btn btn-danger"
									style="text-align: right; font-size: 13px !important;"
									href="${listURL}">RESET</a>
							</div>
						</form>


					</div>
					<!--body  -->

				</div>
				<!--card  -->
				<!--예약조회  -->



				<div class="card top-color"
					style="margin-right: 5%; margin-top: 3%; height: 598px;">
					<div
						class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0"
						style="margin-left: 10px;">
						<h6 class="mb-0 fw-bold">예약환자 상세조회</h6>
					</div>
					<div class="card-body basic-custome-color"
						style="margin-left: 20px;">
						<div class="table-responsive">

							<table class="table" style="width: 480px;">

								<tbody class="patientInfo">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--col  -->

			<!--1탭1열  -->
			<div class="col-lg-8">
				<div class="card mb-3 top-color" id="overflow"
					style="height: 735px; margin-top: 25px;">
					<div class="card-body" style="height: 400px;">

						<table id="patient-table"
							class="table table-hover align-middle mb-0"
							style="width: 100%; text-align: center; margin-top: 40px !important;">
							<thead>
								<tr>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료일자</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료시간</th>
									<th>&nbsp;&nbsp;성&nbsp;&nbsp;명</th>
									<th>&nbsp;&nbsp;진료과</th>
									<th>&nbsp;&nbsp;&nbsp;담당의</th>
									<th>&nbsp;&nbsp;생년월일</th>
									<th>&nbsp;연락처</th>
									<th>예약변경</th>
								</tr>
							</thead>
							<tbody id="allRezList">
							<c:set var="rezList" value="${rezList }" />
								<c:if test="${empty rezList }">
									<tr>
										<td colspan="9">조회하신 날짜에 예약 환자가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty rezList }">
									<c:forEach items="${rezList }" var="rezList">
										<tr>
										<td>${rezList.convertDate}</td>
											<td>
												<span class="resveTime"data-time="${rezList.fresveTime}"></span>
													<span class="resveEndtime"data-endtime="${rezList.fresveEndtime}"></span>
												${rezList.fresveTime}<span>-</span>${rezList.fresveEndtime}
											</td>
											<td>
												<button class="btn-success rezBtn"
													data-time="${rezList.patntCode}">
													${rezList.patntNm}</button>
											</td>
											<td>${rezList.fcltyNm}</td>
											<td>${rezList.docEmpNm}</td>
											<td>${rezList.birth}</td>
											<td>${rezList.patntTelno}</td>
											<td>
												<button class="btn rezUpdateBtn" style="font-size:16px!important; font-weight: 700!important;"
													data-bs-toggle="modal" data-bs-target="#draggableModal"
													data-rezcode="${rezList.patntCode}"
													value="${rezList.resveNum}"> <span style="color: #FC5A69; text-decoration: underline;"> ${rezList.resveNum}</span></button>
											</td>
											
											
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

					</div>
					<!--cardbody -->
				</div>
				<!--card  -->
			</div>
			<!--col  -->

		</div>
		<!-- Row End -->
	</div>
	<!--tab  -->

	<!--2탭  -->
	<div class="tab-pane fade" id="grid-view">
		<div class="row clearfix g-3">

			<!--2탭1열  -->
			<div class="col-lg-4">
				<!--예약조회  -->
				<div class="card top-color"
					style="margin-right: 5%; height: 120px; margin-top: 25.5px;">

					<div class="card-body">
						<h6 class="mb-0 fw-bold" style="margin-bottom: 10px;">&nbsp;외래예약
							조회</h6>
						<br>
						<form action="rezTimeList.do" method="GET" class="row">
							<div class="col">
								<input type="date" id="clinicResveDate" name="resveDate"
									class="form-control"
									style="font-size: 13px !important; width: 150px;" required>
							</div>
							<div class="col">
								<select id="clinicFcltyCode" name="fcltyCode"
									class="form-select" aria-label="진료과 선택"
									style="font-size: 13px !important; width: 150px;" required>
									<option selected value="X">진료과 선택</option>
									<option value="A">호흡기내과</option>
									<option value="B">소화기내과</option>
									<option value="F">내분비내과</option>
									<option value="D">심장내과</option>
									<option value="E">감염내과</option>
									<option value="C">영상의학과</option>
									<option value="G">종합검진센터</option>
								</select>
							</div>
							<div class="col">
								<input type="submit" value="SEARCH"
									class="clinicSearchBtn btn btn-primary"
									style="margin-left: 5px; margin-right: 3px; font-size: 13px !important;">

								<button id="clicicResetBtn" class="btn btn-danger"
									style="font-size: 13px !important;">RESET</button>
							</div>
						</form>
					</div>
					<!--cardbody  -->
				</div>
				<!--card  -->


				<!--예약조회  -->

				<div class="card top-color"
					style="margin-right: 5%; margin-top: 3%; height: 598px;">
					<div
						class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0"
						style="margin-left: 10px;">

						<h6 class="mb-0 fw-bold">예약환자 상세조회</h6>
					</div>
					<div class="card-body basic-custome-color"
						style="margin-left: 20px;">
						<div class="table-responsive">

							<table class="table" style="width: 480px;">
								<tbody class="clinicPatientInfo">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--col  -->

			<!--2탭1열  -->
			<div class="col-lg-8">
				<div class="card mb-3 top-color"
					style="height: 735px; margin-top: 25px; overflow: auto;">
					<div class="card-body" style="height: 400px;">

						<table id="myProjectTable"
							class="table table-hover align-middle mb-0"
							style="width: 100%; text-align: center;"">
							<thead>
								<tr>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료일자</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료시간</th>
									<th>&nbsp;&nbsp;성&nbsp;&nbsp;명</th>
									<th>&nbsp;&nbsp;진료과</th>
									<th>&nbsp;&nbsp;&nbsp;담당의</th>
									<th>&nbsp;&nbsp;생년월일</th>
									<th>&nbsp;연락처</th>
									<th>예약변경</th>
								</tr>
							</thead>
							<tbody id="clinicRezList">
							</tbody>
						</table>
					</div>
					<!--cardbody -->
				</div>
				<!--card  -->
			</div>
			<!--col  -->

		</div>
		<!-- Row End -->
	</div>
	<!--2tab  -->

	<!--2탭  -->
	<div class="tab-pane fade" id="grid-view2">
		<div class="row clearfix g-3">

			<!--1탭1열  -->
			<div class="col-lg-4">
				<!--예약조회  -->
				<div class="card  top-color"
					style="margin-right: 5%; height: 120px; margin-top: 25.5px;">

					<div class="card-body">
						<h6 class="mb-0 fw-bold" style="margin-bottom: 10px;">&nbsp;검사예약
							조회</h6>
						<br>
						<form action="rezTimeList.do" method="GET" class="row">
							<div class="col">
								<input type="date" id="examResveDate" name="resveDate"
									class="form-control"
									style="font-size: 13px !important; width: 150px;"
									required="required">
							</div>
							<div class="col">
								<select id="examFcltyCode" name="fcltyCode" class="form-select"
									aria-label="검사실 선택"
									style="font-size: 13px !important; width: 150px;"
									required="required">
									<option selected value="X">검사실 선택</option>
									<option value="K">CT실</option>
									<option value="L">MRI실</option>
									<option value="O">임상병리검사실</option>
									<option value="M">초음파실</option>
									<option value="N">내시경실</option>
									<option value="H">일반검사실</option>
								</select>
							</div>
							<div class="col">
								<input type="submit" value="SEARCH"
									class="examSearchBtn btn btn-primary"
									style="margin-left: 5px; margin-right: 3px; font-size: 13px !important;">
								<c:url value='/rez/examRezList.do' var="listURL"></c:url>
								<button id="rezExamResetBtn" class="btn btn-danger"
									style="font-size: 13px !important;">RESET</button>
							</div>
						</form>
					</div>
					<!--cardbody  -->
				</div>
				<!--card  -->


				<!--예약조회  -->

				<div class="card top-color"
					style="margin-right: 5%; margin-top: 3%; height: 598px;">
					<div
						class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0"
						style="margin-left: 10px;">
						<h6 class="mb-0 fw-bold">예약환자 상세조회</h6>
					</div>
					<div class="card-body basic-custome-color"
						style="margin-left: 20px;">
						<div class="table-responsive">

							<table class="table" style="width: 480px;">

								<tbody class="examPatientInfo">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--col  -->

			<!--2탭2열  -->
			<div class="col-lg-8">
				<div class="card mb-3 top-color"
					style="height: 735px; margin-top: 25px;" id="overflow3">
					<div class="card-body" style="height: 400px;">

						<table id="myProjectTable2"
							class="table table-hover align-middle mb-0"
							style="width: 100%; text-align: center;">
							<thead>
								<tr>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료일자</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;진료시간</th>
									<th>&nbsp;&nbsp;성&nbsp;&nbsp;명</th>
									<th>&nbsp;&nbsp;진료과</th>
									<th>&nbsp;&nbsp;&nbsp;담당의</th>
									<th>&nbsp;&nbsp;생년월일</th>
									<th>&nbsp;연락처</th>
									<th>예약변경</th>
								</tr>
							</thead>
							<tbody id="examRezList">

							</tbody>
						</table>

					</div>
					<!--cardbody -->
				</div>
				<!--card  -->
			</div>
			<!--col  -->

		</div>
		<!-- Row End -->
	</div>
	<!--2tab  -->



	<!--4탭시작  -->
	<div class="tab-pane fade" id="grid-view3">
		<div class="body d-flex py-lg-3 py-md-2">

			<div class="row align-items-center">
				<div class="border-0 mb-4">

					<ul class="nav nav-tabs" id="subTabs" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active mb-0 fw-bold"
								id="tab1-tab clinicTimeTab" data-bs-toggle="tab"
								data-bs-target="#tab1" type="button" role="tab"
								aria-controls="tab1" aria-selected="true">진료과</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link mb-0 fw-bold" id="tab2-tab examTimeTab"
								data-bs-toggle="tab" data-bs-target="#tab2" type="button"
								role="tab" aria-controls="tab2" aria-selected="false">검사실</button>
						</li>
					</ul>
				</div>


			</div>
			<!-- Row end  -->


			<!--4-1 탭 start  -->


			<div class="tab-content">
				<div class="tab-pane fade show active" id="tab1" role="tabpanel"
					aria-labelledby="tab1-tab">

					<div class="row clearfix g-3">
						<div class="col-sm-12">
							<div class="card mb-3 top-color">

								<!--진료과 timeTable 날짜 검색  -->
								<div class="card-body"
									style="width: 746px; margin-bottom: -20px; margin-left: 30px;">
									<div class="col d-flex align-items-center">
										<!-- 추가된 d-flex와 align-items-center -->
										<input type="date" id="clinicTTResveDate" name="resveDate"
											class="form-control"
											style="font-size: 13px !important; width: 150px;" required>
										<button id="clinicTTBtn" class="btn btn-primary"
											style="margin-left: 13px; margin-right: 8px; font-size: 13px !important;">SEARCH</button>

										<button id="clinicResetBtn" class="ttBtn btn btn-danger"
											style="font-size: 13px !important;">TODAY</button>


									</div>
								</div>
								<!--진료과 timeTable 날짜 검색  -->

								<div class="card-body" id="overflow2">
									<div class="schedule" id="clinic">

										<div class="schedule_header">
											<span class="dl">Time</span> <span class="ds">Ti</span>
										</div>

										<!-- week-->
										<div class="schedule_header schedule-sunday">
											<span class="dl">호흡기내과</span> <span class="ds">Su</span>
										</div>
										<div class="schedule_header schedule-monday">
											<span class="dl">소화기내과</span> <span class="ds">M</span>
										</div>
										<div class="schedule_header schedule-tuesday">
											<span class="dl">내분비내과</span> <span class="ds">T</span>
										</div>
										<div class="schedule_header schedule-wednesday">
											<span class="dl">심장내과</span> <span class="ds">W</span>
										</div>
										<div class="schedule_header schedule-thursday">
											<span class="dl">감염내과</span> <span class="ds">Th</span>
										</div>
										<div class="schedule_header schedule-friday">
											<span class="dl">영상의학과</span> <span class="ds">F</span>
										</div>
										<div class="schedule_header schedule-saturday">
											<span class="dl">종합검진센터</span> <span class="ds">Sa</span>
										</div>

										<!-- Time-->

										<div class="schedule_time time-from-seven">07:00 AM</div>
										<div class="schedule_time time-from-eight">08:00 AM</div>
										<div class="schedule_time time-from-nine">09:00 AM</div>
										<div class="schedule_time time-from-ten">10:00 AM</div>

										<div class="schedule_time time-from-eleven">11:00 AM</div>
										<div class="schedule_time time-from-twelve">12:00 PM</div>
										<div class="schedule_time time-from-lunch">13:00 PM</div>
										<div class="schedule_time time-from-fourteen">14:00 PM</div>

										<div class="schedule_time time-from-fifteen">15:00 PM</div>
										<div class="schedule_time time-from-sixteen">16:00 PM</div>
										<div class="schedule_time time-from-seventeen">17:00 PM</div>
										<div class="schedule_time time-from-eightteen">18:00 PM</div>
										<!-- Time-->

										<!--  Grid Rows-->

										<div
											class="grid time-from-seven time-to-eight schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-eight time-to-nine schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-nine time-to-ten schedule-row-from-sunday schedule-row-to-saturday"></div>

										<div
											class="grid time-from-ten time-to-eleven schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-eleven time-to-twelve schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-twelve time-to-lunch schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-lunch time-to-fourteen schedule-row-from-sunday schedule-row-to-saturday"></div>

										<div
											class="grid time-from-fourteen time-to-fifteen schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-fifteen time-to-sixteen schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-sixteen time-to-seventeen schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid time-from-seventeen time-to-eightteen schedule-row-from-sunday schedule-row-to-saturday"></div>
										<div
											class="grid grid-last time-from-eightteen time-to-eightteen schedule-row-from-sunday schedule-row-to-saturday"></div>

										<!--   ./Grid Rows-->



										<div
											class="grid schedule-sunday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-sunday time-from-eightteen time-to-eightteen"></div>
										<div
											class="grid schedule-monday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-monday time-from-eightteen time-to-eightteen"></div>

										<div
											class="grid schedule-tuesday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-tuesday time-from-eightteen time-to-eightteen"></div>

										<div
											class="grid schedule-wednesday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-wednesday time-from-eightteen time-to-eightteen"></div>

										<div
											class="grid schedule-thursday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-thursday time-from-eightteen time-to-eightteen"></div>

										<div
											class="grid schedule-friday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-friday time-from-eightteen time-to-eightteen"></div>

										<div
											class="grid schedule-saturday time-from-seven time-to-eightteen"></div>
										<div
											class="grid grid-last schedule-saturday time-from-eightteen time-to-eightteen"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Row End -->
				</div>
			</div>
			<!--시간표 끝  -->

		</div>
		<!--3-1SHOW TAB END  -->


		<div class="tab-pane fade" id="tab2" role="tabpanel"
			aria-labelledby="tab2-tab">
			<!-- Tab 2 내용 -->

			<div class="row clearfix g-3">
				<div class="col-sm-12">
					<div class="card mb-3">
						<!--검사실 timeTable 날짜 검색  -->
						<div class="card-body"
							style="width: 400px; margin-bottom: -20px; margin-left: 30px;">
							<div class="col d-flex align-items-center">
								<!-- 추가된 d-flex와 align-items-center -->
								<input type="date" id="examTTResveDate" name="resveDate"
									class="form-control"
									style="font-size: 13px !important; width: 150px;" required>
								<button id="examTTBtn" class="btn btn-primary"
									style="margin-left: 13px; margin-right: 8px; font-size: 13px !important;">SEARCH</button>
								<button id="examResetBtn" class="ttBtn btn btn-danger"
									style="font-size: 13px !important;">TODAY</button>
							</div>
						</div>
						<!--검사실 timeTable 날짜 검색  -->
						<div class="card-body overflow-auto">
							<div class="schedule" id="exam">

								<div class="schedule_header">
									<span class="dl">Time</span> <span class="ds">Ti</span>
								</div>

								<!-- week-->
								<div class="schedule_header schedule-sunday">
									<span class="dl">CT실</span> <span class="ds">Su</span>
								</div>
								<div class="schedule_header schedule-monday">
									<span class="dl">MRI실</span> <span class="ds">M</span>
								</div>
								<div class="schedule_header schedule-tuesday">
									<span class="dl">임상병리검사실</span> <span class="ds">T</span>
								</div>
								<div class="schedule_header schedule-wednesday">
									<span class="dl">초음파실</span> <span class="ds">W</span>
								</div>
								<div class="schedule_header schedule-thursday">
									<span class="dl">내시경실</span> <span class="ds">Th</span>
								</div>
								<div class="schedule_header schedule-friday">
									<span class="dl">일반검사실</span> <span class="ds">F</span>
								</div>
								<div class="schedule_header schedule-saturday">
									<span class="dl">비고</span> <span class="ds">Sa</span>
								</div>

								<!-- Time-->

								<div class="schedule_time time-from-seven">07:00 AM</div>
								<div class="schedule_time time-from-eight">08:00 AM</div>
								<div class="schedule_time time-from-nine">09:00 AM</div>
								<div class="schedule_time time-from-ten">10:00 AM</div>

								<div class="schedule_time time-from-eleven">11:00 AM</div>
								<div class="schedule_time time-from-twelve">12:00 PM</div>
								<div class="schedule_time time-from-lunch">13:00 PM</div>
								<div class="schedule_time time-from-fourteen">14:00 PM</div>

								<div class="schedule_time time-from-fifteen">15:00 PM</div>
								<div class="schedule_time time-from-sixteen">16:00 PM</div>
								<div class="schedule_time time-from-seventeen">17:00 PM</div>
								<div class="schedule_time time-from-eightteen">18:00 PM</div>
								<!-- Time-->

								<!--  Grid Rows-->

								<div
									class="grid time-from-seven time-to-eight schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-eight time-to-nine schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-nine time-to-ten schedule-row-from-sunday schedule-row-to-saturday"></div>

								<div
									class="grid time-from-ten time-to-eleven schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-eleven time-to-twelve schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-twelve time-to-lunch schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-lunch time-to-fourteen schedule-row-from-sunday schedule-row-to-saturday"></div>

								<div
									class="grid time-from-fourteen time-to-fifteen schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-fifteen time-to-sixteen schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-sixteen time-to-seventeen schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid time-from-seventeen time-to-eightteen schedule-row-from-sunday schedule-row-to-saturday"></div>
								<div
									class="grid grid-last time-from-eightteen time-to-eightteen schedule-row-from-sunday schedule-row-to-saturday"></div>

								<!--   ./Grid Rows-->



								<div
									class="grid schedule-sunday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-sunday time-from-eightteen time-to-eightteen"></div>
								<div
									class="grid schedule-monday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-monday time-from-eightteen time-to-eightteen"></div>

								<div
									class="grid schedule-tuesday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-tuesday time-from-eightteen time-to-eightteen"></div>

								<div
									class="grid schedule-wednesday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-wednesday time-from-eightteen time-to-eightteen"></div>

								<div
									class="grid schedule-thursday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-thursday time-from-eightteen time-to-eightteen"></div>

								<div
									class="grid schedule-friday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-friday time-from-eightteen time-to-eightteen"></div>

								<div
									class="grid schedule-saturday time-from-seven time-to-eightteen"></div>
								<div
									class="grid grid-last schedule-saturday time-from-eightteen time-to-eightteen"></div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- clearfix Row End -->
		</div>
		<!--3-1,2탭 종료-->
	</div>
	<!--BODY  -->
</div>


<!-- 전체조회 예약변경 모달-->
<div class="modal fade" id="draggableModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-right modal-xl">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title  fw-bold" id="depaddLabel">예약취소·변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<div class="mb-3">
					<div id="rezInfoDiv"></div>
					<button type="button" class="btn btn-danger rezDeleteBtn"
						data-bs-dismiss="modal"
						style="margin-left: 280px; margin-top: 15px;">예약취소</button>
				</div>
				<!-- mb-3 -->



				<div class="deadline-form">
					<div class="row g-3 mb-3">
						<div class="col-sm-12">
							<h5 class="modal-title  fw-bold" id="depaddLabel" style="margin-bottom: 20px;">예약변경</h5>
							<form id="rezUpdateForm">
								<label for="deptwo145" class="form-label">변경일자</label> <input
									type="date" class="form-control" id="uresveDate"
									name="resveDate" value="" />
						</div>
						<!-- col -->
						<label class="form-label rezUpdateLabel">예약시간</label> <select
							class="form-select" name="resveTime" id="uresveTime"
							aria-label="Default select example">
							<option selected>시간선택</option>

							<option value="0700" data-endtime="0800">07:00</option>
							<option value="0800" data-endtime="0900">08:00</option>
							<option value="0900" data-endtime="1000">09:00</option>
							<option value="1000" data-endtime="1100">10:00</option>
							<option value="1100" data-endtime="1200">11:00</option>
							<option value="1200" data-endtime="1300">12:00</option>
							<option value="1300" data-endtime="1400">13:00</option>
							<option value="1400" data-endtime="1500">14:00</option>
							<option value="1500" data-endtime="1600">15:00</option>
							<option value="1600" data-endtime="1700">16:00</option>
							<option value="1700" data-endtime="1800">17:00</option>
							<option value="1800" data-endtime="1900">18:00</option>
						</select>
					</div>
					<!-- row -->

					<div class="row g-3 mb-3">
						<div class="col-md-12">
							<label class="form-label rezUpdateLabel">진료과</label> <select
								id="ufcltyCode" name="fcltyCode" class="form-select"
								aria-label="Default select example">
								<option selected value="X">진료과 선택</option>
								<option value="A">(진료)호흡기내과</option>
								<option value="B">(진료)소화기내과</option>
								<option value="F">(진료)내분비내과</option>
								<option value="D">(진료)심장내과</option>
								<option value="E">(진료)감염내과</option>
								<option value="C">(진료/검사)영상의학과</option>
								<option value="G">(진료/검사)종합검진센터</option>
								<option value="K">(검사)CT실</option>
								<option value="L">(검사)MRI실</option>
								<option value="O">(검사)임상병리검사실</option>
								<option value="M">(검사)초음파실</option>
								<option value="N">(검사)내시경실</option>
								<option value="H">(검사)일반검사실</option>
							</select>
						</div>
						<!-- col -->
					</div>
					<!-- <div class="deadline-form"> -->
					<button type="button" class="btn btn-primary rezModifyBtn"
						style="margin-left: 280px;">예약변경</button>
					</form>
				</div>
			</div>
			<!-- modal body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary rezUpdateCloseBtn" id="rezUpdateCloseBtn"
					data-bs-dismiss="modal" style="margin-right: 25px;">닫기</button>
			</div>
			<!-- modal footer -->
		</div>
		<!-- modal content -->
	</div>
	<!-- modalDialog -->
</div>
<!-- modal end -->






<!-- Plugin Js-->
<script
	src="<%=request.getContextPath()%>/resources/dist/assets/bundles/dataTables.bundle.js"></script>


<!-- jQuery UI (드래그 기능을 사용하기 위해 포함) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script>
	$(document).ready(function() { /* noTouch */


		//예약변경일자 내일일자부터 선택 가능하도록 설정
		var now_utc = Date.now(); // 현재 날짜 밀리초
		var timeOff = new Date().getTimezoneOffset() * 60000; // 분 단위를 밀리초로 변환
		var today = new Date(now_utc - timeOff); // 오늘 날짜를 얻습니다.

		// "오늘" 날짜를 포함하지 않도록 다음 날짜를 계산
		var tomorrow = new Date(today);
/* 		tomorrow.setDate(today.getDate() + 1);
 */		tomorrow.setDate(today.getDate());
		// tomorrow를 ISO 문자열로 변환하고 "T"를 기준으로 나눕니다.
		var tomorrowISOString = tomorrow.toISOString().split("T")[0];
		document.getElementById("uresveDate").setAttribute("min", tomorrowISOString);
		

		//전체조회페이지에서 검색버튼 클릭시 날짜/진료과 미선택 시 알림창
		$(document).on("click", ".allSearchBtn", function() {
			var selectedDate = $("#resveDate").val(); // 선택된 날짜 가져오기 (YYYY-MM-DD 형식)
			var selectedFcltyCode = $("#fcltyCode").val(); // 선택된 진료과
			
			console.log("selectedFcltyCode",selectedFcltyCode);
			if(selectedFcltyCode==="X") {
				Swal.fire({
					  text: "진료과를 선택하세요",
					  confirmButtonText: "확인"
					});
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
			if(selectedDate==="") {
				Swal.fire('조회날짜를 선택하세요.');
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
		});
		
	    var thisResveNum='';
	    var thisPatntCode='';
	    var thisResveDate='';
   
	    
	    
		//예약번호 클릭 시 예약변경/취소 모달창에 기존 예약정보 출력
		$(document).on("click", ".rezUpdateBtn", function() {
			$("#rezInfoDiv").empty;
			
			 var patntCode;
			    
			    // 만약 $(this).data("rezcode") 값이 존재한다면 해당 값을 사용
			    if ($(this).data("rezcode")) {
			        patntCode = $(this).data("rezcode");
			    }
			    // 그렇지 않으면 $(this).data("patntcode") 값을 사용
			    else if ($(this).data("patntcode")) {
			        patntCode = $(this).data("patntcode");
			    }
			
			
			/* var patntCode = $(this).data("rezcode"); */
			var resveNum = $(this).attr("value"); // 선택된 진료과
			thisResveNum = resveNum;
			thisPatntCode = patntCode;
	
			$.getJSON("<c:url value='/rez/selectRez.do' />",{resveNum : resveNum}).done(function(resp) {
				var rez = resp;
				var patntNm = resp.patntNm;
				var fcltyNm = resp.fcltyNm;
				var fresveDate = resp.fresveDate;
				var fresveTime = resp.fresveTime;
				var info = "<div class='card'><div class='card-body'>"+patntNm+"님" +"<br>(예약일시)  " +fresveDate+", "+fresveTime+"<br>(진료과)  "+fcltyNm+"</div></div>";
				if(resp===null){
					Toast.fire({
		    		    icon: 'error',
		    		    title: '선택한 예약번호의 정보가 없습니다.'
		    		});
	        	}else{
	        		//모달창에 환자 정보 뿌리기
	        		$("#rezInfoDiv").html(info);
	        	}
		
	});/*getJson  */
});/*docu  */






		//예약 취소/변경 모달창에서 예약 취소하기
	$(document).on("click", ".rezDeleteBtn", function() {
			
			Swal.fire({
				   text:'예약을 삭제하시겠습니까?',
				   icon: 'warning',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				   
				   
				}).then(result => { 
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			
			 var resveNum = thisResveNum;
			 const data = {
	                    resveNum: resveNum,
	                };
			
			  var viewURL = "<c:url value='/rez/deleteRez.do' />";
			      viewURL += "?resveNum=" + resveNum;

		    $.ajax({
		        url: viewURL,
		        type: "POST",
		        contentType: "application/json",
                data: JSON.stringify(data), 
                dataType: "json", 
		        success: function(resp) {
		        	var resp = resp;
		        	var resveDate=resp.result;
		        	 
		        	if(resp.result!=="fail"){
		        	
		        	Toast.fire({
		    		    icon: 'success',
		    		    title: '예약이 취소되었습니다.'
		    		 });
		        	location.reload();
		        	/* allRezListLoad();//1번째탭 전체조회 리로드 */
		        	loadClinicTimeTable(defaultResveDate);//4번째탭 진료실 시간표 리로드
		        	
		        	   var info="예약정보가 없습니다."
			 			$("#rezInfoDiv").empty();
				        $("#rezInfoDiv").text(info);
		        	}
		        }
		    }); /*ajax  */
		  
	     }/*if  */
	 });/* swal */
	
});


	 
	/* 예약 수정 */
	$(document).on("click", ".rezModifyBtn", function() {
		
	   $('#draggableModal').modal('hide'); // 모달을 닫음
	   
	 
		
        Swal.fire({
            text: '선택하신 일정으로 예약을 변경하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '변경',
            cancelButtonText: '취소',
        }).then(result => {
        	
        	
        	
         if (result.isConfirmed) {
                // "변경" 버튼을 눌렀을 때 실행됩니다.
                
   
		
	    const rezUpdateForm = $("#rezUpdateForm");
	    const selectedOption = $("select[name='resveTime'] option:selected");

	    $("#deadline-form :input[name]").each(function (idx, input) {
	        let name = input.name; // 하나의 input 태그의 name 속성
	        let value = $(input).val();
	        $(rezUpdateForm).find(`[name="${name}"]`).val(value);
	    });

	    const resveDate = $("input[name='resveDate']").val();
	    const resveTime = $("input[name='resveTime']").val();
	    const fcltyCode = $("input[name='fcltyCode']").val();
	    const resveEndtime = selectedOption.data("endtime"); // 0800
	    const resveNum = thisResveNum; // RSVT143
	    const patntCode = thisPatntCode; // RSVT143

	    const data = {
	                    resveDate: $("#uresveDate").val(),
	                    resveTime: $("#uresveTime").val(),
	                    fcltyCode: $("#ufcltyCode").val(),
	                    resveNum: resveNum,
	                    resveEndtime: resveEndtime,
	                    patntCode: patntCode
	                };
	              

	                var viewURL = "<c:url value='updateRez.do' />";

	                $.ajax({
	                    type: "POST",
	                    url: viewURL,
	                    contentType: "application/json",
	                    data: JSON.stringify(data), 
	                    dataType: "json", 
	                    success: function (resp) {
	                    	 
	                    	 if (resp.result === "success") {
	                            // 성공적으로 업데이트된 경우 처리
	                            Toast.fire({
	                                icon: 'success',
	                                title: '예약을 변경하였습니다.'
	                            });
	                            
	                          
	                           /*  allRezListLoad();//1번째탭 전체조회 리로드 */
	            	        	loadClinicTimeTable(defaultResveDate);//4번째탭 진료실 시간표 리로드
	            	        	loadExamTimeTable(defaultResveDate);//4번째탭 검사실 시간표 리로드
	                          
	                        } else if(resp.result === "duplication"){
	                        	
	                        	 Toast.fire({
		                                icon: 'error',
		                                title: '기존예약 일정과 동일합니다. 다시 확인 후 시도해주세요'
		                            });
	                        	
	                        } else {
	                        	
	                        	 Toast.fire({
		                                icon: 'error',
		                                title: '예약이 마감된 일정입니다. 다른 일정을 선택해주세요'
		                            });
	                        }
	                    	 
	                    }/*resp  */
	               });/* ajax */
	               $("#rezInfoDiv").empty;
	                // HTML에서 버튼 요소를 선택
	     	       var button = document.getElementById('rezUpdateCloseBtn'); // 
	     	       // 클릭 이벤트를 강제로 발생시킴
	     	       button.click();
               	
                 
	             }/*if */
	       });/*swal  */
      
      
	});/*함수  */
	

		//두번째탭 외래예약조회 페이지에서 검색버튼 클릭시 날짜/진료과 미선택 시 알림창
		$(document).on("click", ".clinicSearchBtn", function() {
			var selectedDate = $("#clinicResveDate").val(); // 선택된 날짜 가져오기 (YYYY-MM-DD 형식)
			var selectedFcltyCode = $("#clinicFcltyCode").val(); // 선택된 진료과
			if(selectedFcltyCode==="X") {
				Swal.fire('진료과를 선택하세요');
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
			if(selectedDate==="") {
				Swal.fire('조회날짜를 선택하세요');
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
		});/*함수  */
	

		//세번째탭 검사예약조회 페이지에서 검색버튼 클릭시 날짜/진료과 미선택 시 알림창
		$(document).on("click", ".examSearchBtn", function() {
			var selectedDate = $("#examResveDate").val(); // 선택된 날짜 가져오기 (YYYY-MM-DD 형식)
			var selectedFcltyCode = $("#examFcltyCode").val(); // 선택된 진료과
			if(selectedFcltyCode==="X") {
				Swal.fire('검사실을 선택하세요');
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
			if(selectedDate==="") {
				Swal.fire('조회날짜를 선택하세요');
				 event.preventDefault(); // 폼 제출 막기
			        return; // 중단
			}
			
		});
		
		
	
		
defautltPatntSearchView();

// (첫번째탭) 전체조회탭에서 환자선택시 환자예약 상세조회 테이블 기본값
function defautltPatntSearchView() {
		    var tbody = $(".patientInfo");
		    var info = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "];

		    var rows = [
		        $("<tr>").append(
		            $("<th>").html("성명"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("식별코드"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("주민번호"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("연락처"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("이메일"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("주소"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("최초등록일"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("다음진료일"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("담당과"),
		            $("<td>").html(info[1])
		        ),
		        $("<tr>").append(
		            $("<th>").html("신장/체중"),
		            $("<td>").html(info[1])
		        )
		    ];

		    rows.forEach(function (row) {
		        tbody.append(row);
		    });

		    isInitialExecution = false; // 최초 실행 이후로 표시를 변경
		}
				
	
	
function defautltPatntSearchView1(tbody, info) {
    var rows = [
        $("<tr>").append(
            $("<th>").html("성명"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("식별코드"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주민번호"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("연락처"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("이메일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주소"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("최초등록일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("다음진료일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("담당과"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("신장/체중"),
            $("<td>").html(info[1])
        )
    ];

    rows.forEach(function (row) {
        tbody.append(row);
    });
}				
		
//(첫번째탭) 전체조회탭에서 환자선택시 환자예약 상세조회 테이블 기본값
function defautltPatntSearchView2(tbody, info) {
    var rows = [
        $("<tr>").append(
            $("<th>").html("성명"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("식별코드"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주민번호"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("연락처"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("이메일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주소"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("최초등록일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("다음진료일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("담당과"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("신장/체중"),
            $("<td>").html(info[1])
        )
    ];

    rows.forEach(function (row) {
        tbody.append(row);
    });
}
		//(첫번째탭) 전체조회탭에서 환자선택시 환자예약 상세조회 테이블 기본값
		
// (첫번째탭) 전체조회탭에서 환자선택시 환자예약 상세조회 테이블 기본값
function defautltPatntSearchView3(tbody, info) {
    var rows = [
        $("<tr>").append(
            $("<th>").html("성명"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("식별코드"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주민번호"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("연락처"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("이메일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("주소"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("최초등록일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("다음진료일"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("담당과"),
            $("<td>").html(info[1])
        ),
        $("<tr>").append(
            $("<th>").html("신장/체중"),
            $("<td>").html(info[1])
        )
    ];

    rows.forEach(function (row) {
        tbody.append(row);
    });
}
		//(첫번째탭) 전체조회탭에서 환자선택시 환자예약 상세조회 테이블 기본값
		
		
		//(첫번째탭) 전체조회탭에서 환자선택시 상세조회 테이블
		$(document).on("click", ".rezBtn", function() {

			var patntCode = $(this).data("time");
			console.log(patntCode);

			$.getJSON("<c:url value='/rez/rezPatntInfo.do' />", {patntCode : patntCode}).done(function(resp) {

				console.log(resp);
				var info = resp[0];
				var tbody = $(".patientInfo");
				tbody.empty();
				
				patntSearchView(tbody, info);
				
			}); /*getJson  */

		});/*documentClick  */
		
/*첫번째탭 환자상세정보검색 end  */
		

//(첫번째탭) 전체 진료 전체예약리스트 리로드

function allRezListLoad() {

	$.getJSON("<c:url value='/rez/allRezList.do' />").done(function(resp) {
		

		var info = resp;
		var tbody = $("#allRezList");
		tbody.empty();
		
		
		if (resp.length > 0) {
			
			$(resp).each(function(idx, info) {
             // info.resveTime을 네 자리 문자열로 받아서 시간 형식으로 변경
             			
			let tr = $("<tr>").append(
					$("<td>").html(info.convertDate),
				    $("<td>").html(info.fresveTime+"-"+info.fresveEndtime),
					$("<td>").html(
							$("<button class='btn-success rezBtn'></button>").attr("data-time",info.patntCode)
							.text(info.patntNm).click(
							function() {
							var patntCode = $(this).data("time");
							})),
 					$("<td>").html(info.fcltyNm),
					$("<td>").html(info.docEmpNm),
					$("<td>").html(info.birth),
					$("<td>").html(info.patntTelno),
					$("<td>").html(
								    $("<button class='btn rezUpdateBtn' style='font-size:16px!important; font-weight: 700!important;' data-bs-toggle='modal' data-bs-target='#draggableModal'></button>")
								        .attr("data-rezcode", info.patntCode)
								        .html("<span style='color: #FC5A69; text-decoration: underline;'>" + info.resveNum + "</span>")
								        .click(function() {
								            var patntCode = $(this).data("time");
								        }))
					);
					
					tbody.append(tr);
											
			});/*$(resp).each(function(idx, info)  */
					
	} else {
		tbody.append($("<tr>").html(
		$("<td colspan='9'>").html("예약 정보가 존재하지 않습니다.")));
						
	       }
					
	}); /*getJson  */

}

//(첫번째탭) 전체 진료 전체예약리스트 리로드


		

//(두번째탭) 외래진료 전체예약리스트 조회 
	$.getJSON("<c:url value='/rez/clinicRezList.do' />").done(function(resp) {
		console.log(resp);

		var info = resp;
		var tbody = $("#clinicRezList");
		tbody.empty();
		
		
		if (resp.length > 0) {
			
			$(resp).each(function(idx, info) {
             // info.resveTime을 네 자리 문자열로 받아서 시간 형식으로 변경
													
			let tr = $("<tr>").append(
					$("<td>").html(info.convertDate),
				    $("<td>").html(info.fresveTime+"-"+info.fresveEndtime),
					$("<td>").html(
							$("<button class='btn-success clinicRezBtn'></button>").attr("data-pcode",info.patntCode)
							.text(info.patntNm).click(
							function() {
							var patntCode = $(this).data("pcode");
							})),
 					$("<td>").html(info.fcltyNm),
					$("<td>").html(info.docEmpNm),
					$("<td>").html(info.birth),
					$("<td>").html(info.patntTelno),
					$("<td>").html(
							$("<button class='btn rezUpdateBtn' style='font-size:16px!important; font-weight: 700!important;' data-bs-toggle='modal' data-bs-target='#draggableModal'></button>")
					        .attr("data-rezcode", info.patntCode)
					        .html("<span style='color: #FC5A69; text-decoration: underline;'>" + info.resveNum + "</span>")
					        .click(function() {
					            var patntCode = $(this).data("time");
					        }))
			);
					
					tbody.append(tr);
											
			});/*$(resp).each(function(idx, info)  */
					
	} else {
		tbody.append($("<tr>").html(
		$("<td colspan='9'>").html("외래진료 예약 정보가 존재하지 않습니다.")));
						
	       }
					
	}); /*getJson  */
	
/*2번째 외래진료 목록 가져오기 end  */
	
	
	
// (세번째탭) 검사실 전체예약리스트 조회
$.getJSON("<c:url value='/rez/examRezList.do' />").done(function(resp) {
    console.log(resp);

    var info = resp;
    var tbody = $("#examRezList");
    tbody.empty();

    if (resp.length > 0) {
        $(resp).each(function(idx, info) {
            let tr = $("<tr>")
                .append(
                	$("<td>").html(info.convertDate),
                    $("<td>").html(info.fresveTime + "-" + info.fresveEndtime),
                    $("<td>").html(
                        $("<button class='btn-success examRezBtn'></button>")
                            .attr("data-ecode", info.patntCode)
                            .text(info.patntNm)
                            .click(function() {
                                var patntCode = $(this).data("ecode");
                            })
                    ),
                    $("<td>").html(info.fcltyNm),
                    $("<td>").html(info.docEmpNm),
                    $("<td>").html(info.birth),
                    $("<td>").html(info.patntTelno),
                    $("<td>").html(
                    		$("<button class='btn rezUpdateBtn' style='font-size:16px!important; font-weight: 700!important;' data-bs-toggle='modal' data-bs-target='#draggableModal'></button>")
					        .attr("data-rezcode", info.patntCode)
					        .html("<span style='color: #FC5A69; text-decoration: underline;'>" + info.resveNum + "</span>")
					        .click(function() {
					            var patntCode = $(this).data("time");
					        }))
                   
                );
            tbody.append(tr);
        });
    } else {
        tbody.append(
            $("<tr>").html(
                $("<td colspan='9'>").html("검사 예약 정보가 존재하지 않습니다.")
            )
        );
    }
}); /* getJson */

/* 3번째 탭 검사 예약 조회 탭 종료 */
	
	
	
	
	
	
	
	
	
	
	//2번째 탭 진료과 환자선택시 상세조회 테이블
	$(document).on("click",".clinicRezBtn", function() {
		var patntCode = $(this).data("pcode");
	    console.log(patntCode);

		$.getJSON("<c:url value='/rez/rezPatntInfo.do' />",{patntCode : patntCode}).done(function(resp) {
					console.log(resp);
				
					var info = resp[0];
					var tbody = $(".clinicPatientInfo");
					
					tbody.empty();
					patntSearchView(tbody, info);
					

			
						}); /*getJson  */

					});/*documentClick  */
					
			/*두번째탭 환자상세정보검색 end  */
		

// 검사예약조회에서 환자 검색
	$(document).on("click",".examRezBtn",function() {
			var patntCode = $(this).data("ecode");

			console.log(patntCode);

		$.getJSON("<c:url value='/rez/rezPatntInfo.do' />",{patntCode : patntCode}).done(function(resp) {
						var info = resp[0];
						var tbody = $(".examPatientInfo");

						tbody.empty();
						patntSearchView(tbody, info);
	});/*getJson  */
	
});/*docu  */
	

		//오늘 날짜 가져오기
		var today = new Date();
		var year = today.getFullYear();
		var month = String(today.getMonth() + 1).padStart(2, '0');
		var day = String(today.getDate()).padStart(2, '0');

		let defaultResveDate = year + '-' + month + '-' + day;
		console.log("defaultResveDate:", defaultResveDate);
		loadClinicTimeTable(defaultResveDate);
		loadExamTimeTable(defaultResveDate);

		//진료과 시간표 리셋
		$("#clinicResetBtn").on("click", function() {
			loadClinicTimeTable(defaultResveDate);

		});

		//검사실 시간표 리셋
		$("#examResetBtn").on("click", function() {
			loadExamTimeTable(defaultResveDate);

		});
			
		//전체예약조회 탭 클릭시 환자정보 테이블 초기화
		$("#list-viewBtn").on("click", function() {
			var tbody = $(".patientInfo");
			tbody.empty();
 			var info = [" ", " "," "," "," "," "," "," "," "," "," ",];
			defautltPatntSearchView1(tbody, info);
			
			

		});
		
		//진료과예약조회 탭 클릭시 환자정보 테이블 초기화
		$("#clinicGrid-viewBtn").on("click", function() {
		 	var tbody = $(".clinicPatientInfo");
			tbody.empty();
			var info = [" ", " "," "," "," "," "," "," "," "," "," ",];
			defautltPatntSearchView2(tbody, info); 
			

		});
		//검사실 예약조회 탭 클릭시 환자정보 테이블 초기화
		$("#examGrid-viewBtn").on("click", function() {
			var tbody = $(".examPatientInfo");
			tbody.empty();
			var info = [" ", " "," "," "," "," "," "," "," "," "," ",];
			defautltPatntSearchView3(tbody, info); 
		});


		//시간표 탭 클릭시 환자정보 테이블 초기화
		$("#ttGrid-viewBtn").on("click", function() {

		});

		//두번째 외래 진료과 조회탭 리셋 클릭시 환자정보 테이블 초기화
		$("#clinicResetBtn").on("click", function() {
			loadReset2Table();
		});
		
		
		//세번째 검사 예약조회탭 리셋 클릭시 환자정보 테이블 초기화
		$("#rezExamResetBtn").on("click", function() {
			loadReset3Table();
		});
		
		
		function patntSearchView(tbody, info) {
		    var rows = [
		        $("<tr>").append(
		            $("<th>").html("성명(성별)"),
		            $("<td>").html(info.patntNm + " (" + info.gen + ")")
		        ),
		        $("<tr>").append(
		            $("<th>").html("식별코드"),
		            $("<td>").html(info.patntCode)
		        ),
		        $("<tr>").append(
		            $("<th>").html("주민번호"),
		            $("<td>").html(info.birthCode + " (" + info.age + ")")
		        ),
		        $("<tr>").append(
		            $("<th>").html("연락처"),
		            $("<td>").html(info.patntTelno)
		        ),
		        $("<tr>").append(
		            $("<th>").html("이메일"),
		            $("<td>").html(info.patEmail)
		        ),
		        $("<tr>").append(
		            $("<th>").html("주소"),
		            $("<td>").html(info.patntAddr1)
		        ),
		        $("<tr>").append(
		            $("<th>").html("최초등록일"),
		            $("<td>").html(info.fpatntRegist)
		        ),
		        $("<tr>").append(
		            $("<th>").html("다음진료일"),
		            $("<td>").html(info.fresveDate)
		        ),
		        $("<tr>").append(
		            $("<th>").html("담당과"),
		            $("<td>").html(info.fcltyNm)
		        ),
		        $("<tr>").append(
		            $("<th>").html("신장/체중"),
		            $("<td>").html(info.height + " / " + info.weight)
		        )
		    ];

		    rows.forEach(function (row) {
		        tbody.append(row);
		    });
		}

		function loadReset2Table() {
		    var tbody = $(".clinicPatientInfo");
		    tbody.empty();

		    tbody.append(
		        $("<tr>").html(
		            $("<td colspan='11'>").html("환자이름을 선택하세요")
		        )
		    );
		}

		// 예약조회 환자정보 조회탭 초기화
		function loadReset3Table() {
		    var tbody = $(".examPatientInfo");
		    tbody.empty();

		    tbody.append(
		        $("<tr>").html(
		            $("<td colspan='11'>").html("환자이름을 선택하세요")
		        )
		    );
		}
			
			
			
		//진료과 시간표 예약환자 로드(오늘날짜로 기본세팅)
		function loadClinicTimeTable(resveDate) {
		
		 $(".schedule-item").empty();
     	 $(".schedule-item").css({
			    "background-color": "white",
			    "border": "none" 
			});


		
			$.getJSON("<c:url value='/rez/clinicTimeTable.do' />", {
				resveDate : resveDate
			}).done(function(resp) {

				console.log(resp);
				var data = resp;
				console.log("시간표",data);

				var itemsSchedule = [];

				$(resp).each(function(idx, data) {

					var patntCode='data.patntCode';
					var resveNum='data.resveNum';
					var resveDate='data.resveDate';
					var resveTime='data.resveTime';
					var resveEndTime='data.resveEndTime';
					var fcltyCode='data.fcltyCode';
					
					
					console.log("시간표",data);
					var bgColor;

					switch (data.fcltyNm) {
					case "sunday":
						bgColor = "red";
						break;
					case "monday":
						bgColor = "blue";
						break;
					case "tuesday":
						bgColor = "purple";
						break;
					case "wednesday":
						bgColor = "green";
						break;
					case "thursday":
						bgColor = "yellow";
						break;
					case "friday":
						bgColor = "red";
						break;
					case "saturday":
						bgColor = "blue";
						break;
					default:
						bgColor = "blue";
						break;
					}

					var item = {
						patntCode : data.patntCode,
						resveNum : data.resveNum,
						keyfrom : data.resveTime,
						keyto : data.resveEndtime,
						text : data.patntNm,
						bg : bgColor,
						days : [ data.fcltyNm ]
					};

					itemsSchedule.push(item);

					console.log("itemsSchedule>", itemsSchedule);

					
						
					});
				
				itemsSchedule.forEach(function(sitem, index) {

					var sday = sitem.days;
					$("#clinic").append(
							 '<div class="schedule-item'
						    + ' schedule-' + sday
						    + ' time-from-' + sitem.keyfrom
						    + ' time-to-' + sitem.keyto
						    + ' nt bg-' + sitem.bg + '">'
						    + '<button type="button"data-bs-toggle="modal" data-bs-target="#draggableModal" id="rezUpdateBtn" class="btn rezUpdateBtn" data-patntcode="' + sitem.patntCode + '" value="' + sitem.resveNum + '">' + sitem.text + '</button>'
						    + '</div>'
						);

				}); //resp 반복문

			}); //getJson

		} //function loadClinicTimeTable

		//clinifcResveDate 
		
				
		//진료과 시간표 예약환자 로드(검색한 날짜파라미터), 예약취소 후 새로고침용
		function deleteRezAfterLoadClinicTimeTable(resveDate) {
		
		 $(".schedule-item").empty();
     	 $(".schedule-item").css({
			    "background-color": "white",
			    "border": "none" 
			});


		
			$.getJSON("<c:url value='/rez/clinicTimeTable.do' />", {
				resveDate : resveDate
			}).done(function(resp) {

				console.log(resp);
				var data = resp;
				console.log(data);

				var itemsSchedule = [];

				$(resp).each(function(idx, data) {

					var patntCode='data.patntCode';
					var resveNum='data.resveNum';
					var resveDate='data.resveDate';
					var resveTime='data.resveTime';
					var resveEndTime='data.resveEndTime';
					var fcltyCode='data.fcltyCode';
					
					
					console.log(data);
					var bgColor;

					switch (data.fcltyNm) {
					case "sunday":
						bgColor = "red";
						break;
					case "monday":
						bgColor = "blue";
						break;
					case "tuesday":
						bgColor = "purple";
						break;
					case "wednesday":
						bgColor = "green";
						break;
					case "thursday":
						bgColor = "yellow";
						break;
					case "friday":
						bgColor = "red";
						break;
					case "saturday":
						bgColor = "blue";
						break;
					default:
						bgColor = "blue";
						break;
					}

					var item = {
						patntCode : data.patntCode,
						resveNum : data.resveNum,
						keyfrom : data.resveTime,
						keyto : data.resveEndtime,
						text : data.patntNm,
						bg : bgColor,
						days : [ data.fcltyNm ]
					};

					itemsSchedule.push(item);

					console.log("itemsSchedule>", itemsSchedule);

					
						
					});
				
				itemsSchedule.forEach(function(sitem, index) {

					var sday = sitem.days;
					$("#clinic").append(
							 '<div class="schedule-item'
						    + ' schedule-' + sday
						    + ' time-from-' + sitem.keyfrom
						    + ' time-to-' + sitem.keyto
						    + ' nt bg-' + sitem.bg + '">'
						    + '<button type="button"data-bs-toggle="modal" data-bs-target="#draggableModal" class="btn rezUpdateBtn" data-patntcode="' + sitem.patntCode + '" value="' + sitem.resveNum + '">' + sitem.text + '</button>'
						    + '</div>'
						);

				}); //resp 반복문

			}); //getJson

		} //function loadClinicTimeTable

		//clinifcResveDate 
		
		
		//검사실 시간표 로드
			function loadExamTimeTable(resveDate) {
			$(".schedule-item").empty();
		    $(".schedule-item").css({
				"background-color": "white",
				"border": "none" 
				});

			$.getJSON("<c:url value='/rez/examTimeTable.do' />", {resveDate : resveDate}).done(function(resp) { 
				
				var data = resp; 
				
				
				
				var itemsSchedule = [];

				$(resp).each(function(idx, data) {
					
					
					var patntCode='data.patntCode';
					var resveNum='data.resveNum';
					var resveDate='data.resveDate';
					var resveTime='data.resveTime';
					var resveEndTime='data.resveEndTime';
					var fcltyCode='data.fcltyCode';
					
					
					
					var bgColor;

					switch (data.fcltyNm) {
					case "sunday":
						bgColor = "red";
						break;
					case "monday":
						bgColor = "blue";
						break;
					case "tuesday":
						bgColor = "purple";
						break;
					case "wednesday":
						bgColor = "yellow";
						break;
					case "thursday":
						bgColor = "green";
						break;
					case "friday":
						bgColor = "yellow";
						break;
					case "saturday":
						bgColor = "yellow";
						break;
					default:
						bgColor = "yellow";
						break;
					}

					var item = {
						patntCode : data.patntCode,
						resveNum : data.resveNum,
						keyfrom : data.resveTime,
						keyto : data.resveEndtime,
						text : data.patntNm,
						bg : bgColor,
					
						days : [ data.fcltyNm ]
					};

					itemsSchedule.push(item);

					console.log("itemsSchedule>", itemsSchedule);

						
					});


				itemsSchedule.forEach(function(sitem, index) {

					var sday = sitem.days;
					$("#exam").append(
						    '<div class="schedule-item'
						    + ' schedule-' + sday
						    + ' time-from-' + sitem.keyfrom
						    + ' time-to-' + sitem.keyto
						    + ' nt bg-' + sitem.bg + '">'
						    + '<button type="button"data-bs-toggle="modal" data-bs-target="#draggableModal" id = "rezUpdateBtn" class="btn rezUpdateBtn" data-patntcode="' + sitem.patntCode + '" value="' + sitem.resveNum + '">' + sitem.text + '</button>'
						    + '</div>'
						);
				}); //resp 반복문

			}); //getJson

		} //function loadExamTimeTable
		

		//진료과 시간표 날짜검색(날짜 미선택 시 알림창)
		$("#clinicTTBtn").on("click", function() {
			var clinicResveDate = $("#clinicTTResveDate").val();
			  if (clinicResveDate === "") {
		            Swal.fire('조회날짜를 선택하세요.');
		            event.preventDefault(); // 폼 제출 막기
		        } else{
					loadClinicTimeTable(clinicResveDate);
		        }
		});

		//검사실 시간표 탭 날짜검색(날짜 미선택 시 알림창)
		$("#examTTBtn").on("click", function() {
			var examResveDate = $("#examTTResveDate").val();
			
		        if (examResveDate === "") {
		            Swal.fire('조회날짜를 선택하세요.');
		            event.preventDefault(); // 폼 제출 막기
		        } else{
			        loadExamTimeTable(examResveDate);
		        }
		});

		
		//페이징 start
		$('#patient-table').addClass('nowrap').dataTable({
			responsive : true,
			columnDefs : [ {
				targets : [ -1, -3 ],
				className : 'dt-body-right'
			} ]
		});
		
		
		
		  $(document).ready(function() {
		        $('#myProjectTable')
		        .addClass( 'nowrap' )
		        .dataTable( {
		            responsive: true,
		            columnDefs: [
		                { targets: [-1, -3], className: 'dt-body-right' }
		            ]
		        });
		        $('.deleterow').on('click',function(){
		        var tablename = $(this).closest('table').DataTable();  
		        tablename
		            .row( $(this)
		            .parents('tr') )
		            .remove()
		            .draw();

		        } );
		    });
	        
	        
		  $(document).ready(function() {
		        $('#myProjectTable2')
		        .addClass( 'nowrap' )
		        .dataTable( {
		            responsive: true,
		            columnDefs: [
		                { targets: [-1, -3], className: 'dt-body-right' }
		            ]
		        });
		        $('.deleterow').on('click',function(){
		        var tablename = $(this).closest('table').DataTable();  
		        tablename
		            .row( $(this)
		            .parents('tr') )
		            .remove()
		            .draw();

		        });
		    });
		//페이징 end
		
		      
		    const urlParams = new URLSearchParams(window.location.search);
		  	const recCode = urlParams.get('recCode');

		  	const Toast = Swal.mixin({
		  	    toast: true,
		  	    position: 'center-center',
		  	    showConfirmButton: false,
		  	    timer: 1500,
		  	    timerProgressBar: true,
		  	    didOpen: (toast) => {
		  	        toast.addEventListener('mouseenter', Swal.stopTimer)
		  	        toast.addEventListener('mouseleave', Swal.resumeTimer)
		  	    }
		  	});	
		  	
	  	
//모달 드래그			
	$("#draggableModal").draggable({
	 handle: ".modal-header" // You can specify the handle for dragging (e.g., modal header)
		});
//모달 드래그	  


		  	
		  	
	});
			
			
</script>
