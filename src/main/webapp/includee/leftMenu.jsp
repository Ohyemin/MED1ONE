<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en" dir="ltr">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	
<title>MED1 ONE</title>

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Favicon-->
<!-- project css file  -->

	
<style type="text/css">
  .sidebar a {
  color: white;
}

.sidebar i {
  color: white;
}
	
.sidebar{
	margin-top :100px;
	height: 80%;
	background-color: #6aab9c;
	
	}

</style>

                                  
	
</head>

                                 
<div id="ihealth-layout" class="theme-tradewind">
     
    <!-- sidebar -->
    <div class="sidebar px-4 py-4 py-md-5 me-0">
        <div class="d-flex flex-column h-100">
        
            <a href="index.html" class="mb-0 brand-icon" style="font-size: large; font-weight: bold;">
                <span class="logo-icon"> <i class="icofont-id-card fs-2" style="margin-right: 10px"></i></span>
                <span class="m-link">간호부</span>
            </a>
            
            <!-- Menu: main ul -->
            <ul class="menu-list flex-grow-1 mt-3">
            
                  <li>

	                <a class="m-link" href="<%=request.getContextPath() %>/nurse/docScheduleList.do"><i class="icofont-ui-calendar"></i><span>근무일정</span></a>

                </li>
                
               <li><a class="m-link" href="${pageContext.request.contextPath }/common/medicine.jsp"><i class="icofont-capsule"></i> <span>약품관리</span> 
               <!-- <span class="ms-auto small-14 fw-bold">v1.0.0</span> --></a></li>
               
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-clinic" href="#">
                    <i class="icofont-ui-clip-board" style="margin-right: 0px"></i> <span>외래진료</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-clinic">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/nurse/clinicRetrieve.do"><span>외래진료조회</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/nurse/reservationInsert.do"><span>진료예약</span></a></li>
                    	</ul>
                </li>
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-ward" href="#">
                    <i class="icofont-ui-home" style="margin-right: 0px"></i> <span>병동</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-ward">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/hospital/hospitalPatientList.do"><span>병동조회</span></a></li>
                       		 <li><a class="ms-link" href="${pageContext.request.contextPath }/hospital/medicineInsert.do"><span>환자관리</span></a></li>
                       		 <li><a class="ms-link" href="${pageContext.request.contextPath }/nurse/nurseList.do"><span>간호일지</span></a></li>
                    	</ul>
                </li>
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-exmn" href="#">
                    <i class="icofont-heartbeat" style="margin-right: 0px"></i> <span>검진</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-exmn">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/examinate/examPatientList.do"><span>검진대기조회</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/examinate/examResult.do"><span>검진결과관리</span></a></li>
                    	</ul>
                </li>
            </ul>
           
           <!--간호부 종료  -->
           <!--의사 진료부  -->
           
            <a href="index.html" class="mb-0 brand-icon" style="font-size: large; font-weight: bold;">
                <span class="logo-icon"> <i class="icofont-id-card fs-2" style="margin-right: 10px"></i></span>
                <span class="m-link">진료부</span>
            </a>
            
            <!-- Menu: main ul -->
            <ul class="menu-list flex-grow-1 mt-3">
            
                <li>
	                <a class="m-link" href="<%=request.getContextPath() %>/nurse/docScheduleList.do"><i class="icofont-ui-calendar"></i><span>근무일정</span></a>
                </li>
                         
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-doctorClinic" href="#">
                    <i class="icofont-ui-clip-board" style="margin-right: 0px"></i> <span>진료</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-doctorClinic">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/patient/patientReception.do"><span>외래진료</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/patient/examinatReception.do"><span>검진센터</span></a></li>
                    	</ul>
                </li>
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-rounds" href="#">
                    <i class="icofont-ui-home" style="margin-right: 0px"></i> <span>병동</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-rounds">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/clinic/hospitalList.do"><span>병동현황</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/clinic/hospitalSchedule.do"><span>회진일정</span></a></li>
                    	</ul>
                </li>
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-inspection" href="#">
                    <i class="icofont-heartbeat" style="margin-right: 0px"></i> <span>검사</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-inspection">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/Inspection/InspecPatientList.do"><span>검사실</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/Inspection/InspectionResult.do"><span>검사결과관리</span></a></li>
<%--                        		<li><a class="ms-link" href="${pageContext.request.contextPath }/Inspection/patientReception.do"><span>검사장비관리</span></a></li> --%>
                    	</ul>
                </li>
            </ul>
           <!--의사 진료부 메뉴종료  -->
           <!--행정부  -->
           
            <a href="index.html" class="mb-0 brand-icon" style="font-size: large; font-weight: bold;">
                <span class="logo-icon"> <i class="icofont-id-card fs-2" style="margin-right: 10px"></i></span>
                <span class="m-link">행정부</span>
            </a>
            
            <!-- Menu: main ul -->
            <ul class="menu-list flex-grow-1 mt-3">
            
                <li>
	              <a class="m-link" href="<%=request.getContextPath() %>/nurse/docScheduleList.do"><i class="icofont-ui-calendar"></i><span>근무일정</span></a>
                </li>
                         
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-reception" href="#">
                    <i class="icofont-ui-clip-board" style="margin-right: 0px"></i> <span>접수</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-reception">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/patient/patientReception.do"><span>외래접수</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/patient/examinatReception.do"><span>검진접수</span></a></li>
                    	</ul>
                </li>
                
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-hospitalization" href="#">
                    <i class="icofont-ui-home" style="margin-right: 0px"></i> <span>병동</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>                   	
               <!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-hospitalization">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/hospital/hospitalSearch.do"><span>병동조회</span></a></li>
                    	</ul>
                </li>
                
                
              	<li>
	                <a class="m-link" href="${pageContext.request.contextPath }"><i class="icofont-credit-card"></i><span>수납-보류</span></a>
                </li>
                
                 <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-order" href="#">
                    <i class="icofont-shopping-cart" style="margin-right: 0px"></i> <span>구매관리</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-order">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }"><span>약품관리 - 보류</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/fixtures/fixturesOrder.do"><span>비품관리</span></a></li>
                    	</ul>
                </li>
                
                 
             <li>
	                <a class="m-link" href="${pageContext.request.contextPath }/message/messageSend.do"><i class="icofont-ui-message"></i><span>SMS</span></a>
                </li>
                
                
            </ul>
           
           <!--행정부 메뉴종료  -->
           
            <!--관리자-->
           
            <a href="index.html" class="mb-0 brand-icon" style="font-size: large; font-weight:
            
            
             bold;">
                <span class="logo-icon"> <i class="icofont-id-card fs-2" style="margin-right: 10px"></i></span>
                <span class="m-link">관리자</span>
            </a>
            
            <!-- Menu: main ul -->
            <ul class="menu-list flex-grow-1 mt-3">
            
            	
                <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-admin" href="#">
                    <i class="icofont-ui-settings" style="margin-right: 0px"></i> <span>관리</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-admin">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/login/authRequest.do"><span>사용자승인</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/admin/docScheduleInsert.do"><span>일정관리</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/admin/treeInsert.do"><span>조직도관리</span></a></li>
                    	</ul>
                </li>
                
                 <li class="collapsed">
                    <a class="m-link" data-bs-toggle="collapse" data-bs-target="#menu-board" href="#">
                    <i class="icofont-users-alt-3" style="margin-right: 0px"></i> <span>게시판</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span></a>
                    	<!-- Menu: Sub menu ul -->
                    	<ul class="sub-menu collapse" id="menu-board">
                        	<li><a class="ms-link" href="${pageContext.request.contextPath }/notice/noticeList.do"><span>공지등록</span></a></li>
                       		<li><a class="ms-link" href="${pageContext.request.contextPath }/free/freeList.do"><span>자유게시판</span></a></li>
                    	</ul>
                </li>
                
                
                <li>
	                <a class="m-link" href="${pageContext.request.contextPath }/admin/researchPatient.do"><i class="icofont-chart-histogram"></i><span>자료실</span></a>
                </li>
                
                
                
              	<li>
	                <a class="m-link" href="${pageContext.request.contextPath }/chat.do"><i class="icofont-speech-comments"></i><span>채팅</span></a>
                </li>
                
           		<li>
	                <a class="m-link" href="${pageContext.request.contextPath }/message/messageSend.do"><i class="icofont-ui-message"></i><span>SMS</span></a>
                </li>
                
                
            </ul>
           
           <!--행정부 메뉴종료  -->
           
           
            <!-- Menu: menu collepce btn -->
            <button type="button" class="btn btn-link sidebar-mini-btn text-light">
                <span class="ms-2"><i class="icofont-bubble-right"></i></span>
            </button>
    	 </div>
    </div>
</div>
	
	