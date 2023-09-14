<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>

<head>
<!-- Favicon-->
<!-- plugin css file  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/responsive.dataTables.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/dataTables.bootstrap5.min.css">
<!-- project css file  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/assets/css/ihealth.style.min.css">
</head>

<body>
	<!--전체  -->
	<div id="ihealth-layout" class="theme-tradewind">
		<!-- main body area -->
		<div class="main px-lg-4 px-md-4">
			<!-- Body: Body -->
			<div class="body d-flex py-3">

				<div class="container-xxl">
					<!-- 1행 3열 카드 시작 -->
					<div class="row g-3 mb-3">
						<div class="col-md-4 col-lg-4"
							style="width: 32%; margin-right: 1%;">
							<div class="card">
								<div
									class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
									<h6 class="mb-0 fw-bold">Card 1</h6>
								</div>
								<div class="card-body">
									<div id="#"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
