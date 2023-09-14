<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.top-color {
  border-top: 3px solid #6aab9c; 
}
#empImg{
   text-align: center;
}
.apprvBtn{
    margin-right: 10px;
}
.btnTd , .table{
   text-align: center;
}
.swal2-title{
   font-size: 1.70em;
}
.reson-title{
   color: firebrick;
}

#overflow::-webkit-scrollbar {
   display: none; /* 크롬, 사파리, 오페라, 엣지 */
}

#authComList tr:nth-child(even) {
    background-color: rgba(106, 171, 156, 0.1); 
    color: black;
}

#authAprvList tr:nth-child(even) {
    background-color: rgba(106, 171, 156, 0.1);
    color: black;
}


/* .SWAL2-CONFIRM{ */
/*    WIDTH: INHERIT; */
/* } */

</style>

 <!-- Body: Body -->
	<div class="body d-flex py-3">

		<div class="container-xxl">
			<div class="col-md-8 col-lg-8"
				style="display: flex; flex-direction: column; width: 50%;">
				<!-- 2행 1열 카드 시작 -->
				<div class="row g-3 mb-3" style="flex: 1; display: flex; width: 224%; margin-left:-100px; margin-top: -36px;">
					<div class="col-md-4 col-lg-4"
						style="width: 210%; margin-bottom: 1%; flex-grow: 1;">
						<div class="card h-100 top-color">
							<div
								class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0" style="margin-bottom: -25px;">
								<h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c;">승인대기</h6>
							</div>
							<div class="card-body" style="width: 100%; ">
								<div style="height: 60px;">
									<table class="table table-hover align-middle mb-0" style="width: 100%">
										<thead>
											<tr style="border-bottom: 1px solid black;">
												<th style="width: 68px;">번호</th>
												<th style="width: 185px;">사번</th>
												<th style="width: 129px; padding-right: 6px;">직원명</th>
												<th style="width: 262px; text-align: right; padding-right: 83px;">주민번호</th>
												<th style="width: 204px; padding-left: 1px;">부서명</th>
												<th style="width: 195px;">승인상태</th>
												<th style="width: 193px; text-align: left; padding-left: 2px;">승인신청일시</th>
												<th style="width: 128px; padding-right: 6px;">OTP(여/부)</th>
												<th style="width: 267px; padding-left: 0px;">첨부파일</th>
												 <th style="width: 182px;"></th>
											</tr>
										</thead>
									</table>
								</div>

								<div id="overflow"
									style="height: 300px;  overflow-y: scroll;">
									<table class="table table-hover align-middle mb-0" style="width:100%">
										<tbody id="authAprvList">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				
				<!-- 2행 1열 카드 종료 -->
				
					<div class="col-md-4 col-lg-4"
						style="width: 210%; margin-bottom: 1%; flex-grow: 1;">
						<div class="card h-100 top-color">
							<div
								class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0" style="margin-bottom: -25px;">
								<h6 class="bi bi-chevron-right" style="font-weight: 700; font-size: 16px; color: #173b6c;">반려목록</h6>
							</div>
							<div class="card-body d-flex flex-column" style="width: 100%;">
						    <div style="height: 60px; overflow-x: auto;">
						        <table class="table table-hover align-middle mb-0" style="width: 100%">
						            <thead>
						                <tr style="border-bottom: 1px solid black;">
						                  		<th style="width: 68px;">번호</th>
												<th style="width: 185px;">사번</th>
												<th style="width: 129px; padding-right: 6px;">직원명</th>
												<th style="width: 262px; text-align: right; padding-right: 83px;">주민번호</th>
												<th style="width: 204px; padding-left: 1px;">부서명</th>
												<th style="width: 195px;">승인상태</th>
												<th style="width: 193px; text-align: left; padding-left: 2px;">승인신청일시</th>
												<th style="width: 128px; padding-right: 6px;">OTP(여/부)</th>
												<th style="width: 267px; padding-left: 0px;">첨부파일</th>
												<th style="width: 182px;"></th>
						                </tr>
						            </thead>
						        </table>
						    </div>
								<div id="overflow"
									style="height: 300px;  overflow-y: scroll;">
									<table class="table table-hover align-middle mb-0" style="width:100%">
										<tbody id="authComList">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
<!-- 첨부파일 모달 -->
<div id="attachmentModal" class="modal fade" data-url="${viewURL}" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 200px;"> <!-- 모달창 위치 (일단 가운데로 맞춰놓음) -->
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="modalTitle" style="margin: 0 auto;">${empNm}님의 첨부파일</h1>
<!--                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>
            <div class="modal-body" id="empImg" style="    width: 235px; height: 250px; margin: 0 auto;">
                <!-- 이미지를 표시할 공간 -->
                <img id="attachmentImage" src="" alt="첨부 이미지" style="max-width: 100%;">
            </div>
            <div class="modal-footer" style="margin-top: 60px;">
                <button type="button" class="btn-close" data-bs-dismiss="modal" style="margin: 0 auto;"></button>
            </div>
        </div>
    </div>
</div>

<!-- Modal end-->
   <!-- 반려사유 Modal -->
   <div class="modal fade" id="returnModal" tabindex="-1" aria-labelledby="returnModal" style="display: none;" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-body">
               <div class="col-md-12 col-lg-6" style="width: 100%; margin-right: 1px">
                  <div class="card mb-3">
                     <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0" style="height: 0px;">
                     </div>
                     <div class="card-body">
                        <div class="tab-pane" id="tab6" role="tabpanel"   aria-labelledby="tab6-tab">
                              <form id="returnForm">
                                 <div class="row g-3 align-items-center">
                                    <div class="recordDtl" style="display:none; "></div>
                                    <div class="col-md-12">
                                       <input type="text" class="form-control form-label" id="reason" name="reason" placeholder="반려 사유를 입력하세요." style="width: 100%;"/>
                                              </div>
                                    <div class="col-md-12" style="text-align: right; margin-top: 24px;">
                                       <input type="submit" id="reasonSubmitBtn" class="btn btn-danger" value="저장"/>
                                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                              </div>
                                 </div>
                              </form>
                        </div>
                        <!-- 기록 end -->
                     </div>
                  </div>
               </div>
            </div>
<!--             <div class="modal-footer"> -->
<!--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
<!--             </div> -->
         </div>
      </div>
   </div> <!-- 반려사유입력 모달 끝 -->
   
<!-- Plugin Js-->
<script src="<%=request.getContextPath() %>/resources/dist/assets/bundles/dataTables.bundle.js"></script>

<!-- Jquery Page Js -->
<script src="<%=request.getContextPath() %>/resources/js/template.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
var aprvYn = '';

loadAuthRequestList1(aprvYn);
loadAuthRequestList2(aprvYn);

var reason = '';
//승인대기 리스트
function loadAuthRequestList1(aprvYn){
   
   $.getJSON("<c:url value='/admin/authAprvList.do'/>",{aprvYn:aprvYn}).done(function(resp){ //list 출력 전 데이터 담아오기
      //list 출력
      let tbody=$("#authAprvList");
      tbody.empty();
      var i = 1;
      $(resp).each(function(index,list){
         
         let stat = "";
         let otpYn = "";
            if (list.reqStatus === "N") {
               stat = "승인";
              if(list.emp.empOtp === null ) {
                  list.emp.empOtp = "부";
               } else  {
                  list.emp.empOtp = "여";
               }
               
               var tr = $("<tr>").append(
                       $("<td>").html(i)
                       ,$("<td>").addClass("reqCode").html(list.reqCode).attr("style","width: 200px; display: none;")
                       ,$("<td>").addClass("empNo").attr("style", "width: 200px;").html(list.empNo)
                       ,$("<td>").addClass("empNm").html(list.empNm)
                       ,$("<td>").css("width", "100px").html(list.empIdentino).attr("style","width: 205px; text-align: right;")
                       ,$("<td>").html(list.dept.deptNm).attr("style","width: 219px; text-align:left; padding-left: 91px;")
                       ,$("<td>").html(stat).attr("style","width:135px; text-align:right; padding-left: 64px;")
                       ,$("<td>").html(list.authoreqDate).attr("style","width:163px; text-align:right;")
                       ,$("<td>").html(list.emp.empOtp).attr("style","width:180px; text-align:right; padding-right: 25px;")
                       ,$("<td>").addClass("text-end").append(
                             $("<button>").addClass("btn btn-outline-info attachmentBtn").attr("type","button").text("첨부파일 보기")
                          )
                       ,$("<td>").addClass("btnTd").append(
                             $("<button>").addClass("btn btn-outline-primary apprvBtn").attr("type","button").text("승인")
                             ,$("<button>").addClass("btn btn-outline-danger cancelBtn").attr("type","button").text("반려")
                             )
                       );
            } else {
                stat = "승인완료";
            }
         tbody.append(tr);
         i++;
      });
   });
}

//반려목록 리스트
function loadAuthRequestList2(aprvYn){
   
   $.getJSON("<c:url value='/admin/authComList.do'/>",{aprvYn:aprvYn}).done(function(resp){ //list 출력 전 데이터 담아오기
      //list 출력
      let tbody=$("#authComList");
      tbody.empty();
      var i = 1;
      $(resp).each(function(index,list){
         let stat = "";

            if (list.reqStatus === "D" ) {
               stat = "반려";
                if(list.emp.empOtp === null) {
                	list.emp.empOtp = "부";
               } else  {
            	   list.emp.empOtp = "여";
               } 
               
               var tr = $("<tr>").append(
            		   $("<td>").html(i)
                       ,$("<td>").addClass("reason").attr("style","display: none;").html(list.reason)
                       ,$("<td>").addClass("reqCode").html(list.reqCode).attr("style","width: 200px; display: none;")
                       ,$("<td>").addClass("empNo").attr("style", "width: 200px;").html(list.empNo)
                       ,$("<td>").addClass("empNm").html(list.empNm)
                       ,$("<td>").css("width", "100px").html(list.empIdentino).attr("style","width: 205px; text-align: right;")
                       ,$("<td>").html(list.dept.deptNm).attr("style","width: 219px; text-align:left; padding-left: 91px;")
                       ,$("<td>").html(stat).attr("style","width:135px; text-align:right; padding-left: 64px;")
                       ,$("<td>").html(list.authoreqDate).attr("style","width:163px; text-align:right;")
                       ,$("<td>").html(list.emp.empOtp).attr("style","width:180px; text-align:right; padding-right: 25px;")
                       ,$("<td>").addClass("text-end").append(
                             $("<button>").addClass("btn btn-outline-info attachmentBtn").attr("type","button").text("첨부파일 보기")
                          )
                        ,$("<td>").addClass("btnTd").append(
                         $("<button>").addClass("btn btn-outline-primary reasonBtn").attr("type","button").attr("style","margin-right: 7px;").text("반려사유")
                         ,$("<button>").addClass("btn btn-outline-secondary reasonDel").attr("type","button").attr("id","reasonDel"+i).attr("value",list.reqCode).append(
                           $("<i>").addClass("icofont-ui-delete text-danger")
                        )
                      )
                   );
            } else {
                stat = "승인완료";
            }
         tbody.append(tr);
         i++;
      });
   });
}

//toast
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

//담아온 데이터
var streFileNm = '';
var atchSn = 0;

$(document).ready(function(){
    
   //$(aprvSelect).trigger('change'); 이거 주석해야 모달창 나옴
   
   $(document).on("click", ".attachmentBtn", function(event) {
        var currentRow = $(this).closest('tr');
        let reqCode = currentRow.find(".reqCode").text();
        
        let empNm = currentRow.find(".empNm").text(); // 직원명을 가져옴

        // 모달 타이틀 업데이트
        $("#modalTitle").text(empNm + "님의 첨부파일");
        
        $.getJSON("<c:url value='/admin/fileNameSearch.do'/>",{reqCode:reqCode}).done(function(resp){
           streFileNm = resp.streFileNm;
         atchSn = resp.atchFileId;
          $(".attachmentBtn").data("atchSn", atchSn);
         // 첨부파일 가져오는 경로 
           let attachmentUrl = "${pageContext.request.contextPath}/resources/images/atch/" + streFileNm; 
           
            var imgTag = $("<img>").attr("src", attachmentUrl).css("max-width", "100%");
            
            // 모달 내용에 이미지 추가
            $("#attachmentModal .modal-body").html(imgTag);

            // 모달 열기
            $("#attachmentModal").modal("show");
        });
        
    });
    
   //승인처리
   $(document).on("click", ".apprvBtn" ,function(event){
      
      var currentRow = $(this).closest('tr');

      var reqCode = currentRow.find('.reqCode').text();
      var who = currentRow.find('.empNo').text();
      atchSn = $(".attachmentBtn").data("atchSn");
      Swal.fire({
          title: '승인 처리 하시겠습니까?',
          text: "",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '확인'
         }).then((result) => {
           if (result.isConfirmed) {
            $.getJSON("<c:url value='/admin/authReqApprv.do' />", {who:who, reqCode:reqCode, atchSn:atchSn}).done(function(resp){
               Toast.fire({
                    icon: 'success',
                    title: '승인처리 완료.'
                });
               //list 재출력
               let tbody=$("#aprvReqList");
               tbody.empty(); //이전 내용 지우기
               loadAuthRequestList1(aprvYn);
            }).fail(function(){
               Swal.fire({
                    text: '승인 처리 실패',  
                    icon: 'error'                         
                  });
            });
           }
      })
   });
   
   //반려처리
   $(document).on("click", ".cancelBtn", function(event){
      var currentRow = $(this).closest('tr');

      var reqCode = currentRow.find('.reqCode').text();
      var who = currentRow.find('.empNo').text();
      
      Swal.fire({
          title: '반려 처리 하시겠습니까?',
          text: "",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '확인'
         }).then((result) => {
           if (result.isConfirmed) {
              //모달창으로 반려 사유 입력하기
            $('#returnModal').modal('show');
            $('#returnForm').on('submit',function(event){
               event.preventDefault();
              var formData = {
                    empNo:who
                    ,reqCode:reqCode
                    ,reason:$('#reason').val()
                    }
              
              $.ajax({
                 type: 'POST',
                 url: '<c:url value="/admin/authReturn.do"/>',
                 data: JSON.stringify(formData),
                 contentType: 'application/json',
                 success: function (response) {
                     Swal.fire('반려 처리 성공');
                     
                     $('#returnModal').modal('hide');
                        // 데이터를 다시 불러와 테이블을 갱신
                        loadAuthRequestList1(aprvYn);
                        loadAuthRequestList2(aprvYn);
                 },
                 error: function(xhr, textStatus, error){
                     Swal.fire({
                        text:'반려 처리 실패',
                        icon: 'error'
                        });
                 }
              })
               
            });
           }
      })
   });
   
   //반려 사유확인 버튼
   $(document).on("click", '.reasonBtn', function(event){
		var currentRow = $(this).closest('tr');
		reason = currentRow.find('.reason').text();
		
		Swal.fire(
			{title: "<span class=reson-title>"+reason+"</span>"}
		);
   });
   
   //반려사유 확인 후 삭제
   $(document).on('click',".reasonDel",function(){
      var reqCodeBtn = this.id
      var reqCode = $("#"+reqCodeBtn).val()
      
      Swal.fire({
       title: '승인 신청을 삭제 하시겠습니까?',
       text: "",
       icon: 'warning',
       showCancelButton: true,
       confirmButtonColor: '#3085d6',
       cancelButtonColor: '#d33',
       confirmButtonText: '확인'
      }).then((result) => {
        if (result.isConfirmed) {
           $.getJSON("<c:url value='/admin/reqDelete.do'/>", {reqCode:reqCode}).done(function(resp){
               //list 재출력
               let tbody=$("#aprvReqList");
               tbody.empty(); //이전 내용 지우기
                   loadAuthRequestList2(aprvYn);
           });
              Swal.fire('삭제 완료')
        }
      });
   })
   
});


</script>