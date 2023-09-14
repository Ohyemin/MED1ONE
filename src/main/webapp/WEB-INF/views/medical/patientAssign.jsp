<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html class="no-js" lang="en" dir="ltr">

<!-- 캘린더 -->
<script
   src='<%=request.getContextPath()%>/resources/fullcalendar-6.1.8/dist/index.global.js'></script>
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/loadingoverlay.min.js"></script>
<!-- plugin css file  -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/responsive.dataTables.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/dist/assets/plugin/datatables/dataTables.bootstrap5.min.css">

<!-- 진료 예약 날짜, 시간 변환 js -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
   
<!-- 모듈 드래그 앤 드롭 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js" integrity="sha512-zYXldzJsDrNKV+odAwFYiDXV2Cy37cwizT+NkuiPGsa9X1dOz04eHvUWVuxaJ299GvcJT31ug2zO4itXBjFx4w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
    
      gtag('config', 'UA-264428387-1');
    </script>

<style>
.top-color {
   border-top: 3px solid #6aab9c;
}

/* 민트색 버튼 스타일 */
.mint-btn {
   /*    margin-left:10px; */
   display: inline-block;
   /*     font-weight: 400; */
   line-height: 1.5;
   text-align: center;
   vertical-align: middle;
   cursor: pointer;
   color: #fff; /* 텍스트 색상 */
   background-color: #6aab9c; /* 배경색 */
   border-color: #6aab9c; /* 테두리 색상 */
   user-select: none;
   padding: 0.375rem 0.75rem;
   font-size: 1.0em;
   border-radius: 0.25rem;
   float: right; /* 버튼을 오른쪽으로 부유(floating)시킴 */
}

/* 민트색 버튼 호버 효과 */
.mint-btn:hover {
   background-color: #5fa192; /* 호버시 배경색 변경 */
   border-color: #5fa192; /* 호버시 테두리 색상 변경 */
   /* 다른 호버 효과 (예: 텍스트 색상 변경) 추가 가능 */
}

/* 민트색 버튼 클릭 효과 */
.mint-btn:active {
   background-color: #5fa192; /* 클릭시 배경색 변경 */
   border-color: #5fa192; /* 클릭시 테두리 색상 변경 */
}


#overflow::-webkit-scrollbar {
   display: none; /* 크롬, 사파리, 오페라, 엣지 */
}

#calendarSchedule {
   width: 850px;
   height: 450px;
   margin-left: 40px;
   margin-right: auto;
}

.container {
font-family: "Trebuchet MS", sans-serif;
display: flex;
}
.column {
border-radius: 5px;
}

.list-group-item {
cursor: pointer;
}






</style>

<!-- 템플릿 -->

<!-- main body area -->
<div class="main px-lg-4 px-md-4"
   style="margin-top: -30px; margin-left: -330px; margin-right: -200px; height: 95vh;">
   <!-- Body: Body -->
   <div class="body d-flex py-3">
      <!--컨테이너  -->
      <div class="container-xxl">
         <div class="row g-3 mb-3">
            <div
               class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0" >
               <h3 id="deptTitle" class="mb-0 fw-bold" style="color: #6aab9c;"></h3>
               <select id="dept" class="form-select " style='width: 10%'>
                  <option value="A">호흡기내과</option>
                  <option value="B">소화기내과</option>
                  <option value="D">심장내과</option>
                  <option value="E">감염내과</option>
                  <option value="F">내분비내과</option>
                  <option value="C">영상의학과</option>
               </select>
            </div>
                              
                              
            <!--대기실 2개 컨테이너  -->
            <div class="row g-3 mb-3 container" >
               <!-- 대기실 -->
               <div class="col-md-12 col-lg-6 column"
                  style="width: 35%; margin-right: 1%; margin-left:-70px">
                  <div class="card mb-3 top-color list-group-item"  draggable="true" >
                        <div
                           class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                           <h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c; ">진료대기</h6>
                        </div>
                        <div class="card-body"  style="height: 350px; width:100%">
                           <div style="height:60px;">
                              <table id="myDataTable"
                                 class="table table-hover align-middle mb-0"
                                 style="width: 100%;  font-size: 13px; text-align: center;">
                                 <thead>
                                    <tr style="border-bottom: 1px solid black;">
                                       <th style="width:90px;">접수코드</th>
                                       <th style="width:80px;">성명</th>
                                       <th style="width:90px;">접수일자</th>
                                       <th style="width:110px;">상태</th>
                                       <th></th>
                                       <th></th>
                                    </tr>
                                 </thead>
                              </table>
                           </div>
                           <div id="overflow" style="width: 490px; height: 270px; overflow-y: scroll;">
                              <table class="table table-hover align-middle mb-0">
                                 <tbody id="patntWait">

                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div class="card mb-3 top-color list-group-item" draggable="true" style="height:39.1%" style="border-top: 3px solid #6aab9c">
                        <div
                           class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                           <h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c;  ">진료중</h6>
                        </div>
                        <div class="card-body">
                           <table id="myDataTable2"
                              class="table table-hover align-middle mb-0"
                              style="width: 100%; height: 210px; text-align: center;">
                              <thead>
                                 <tr>
                                    <th>접수코드</th>
                                    <th>성명</th>
                                    <th>접수일자</th>
                                    <th>상태</th>
                                    <th></th>
                                 </tr>
                              </thead>
                              <tbody id="patntRoom">

                              </tbody>
                           </table>
                        </div>
                     </div>
               </div>
               <!--대기실-->
               
               <!-- 달력 -->
               <div class="col-md-12 col-lg-6 column"
                  style="width: 53%; margin-right: 1%;">
                  <div class="card mb-3 top-color list-group-item" draggable="true" style="  height:750px;">
                     <div
                        class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                        <h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c;  ">근무 일정</h6>
                     </div>
                     <div class="card-body">
                        <div class="col-md-10 col-sm-6" style="width: 90%; height: 100%">
                           <!--                                <div class="card"> -->
                           <div class="member-info  w-100">

                              <select id="employee" class="form-select" style='width: 15%'>
                                 <option value="doctor">의사</option>
                                 <option value="nurse">간호사</option>
                              </select>
                              <div class="row g-2 pt-2 ">

                                 <div id='calendarSchedule'></div>

                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div> <!-- 달력 -->
               
               <!-- 진료예약 -->
               <div class="col-md-12 col-lg-6 column"
                  style="width: 13%; margin-right: 1%;">
                  <div class="card mb-3 top-color list-group-item" draggable="true" style="height:750px; margin-right:-200px">
                     <div
                        class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                        <h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c;  ">진료예약</h6>
                     </div>
                     <div class="card-body">

                        <div class="wrapper">
                           <div id="calendar">

                              <div class="monthChange"></div>

                              <div class='timepicker'>
                                 <div class="owl">
                                    <div>09:00</div>
                                    <div>10:00</div>
                                    <div>11:00</div>
                                    <div>12:00</div>
                                    <div>13:00</div>
                                    <div>14:00</div>
                                    <div>15:00</div>
                                    <div>16:00</div>
                                    <div>17:00</div>
                                    <div>18:00</div>
                                 </div>
                                 <div class="fade-l"></div>
                                 <div class="fade-r"></div>
                              </div>
                           </div>


                           <div class="inner-wrap">

                              <div class="mb-3">
                                 <input type="text" class="form-control" name="patntNm"
                                    id="patntNm" placeholder="환자명">
                              </div>
                              <div class="mb-3">
                                 <input type="text" class="form-control" id="patntCode"
                                    placeholder="환자코드">
                              </div>
                              <select id="reservation" class="form-select mb-3"
                                 aria-label="Default select example">
                                 <option selected>진료과</option>
                                 <option value="A">호흡기내과</option>
                                 <option value="B">소화기내과</option>
                                 <option value="C">영상의학과</option>
                                 <option value="D">심장내과</option>
                                 <option value="E">감염내과</option>
                                 <option value="F">내분비과</option>
                              </select>
                              <button type="button" class="btn btn-user disabled request"
                                 id="reservationBtn">
                                 진료예약 <span>On</span> <span class="day fw-bold text-white"
                                    id="reserveDate"></span> <span>At</span> <span
                                    class="time fw-bold text-white" id="reserveTime"></span> <i
                                    class="icofont-dotted-right fs-3"></i>
                              </button>

                           </div>
                        </div>
                     </div>
                  </div>

               </div>
               <!--진료예약-->
               
               
               
            </div>
            <!--1행 대기실, 진료실 끝 -->

         </div>
      </div>
      <!--컨테이너  -->
   </div>
   <!--바디  -->
</div>
<!--메인바디  -->

<!-- Plugin Js -->
<script
   src="<%=request.getContextPath()%>/resources/dist/assets/bundles/apexcharts.bundle.js"></script>
<script
   src="<%=request.getContextPath()%>/resources/dist/assets/plugin/jqueryuicalandar/jquery-ui.min.js"></script>
<script
   src="<%=request.getContextPath()%>/resources/dist/assets/plugin/owlcarousel/owl.carousel.js"></script>
<script
   src="<%=request.getContextPath()%>/resources/dist/assets/bundles/dataTables.bundle.js"></script>

<!-- Jquery Page Js -->
<script src="<%=request.getContextPath()%>/resources/js/template.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/page/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
//---------------------------------------드래그

const columns = document.querySelectorAll(".column");
columns.forEach((column) => {
  new Sortable(column, {
    group: "shared",
    animation: 150,
    ghostClass: "blue-background-class"
  });
});

// ---------------------------------------Toast
const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 1000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
});   

//--------------------------------------------------부서선택
// var deptSelect = $("#dept option:selected").val();
$(dept).on("change", function(event){
   
   let deptSelect = $(this).val(); //부서 변경시 변수에 저장
   
   deptTitle.innerText = $(dept).find("option:selected").text() + " 진료 대기실"; // 페이지 제목 부서 변경시 변경

   // 진료대기, 진료 중 함수 파라미터로 변경된 부서 전달 후 호출
   ATable(deptSelect);
    BTable(deptSelect);
    
    //캘린더도
    eventSources.doctor.url = generateDoctorUrl(deptSelect);
    eventSources.nurse.url = generateNurseUrl(deptSelect);
    
    
    empSel.trigger('change');
    
});


      
// ----------------------------------------------대기 및 진료 환자 조회


//진료 대기 환자
function ATable(deptSelect) {

    $.ajax({
        url         : '${pageContext.request.contextPath}/patient/clinicRetrieve.do',
        method      : 'GET',
        data        : {deptSelect : deptSelect},
        dataType   : 'json',
        success: function(data) {
            // 서버로부터 받아온 데이터를 이용하여 테이블 내용을 갱신
            
            var tbody = $('#patntWait');
            
            tbody.empty(); // 기존 내용 비우기

            $.each(data, function(index, list) {
                if (list.statCode === '005') {
                    var row = $('<tr style="height: 50px;">');
                    row.append('<td>' + list.recCode + '</td>');
                    row.append('<td data-patnt-code="' + list.recep.patnt.patntCode + '">' + list.recep.patnt.patntNm + '</td>');
                    row.append('<td>' + list.statTime + '</td>');
                    row.append('<td><select class="form-select form-select-sm" style="width:100px; font-size:14px;"><option value="">진료대기</option><option value="006">진료중</option></select></td>');
                    row.data('fclty-code', list.fcltyCode); 
                    row.append('<td><button type="button" class="saveBtn mint-btn">이동</button></td>');
                    //onclick으로 바꾸기
                    tbody.append(row);
                }
            });
        },
        error: function(xhr, textStatus, error) {
           
        }
    });
}


//진료중 환자
function BTable(deptSelect) {
   
    $.ajax({
        url         : '${pageContext.request.contextPath}/patient/clinicRetrieve.do',
        method      : 'GET',
        data        : {deptSelect : deptSelect},
        dataType   : 'json',
        success: function(data) {
            // 서버로부터 받아온 데이터를 이용하여 테이블 내용을 갱신
            
            var tbody = $('#patntRoom');
            
            tbody.empty(); // 기존 내용 비우기

            $.each(data, function(index, list) {
                if (list.statCode === '006') {
                    var row = $('<tr style="height: 50px;">');
                    row.append('<td>' + list.recCode + '</td>'); 
                    row.append('<td data-patnt-code="' + list.recep.patnt.patntCode + '">' + list.recep.patnt.patntNm + '</td>');
                    row.append('<td>' + list.statTime + '</td>');
                    row.append('<td><span style="font-size: 12px" class="badge bg-danger">진료중</span></td>');
                    tbody.append(row);
                }
            });
        },
        error: function(xhr, textStatus, error) {
           
            alert("실패");
        }
    });
}


//-------------------------------------------- 환자 상태 변경 버튼

$(document).ready(function() {

   $(dept).trigger('change');

   $(document).on("click", ".saveBtn", function() {
      
      var currentRow = $(this).closest('tr');

       var recCode = currentRow.find('td:eq(0)').text();
       var fcltyCode = currentRow.data("fclty-code");
        var selectedStatus = currentRow.find("select").val();
      
        $.ajax({
            url: '${pageContext.request.contextPath}/patient/patientInsert.do', 
            method: "GET", 
            data: {
                recCode: recCode,
                fcltyCode: fcltyCode,
                statCode: selectedStatus 
            },
            dataType: "json",
            success: function(response) {
            	Toast.fire({
                    icon: 'success',
                    title: '이동되었습니다.'
                });
            	
               $(dept).trigger('change');
                
                
            },
            error: function(xhr, status, error) {
               
            	Toast.fire({
                    icon: 'success',
                    title: '다시 시도해주세요.'
                });
            }
        });
    });
});


//----------------------------------------캘린더(일정조회)

let eventSources = {
      doctor:
      { 
         id: "doctor",
         url: generateDoctorUrl($(dept).val()),
         color:'pink',
         textColor: 'black',
      },
      nurse:
         {
         id: "nurse",
         url: generateNurseUrl($(dept).val()),
         color:'lightblue',
         textColor: 'black'
         }
}

function generateDoctorUrl(deptCode) {
    return "<c:url value='/nurse/docDeptScheduleList.do?fcltyCodeDoc=" + deptCode + "'/>";
}

function generateNurseUrl(deptCode) {
    return "<c:url value='/nurse/nurDeptScheduleList.do?fcltyCodeNur=" + deptCode + "'/>";
}


document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendarSchedule');
   var calendar = new FullCalendar.Calendar(calendarEl, {
      
         initialView : 'dayGridMonth',
         locale : 'ko', // 한국어 설정
          headerToolbar : {
                start : '',
                center : "title",
                end : 'prev next'
                  },
          selectable : true,
          droppable : true,
          editable : true,
          displayEventTime:false,
         eventSources : [],
         height: 'auto',
         width: 'auto'
         });
         calendar.render();
         empSel.data("relCalendar", calendar);
         empSel.trigger('change');
   });
   
 let empSel = $("#employee").on('change', function(event){
      event.preventDefault();
      var result = $("#employee option:selected").val();
      
      let calendar = $(this).data("relCalendar");
      
      calendar.getEventSources().forEach((tmpes)=>tmpes.remove());
      
      calendar.addEventSource(eventSources[result])
      calendar.render();
}); 

//진료 대기 테이블에서 행 클릭 이벤트 처리
 $(document).ready(function() {
    $('#patntWait').on('click', 'tr', function() {
       // 클릭한 행에서 데이터 읽어오기
       var patntNm = $(this).find('td:eq(1)').text();
       var patntCode =  $(this).find('td:eq(1)').attr("data-patnt-code");
       
       // input 태그에 값 할당
       $('#patntNm').val(patntNm);
       $('#patntCode').val(patntCode);
    });
 });
 
//진료 중 중 테이블에서 행 클릭 이벤트 처리
$(document).ready(function() {
   $('#patntRoom').on('click', 'tr', function() {
      // 클릭한 행에서 데이터 읽어오기
      var patntNm = $(this).find('td:eq(1)').text();
      var patntCode =  $(this).find('td:eq(1)').attr("data-patnt-code");
      
      // input 태그에 값 할당
      $('#patntNm').val(patntNm);
      $('#patntCode').val(patntCode);
   });
});

//예약 버튼
var resdate = {}; // 예약된 날짜를 저장하는 객체

$("#reservationBtn").on("click", function () {
    let reserveDateText = $("#reserveDate").text();
    let parsedReserveDate = moment(reserveDateText, 'MMMM DD').format('YYYYMMDD');

    let reserveTimeText = $("#reserveTime").text();
    let parsedReserveTime = moment(reserveTimeText, 'HH:mm');

    let resveEndtime = parsedReserveTime.clone().add(1, 'hour').format('HHmm');
    let fcltyCode = $("#reservation option:selected").val();
    let patntNm = $("#patntNm").val();
    let patntCode = $("#patntCode").val();
    

    // 예약 여부 확인
    let reservationKey = parsedReserveDate + "-" + parsedReserveTime.format('HHmm');
    if (resdate[reservationKey]) {
       Toast.fire({
            icon: 'warning',
            title: '이미 예약된 날짜와 시간입니다.'
        });
       
       // 폼 초기화
        $('#patntNm').val('');
        $('#patntCode').val('');
        $('#reservation').prop('selectedIndex', 0);
    } else {
        // 예약 처리
        $.getJSON("<c:url value='/patient/reservationInsert.do'/>", {
            resveDate: parsedReserveDate,
            resveTime: parsedReserveTime.format('HHmm'),
            resveEndtime: resveEndtime,
            patntCode: patntCode,
            fcltyCode: fcltyCode,
            patntNm: patntNm
        }).done(function (resp) {
            resdate[reservationKey] = true; // 예약된 날짜와 시간 목록에 추가
            Toast.fire({
                icon: 'success',
                title: '환자 예약이 완료되었습니다.'
            });
            
            // 폼 초기화
            $('#patntNm').val('');
            $('#patntCode').val('');
            $('#reservation').prop('selectedIndex', 0);
            
        }).fail(function() {
           Toast.fire({
                icon: 'warning',
                title: '이미 예약된 날짜와 시간입니다.'
            });
           
           // 폼 초기화
            $('#patntNm').val('');
            $('#patntCode').val('');
            $('#reservation').prop('selectedIndex', 0);
        });
    }
});
</script>
</html>