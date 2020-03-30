/**
 * 
 */

$(document).ready(function() {
	sessionStorage.clear(); // 세션스토리지 비워주기
	
   // 선택한 도시번호 추가하기
   $(".item").on("click", function() {
      $('#select_detail_view_city').css("display", "block");
      var city = $(this).attr("id");
      var city_no = $("#"+city).data("no");
      var city_name = $("#" + city).data("ci_name");
      $("#city_no").val(city_no);
      $(".cityname").html(city_name);
   });

   // 입력한 여행 제목 추가하기
   $("#modal-name").blur(function () {
      var traveltitle = $("#modal-name").val();
      if(traveltitle == null  || traveltitle == ""){
         return;
      } else {
         $("#title").val(traveltitle);
      }
   });

   // 모달 생성
   $("#createplan-modal").on("click", function () {
      $("#createmodal").css("display", "block");
      $('#select_detail_view_city').css("display", "none");
   });

   // close 버튼 클릭시 모달 창 닫기
   $(".modal_btn_close").on("click", function () {
      $("#createmodal").css("display", "none");
   });
   
   // 검은색 부분 아무데나 클릭시 모달 창 끄기
   $(window).on("click", function(e){
      if(e.target.id == $("#createmodal").attr("id")){
         $("#createmodal").css("display", "none");
      }
   });
   // 데이터 detail 페이지로 전달
   $("#submitDetail").on("click", function() {
      var traveltitle = $("#modal-name").val();
      // 입력한 날짜 추가
      var travelDate = $("#testDatepicker").val(); 
      $("#schedule_date").val(travelDate);
      
      // 빈칸 검사
      if(traveltitle == null  || traveltitle == ""){
         alert("제목을 입력해주세요!");
         return;
      } else if(travelDate == null || travelDate == ""){
         alert("날짜를 입력하세요");
         return;
      } else {
         $("#createform").submit();
      }
   });
      
   $(function() {
       $( "#testDatepicker" ).datepicker({
       });
   });
   
   $(function() {
	$("#datepickBtn").datepicker({
	});
})
});
