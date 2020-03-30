$(document).ready(function() {
   // Day1 세션 스토리지 기본 생성
   var spot_obj = JSON.parse(sessionStorage.getItem("Day1"));
   var city_name = $(".list_title").children("span").text(); // 현재 선택된 도시명 가져오기

   if(spot_obj == null){
     // 세션에 key값이 없는 경우에 기본 객체 생성
     var spot_arr = new Array(null, null, null, null, null, null, null, null, null, city_name);
     var jsonItem = new Object();
     jsonItem['index1'] = spot_arr;
     sessionStorage.setItem("Day1", JSON.stringify(jsonItem));
   }

   //cat_menu 생성
   set_storage_schedule();
   
   // Day1 요일설정
/*   var day1_date = get_departure_date(); // Day 1 날짜 가져오기
   $(".cat_left_date").html(day_add_zero(day1_date));
   $(".day_menu.on").attr("data-date",day_add_zero(day1_date));
   $(".day_menu.on").attr("data-day_week",day1_date.getDay());
   var day1_label = date_to_label(day1_date.getDay()); // 요일 반환 함수
   $(".cat_right_weekday").html(day1_label);*/


   var day_num = $(".day_menu.on").attr("data");
   var this_date = $(".day_menu.on").attr("data-date");
   var weekday = date_to_label($(".day_menu.on").attr("data-day_week"));
   
   $(".schedule_detail_title_text").children(".fl").html(
          "<div class='fl'>DAY" + day_num + " " + "<span style='color:white'>|</span> " + this_date + "("+ weekday+") </div>"
      );
   // $(".cat_right_city").text(city_name);
   
   // Day 1에 띄워줄 정보
   create_spot_detail(1);

   // 저장된 예산정보 기본으로 띄워주기
   set_storage_budget();

   //date_info 설정
   set_info_date();

});


$(document).ready(function(){

/*   // 페이지 새고로침 액션
   $(window).on("beforeunload", function() {
      return 'test';
   });*/

   // 일정에 MouseHover 했을때 동작
   $(document).on("mouseenter",".day_spot_item",function(){
      $(this).children(".item_ctrl_box").css("display", "block" );
   });

   $(document).on("mouseleave",".day_spot_item",function(){
      $(this).children(".item_ctrl_box").css("display", "none" );
   });



   // 추가한 스팟 삭제 및 재설정
   $(document).on("click",".btn_del",function(){
      var spot_num = $(this).parents("#schedule_detail_box").children().length; // 일정에 넣어둔 spot_item 갯수
      var spot_del_index = // 삭제하려는 index 값
          $(this).parents(".day_spot_item").children(".img_box").children(".spot_order_box").html();

      //예산처리
      sub_totalBudget(spot_del_index); // 빼는 경우.

      // index 숫자 재설정
      var del_type = $(this).parent().parent().data("type"); // 삭제하려는 스팟의 type
      var tmp = $(this).parent().parent().data("img"); // 삭제할는 스팟의 index(show() 리스트에서)

      if(spot_del_index == spot_num){
         // 삭제하려는 숫자가 끝번호인 경우는 숫자 재배치가 필요없음
         $(this).parents(".day_spot_item").remove(); // 일정 삭제 메소드

         spot_item_delete(spot_del_index); // 세션데이터 삭제

         if($("#schedule_detail_box").children().length == 0){
            // 기본값 넣어주기
            var set_day = $(".day_menu.on").attr("data"); //Key값 설정
            var city_name = $(".list_title").children("span").text(); // 현재 선택된 도시명 가져오기
            var spot_arr = new Array(null, null, null, null, null, null, null, null, null, city_name);
            var jsonItem = new Object();
            jsonItem['index1'] = spot_arr;

            sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
         }

      } else {
         // 세션값도 지워주기
         var set_day = $(".day_menu.on").attr("data"); //Key값 설정
         var spot_obj = JSON.parse(sessionStorage.getItem("Day"+set_day));
         sessionStorage.removeItem("Day"+set_day);

         delete spot_obj['index' + spot_del_index]; // 해당하는 세션 노드 삭제

         var update_index = Number(spot_del_index);
         // 번호재배치
         for(var i = spot_del_index; i <= spot_num; i++){
            $(this).parents("#schedule_detail_box").children().eq(i).children(".img_box").children(".spot_order_box").text(i);
            var id = $(this).parents("#schedule_detail_box").children().eq(i).attr("id", "spot"+i);
            var data_val = $(this).parents("#schedule_detail_box").children().eq(i).attr("data",  i);

            // 세션 index 재배치
            update_index++;
            spot_obj['index' +  i] = spot_obj['index' + update_index];
            delete spot_obj['index' + update_index];

         }
         // 삭제
         $(this).parents(".day_spot_item").remove();

         // 수정한 내용 세션에 다시 저장
         sessionStorage.setItem("Day"+set_day, JSON.stringify(spot_obj));
      }

      // 스팟 삭제시 마커 이미지 변경
      var del_seq = $(this).parent().parent().data("seq"); // 삭제하려는 마커의 index
      var del_type = $(this).parent().parent().data("type"); // 삭제하려는 마커의 type
      delMarkerIcon(del_seq,del_type);

      // 스팟 삭제시 찍힌 폴리라인 삭제 후 재생성
      for(var i=0;i<paths.length;i++){
         paths[i].setMap(null);
      }
      paths = [];
      addPath();
   });

   $("#schedule_clear").on("click", function() {
      if(confirm("초기화 하시겠습니까?")){
         // 예산에 들어간 값도 다 날려버리기
         day_budget_clear();

         // 스팟 초기화시 마커이미지 변경 & 폴리라인 삭제
         del_marker_path();

         // 세션에 저장한 값도 날려주기
         var set_day = $(".day_menu.on").attr("data"); //Key값 설정
         sessionStorage.removeItem("Day"+set_day);

         $("#schedule_detail_box").children().remove();

         if($("#schedule_detail_box").children().length == 0){
            // 기본값 넣어주기
            var city_name = $(".list_title").children("span").text(); // 현재 선택된 도시명 가져오기
            var spot_arr = new Array(null, null, null, null, null, null, null, null, null, city_name);
            var jsonItem = new Object();
            jsonItem['index1'] = spot_arr;

            sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
         }

      } else {
         alert("취소 되었습니다.");
      }
   });

   // datepicker 선언
   $(function() {
      $("#datepick_input").datepicker({
         showOn : "both",
         buttonImage : "/twt/resources/images/plan/plan_detail/pn_cal_edit_btn2.png",
         buttonImageOnly : true,
         onSelect : function(dateText) {
            // 수정된 날짜 클릭시 시작 날짜 변경
            var date = $(this).val();
            $(".start_date").text(date);
         }
      });

      $("#start_day").datepicker();
   }); // date picker end

   // 장소 검색 엔터로 입력시 search
   $(document).on("keydown", "#input_search", function(e) {
      if(e.keyCode == 13){
         // 전체 검색 메소드
         var input_val = $(this).val(); // 입력한 값
         var search_type = $("#search_type").val(); // 도시별 검색인지, 전체 검색인지.
         var name_num = $(".list_box").children(".day_spot_item").length; // 전체 검색 시 가져올 것들 갯수

         if(search_type == "city"){
            var city_code = $(".city_item").data("code");
            for(i = 0; i < name_num + 1; i++){
               var name = $(".list_box").children(".day_spot_item").eq(i).data("name");
               var city_val = $(".list_box").children(".day_spot_item").eq(i).data("city");
               if(name.indexOf(input_val) == -1 && city_code == city_val){
                  $(".list_box").children(".day_spot_item").eq(i).hide();
               } else {
                  $(".list_box").children(".day_spot_item").eq(i).show();
               }
            }
         } else if(search_type == "total"){
            for(i = 0; i < name_num + 1; i++){
               var name = $(".list_box").children(".day_spot_item").eq(i).data("name");
               if(name.indexOf(input_val) == -1){
                  $(".list_box").children(".day_spot_item").eq(i).hide();
               } else {
                  $(".list_box").children(".day_spot_item").eq(i).show();
               }
            } // 전체검색 end
         } else{
            alert("검색타입이 올바르지 않습니다. 다시 확인해 주세요");
         }
      }
   }); // 장소 검색 - 1(검색창으로) end

   // 검색 타입 선택
   $(document).on("click", ".radio", function(){
      $(".radio").removeClass("on");
      $(this).addClass("on");
      $(".check").attr("class", "far fa-circle check");
      $(this).children(".et-radio").children().attr("class", "far fa-check-circle check");

      if($(this).hasClass("on")){ // search type 바꿔주기
         var type = $(this).data("val");
         $("#search_type").val(type);
      }
   });

   // 검색 카테고리 사진 변경
   $(document).on("click", ".list_cat_item", function() {
      pre_img = $('.list_cat_item.on img').attr('src');
      pre_change_img = pre_img.replace('_c','_a');
      $('.list_cat_item.on img').attr('src', pre_change_img);
      $('.list_cat_item.on').removeClass('on');

      this_img = $(this).find('img').attr('src');
      this_change_img = this_img.replace('_a','_c');
      $(this).find('img').attr('src',this_change_img);
      $(this).addClass('on');

      if($(this).hasClass("on")){
         var type = $(this).data("type");

         var name_num = $(".list_box").children(".day_spot_item").length; // 전체 검색 시 가져올 것들 갯수

         for(i = 0; i < name_num + 1; i++){
            var spot_type = $(".list_box").children(".day_spot_item").eq(i).data("type");
            if(type == spot_type){
               $(".list_box").children(".day_spot_item").eq(i).show();
            } else if(type == "total"){
               $(".list_box").children(".day_spot_item").eq(i).show();
            } else {
               $(".list_box").children(".day_spot_item").eq(i).hide();
            }
         } // 전체검색 end
      }
   });

   // Day 추가하기
   $("#add_plan_day").on("click", function() {
      var day_index = $("#cat_menu").children().length + 1; // 인덱스 번호설정
      var city_name = $(".list_title").children("span").text(); // 현재 선택된 도시명 가져오기

      var dep_date = get_departure_date(); // 시작날짜
      dep_date.setDate(dep_date.getDate() + day_index - 1); // 지난 날 만큼 계산

      var weekday = date_to_label(dep_date.getDay()); // 요일설정
      var date = day_add_zero(dep_date); // 0붙여주기
      var city_lat = $(".city_item").data("lat"); //  현재 선택된 도시의 위도
      var city_lng = $(".city_item").data("lng"); // 현재 선택된 도시의 경도


      $("#cat_menu").append(
          "<li data='" + day_index + "' data-date='" + date + "' class='day_menu' + data-day_week='" + dep_date.getDay() + "' data-f_lat='" + city_lat +"' data-f_lng='" + city_lng +"'>"
          +    "<div class='fl cat_date_left_box'>"
          +       "<div class='cat_left_day'>DAY" + day_index+ "</div>"
          +      "<div class='cat_left_date'>" + date + "</div>"
          +   "</div>"
          +   "<div class='fl cat_date_right_box'>"
          +      "<div class='cat_right_weekday'> " + weekday +" </div>"
          +      "<div class='cat_right_city'>" + city_name + "</div>"
          +   "</div>"
          +   "<div class='clear'></div>" +
          "</li>"
      );

      // 세션에 빈 값 추가해주기
      var spot_arr = new Array(null, null, null, null, null, null, null, null, null, city_name);
      var jsonItem = new Object();
      jsonItem['index1'] = spot_arr;
      sessionStorage.setItem("Day"+day_index, JSON.stringify(jsonItem));

      // infro 데이터 바꿔주기
      set_info_date();
   });

   
   // 도시변경
   $(document).on("click", ".city_item", function() {
      var citycode = $(this).data("code");
      var citylat = $(this).data("lat");
      var citylng = $(this).data("lng");
      // 도시 변경 map처리
      changecity(citycode,citylat,citylng);

      // ajax 처리
      $.ajax({
         type : "GET",
         url : "selectCity.do?citycode=" + citycode,
         success : function(data) {
            /*alert(data);*/
            $("#city_list").html(data);
            addMarker(); // 변경된 list에 맞춰 마커 찍기
         } ,
         error : function(error) {
            alert("Error : " + error);
         }
      }); // ajax end

      // 해당하는 Day의 index1번 가져오기
      var city_name = $(this).data("ci_name");
      var day_index = $(".day_menu.on").attr("data");
      var spot_obj = JSON.parse(sessionStorage.getItem("Day"+day_index));

      // 도시명바꿔주고, 데이터 다시 집어 넣기
         if(spot_obj['index1'][0] == null){
            var spot_arr = new Array(null, null, null, null, null, null, null, null, null, city_name);
            var jsonItem = new Object();
            jsonItem['index1'] = spot_arr;

            sessionStorage.setItem("Day"+day_index, JSON.stringify(jsonItem));

            $(".day_menu.on").children(".cat_date_right_box").children(".cat_right_city").html(city_name);
      }
         
         // 변경전 도시 위도/경도 삭제
         $(".day_menu.on").removeData("f_lat");
         $(".day_menu.on").removeData("f_lng");
         // 변경된 도시 위도/경도 선택된 day에 set
         $(".day_menu.on").attr("data-f_lat",citylat);
         $(".day_menu.on").attr("data-f_lng",citylng);   

   });


   // Day 선택하기
   $(document).on("click", "#cat_menu li", function() {
      
     // path삭제   
     for(var i=0;i<paths.length;i++){
      paths[i].setMap(null);
     }
     paths = [];   

      $(".day_menu").removeClass("on");
      $(this).addClass("on");
      $("#schedule_detail_box").children().remove();

      var city_name = $(".day_menu.on").children(".cat_date_right_box").children(".cat_right_city").text();
      var city_code = find_city_code(city_name);

      // Day 정보 바꿔주기
      var day_num = $(this).attr("data");
      var this_date = $(this).attr("data-date");
      var weekday = date_to_label($(this).attr("data-day_week"));

      $(".schedule_detail_title_text").children(".fl").html(
          "<div class='fl'>DAY" + day_num + " " + "<span style='color:white'>|</span> " + this_date + "("+ weekday+") </div>"
      );

      // SessionStorage에서 객체 가져오기
      var set_day = $(this).attr("data"); //Key값 설정
      create_spot_detail(set_day);

      // 선택된 day 위도/경도
      var city_lat = $(".day_menu.on").data("f_lat");
      var city_lng = $(".day_menu.on").data("f_lng");

      changecity(city_code, city_lat, city_lng); // 도시 바꿔주기(marker삭제, 센터변경)

      // city_list 초기화
       $.ajax({
          type : "GET",
          url : "selectCity.do?citycode=" + city_code,
          success : function(data) {
              $("#city_list").html(data);
              addMarker(); // 변경된 list에 맞춰 마커 찍기
              
              // 추가된 spot이 없을 때 marker img(Before)
              if($("#schedule_detail_box").children().length == 0){
                 for(var i=0;i<locations.length;i++){ // 전체 marker before mouseover
                    markerOver(marker[i],i,spottype[i]);
                 }
                 
              }else if($("#schedule_detail_box").children().length>0){// 추가된 spot이 있을 때
                 // 전체 marker img(before)
                 for(var i=0;i<locations.length;i++){
                    markerOver(marker[i],i,spottype[i]);
                    
                    // 추가된 spot marker img(After)
                    for(var j=1;j<=$("#schedule_detail_box").children().length;j++){
                       var spot_no = $("#spot"+j).data("no");
                       var spot_seq = find_spot_seq(spot_no);
                       addMarkerIcon(spot_seq,$("#spot"+j).data("type"));
                    }
                 }
              }
           } ,
          error : function(error) {
             alert("Error : " + error);
          }
       }); // ajax end

   });

   // 메모&예산 저장
   $(document).on("click", "#memo_save", function() {
      var budget = $(".budget_input").val();
      var memo = $("#memo_input").val();
      var index = $(".detail_view_full_box").data("no");
      var storage_index
      
      for(var i=1;i<=$("#schedule_detail_box").children().length;i++){
         if($("#spot"+i).data("no") == index){       
            $("#spot"+i).removeData("budget");
            $("#spot"+i).removeData("memo");
            $("#spot"+i).attr("data-budget",budget);
            $("#spot"+i).attr("data-memo",memo);

            // 세션스토리지에 예산정보 저장
            storage_index = Number($("#spot"+i).attr("data"));
            const set_day = $(".day_menu.on").attr("data"); //Key값 설정
            var spot_obj = JSON.parse(sessionStorage.getItem("Day"+set_day));
            spot_obj['index' + storage_index][7] = budget;
            spot_obj['index' + storage_index][8] = memo;
            sessionStorage.setItem("Day"+set_day, JSON.stringify(spot_obj));
         }
      }
      alert("저장되었습니다");
      $("#select_detail_view_spot").hide();

      // total 예산 보여주기
      totalBudget(storage_index);
   });
   
   $("#form_submit").on("click", function() {
      insertPlan();
   });
   
   
   // 파일명 넣어주기
   $("#file").on("change", function() {
      var file_value = $("#file").val().split("\\");
      var file_name = file_value[file_value.length-1];
      
      $("#file_name").val(file_name);
   });

});

// Day 수정 버튼 클릭
function day_edit_start(){
   $('#overlay_day_edit').show();

   // edit용 목록 생성
   cat_menu_edit();
}


//Day 수정 완료
function day_edit_com(){
   $('#overlay_day_edit').hide();
   
   var set_new_Sdate = $(".start_date").text();
   $("#datepick_input").val(set_new_Sdate); // 날짜 재설정
   var city_code = $(".city_item").data("code");
   var title = $("#plan_title").text();
   

   // 완료 클릭시 전체 날짜 변경
   set_storage_schedule();
   // 날짜 변경
   location.href="http://localhost:8787/twt/planDetail.do?schedule_date=" + set_new_Sdate + "&citycode=" + city_code+ "&title= " + title;
}

//날짜 요일 변환 함수
function date_to_label(date){
   var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
   var date_label = week[date]; // 날짜에 따른 요일 반환
   return date_label;
}

// JSON객체 day일정 중간삭제.
function spot_item_delete(delete_index) {
   var set_day = $(".day_menu.on").attr("data"); //Key값 설정
   var spot_obj = JSON.parse(sessionStorage.getItem("Day"+set_day));
   sessionStorage.removeItem("Day"+set_day);
   delete spot_obj['index' + delete_index]; // 해당하는 노드 삭제
   sessionStorage.setItem("Day"+set_day, JSON.stringify(spot_obj)); // 수정한 내용 다시 저장
}

function create_spot_detail(set_day) {
   var spot_obj = JSON.parse(sessionStorage.getItem("Day"+set_day));
   if(spot_obj['index1'][0] != null){ // 세션에 key값이 있는 경우 spot_detail에 뿌려주기
      for(var i = 1; i <= Object.keys(spot_obj).length; i++){
         if(spot_obj['index'+i][0] == null) return; // null인 경우에는 생성하지 않음
         var num = "index"+i;
         var spot_seq = $("#schedule_detail_box").children().length + 1;
         var spot_num = spot_seq - 1;
         var spotcontent = find_content(spot_num);
         var spotaddr = find_addr(spot_num);
//             var spot_arr = new Array(spot_name , spot_type, spot_no, spot_lat, spot_lng, spot_city, spot_img, budget, memo);
//                                     0         1         2      3        4         5         6      7      8
         $("#schedule_detail_box").append("" +
             "<div class='day_spot_item' data='" + spot_seq + "' data-set_day='" + set_day + "' data-budget='" + spot_obj[num][7]+ "' data-memo='" + spot_obj[num][8]+ "' data-img='"+spot_obj[num][6]+"' data-citycd='"+ spot_obj[num][5] +"' data-seq='"+ spot_num +"' data-no='" + spot_obj[num][2] + "' data-pl_cat='301' data-latlng='" + spot_obj[num][3] + "," + spot_obj[num][4] + "' data-lat='" + spot_obj[num][3]+ "' data-lng='" + spot_obj[num][4] +"' data-ci='87' data-type='"+spot_obj[num][1]+"' id='spot" + spot_seq + "'>"
             +   "<div class='item_ctrl_box' style='display: none'>"
             +       "<div class='fl item_set_plan' title='메모&amp;예산' onclick='addbudget(&quot;"+spot_obj[num][2]+"&quot;,&quot;"+spot_obj[num][0]+"&quot;,&quot;"+spot_obj[num][6]+"&quot;,&quot;"+spotcontent+"&quot;,&quot;"+spotaddr+"&quot;,&quot;"+spot_obj[num][5]+"&quot;,&quot;"+spot_obj[num][1]+"&quot;)'><img src='/twt/resources/images/plan/item_set_icon_a.png'></div>"
             +      "<div class='fl btn_del' title='삭제'><img src='/twt/resources/images/plan/item_del_icon_a.png'></div>"
             +      "<div class='clear'></div>"
             +   "</div>"
             +   "<div class='img_box fl'>"
             +      "<div class='spot_order_box'>" + spot_seq + "</div>"
             +      "<img src='/twt/resources/images/plan/" + spot_obj[num][5]+ "/" + spot_obj[num][6] +"'>"
             +      "<div style='position:absolute;top:35px;left:40px;width:22px;height:20px;>"
             +         "<img src='/twt/resources/images/plan/list_memo_btn_off.png' class='memo_indi' style='width:22px;height:20px;'>"
             +      "</div>"
             +   "</div>"
             +   "<div class='fl info_box'>"
             +      "<div class='title'>" + spot_obj[num][0] + "</div>"
             +      "<div class='sub'>" + spot_obj[num][1] +"</div>"
             +      "<div class='sub inspot_day_info_box' style='color:#1a7ad9'></div>"
             +   "</div>"
             +   "<div class='clear'></div>"
             + "</div>" +
             "");

         // 추가된 스팟의 위도/경도 넣어주기
         addPath();
      }
   }
}


function find_content(spot_num) { // content 찾아주는 함수
   var name_num = $(".list_box").children(".day_spot_item").length; // 전체 검색 시 가져올 것들 갯수

   for(i = 0; i < name_num + 1; i++){
      var spot_seq = $(".list_box").children(".day_spot_item").eq(i).data("seq");
      var res
      if(spot_num == spot_seq){
         res = $(".list_box").children(".day_spot_item").eq(i).data("con");
         return res;
      }
   } // 전체검색 end
}

function find_addr(spot_num) { // addr 찾아주는 함수
   var name_num = $(".list_box").children(".day_spot_item").length; // 전체 검색 시 가져올 것들 갯수

   for(i = 0; i < name_num + 1; i++){
      var spot_seq = $(".list_box").children(".day_spot_item").eq(i).data("seq");
      var res
      if(spot_num == spot_seq){
         res = $(".list_box").children(".day_spot_item").eq(i).data("addr");
         return res;
      }
   } // 전체검색 end
}

function day_budget_clear() {
   var total = removeComma($("#total").text());
   // 추가된 모든 예산 계산(더했을 경우)
   for(var i=1;i<=$("#schedule_detail_box").children().length;i++){
      var tmp = $("#spot"+i).data("budget");
      tmp *= -1; // String to int
      total += tmp;
   }

   $("#total").text(total);
}

function sub_totalBudget(num) {
   var total = removeComma($("#total").text());
   // 추가된 모든 예산 계산(더했을 경우)
   var tmp = $("#spot"+num).data("budget");
   tmp *= -1; // String to int
   total += tmp;
   var format = formatnumber(total,"3");
   
   $("#total").html(format);
}

// total budget 계산
function totalBudget(num){
   var total = removeComma($("#total").text());
   // 추가된 모든 예산 계산(더했을 경우)
   var tmp = $("#spot"+num).data("budget");
   tmp *= 1; // String to int
   total += tmp;
   // 포맷설정
   var format = formatnumber(total,"3");

   $("#total").text(format);
}

// 총 예산 콤마 format
function formatnumber(v1,v2){
   var str = new Array();
   v1 = String(v1);
   for(var i=1;i<=v1.length;i++){
      if(i % v2) str[v1.length-i] = v1.charAt(v1.length-i);
      else str[v1.length-i] = ','+v1.charAt(v1.length-i);
   }
   return str.join('').replace(/^,/,'');
}

// 콤마 제거함수
function removeComma(str){
   var number = parseInt(str.replace(/,/g,""));

   return number;
}

// Storage 에있는 예산 값 더해주기
function set_storage_budget() {
   var storage_length = sessionStorage.length;
   var total = removeComma($("#total").text());

   for (var i = 1; i <= storage_length; i++) {
      var spot_obj = JSON.parse(sessionStorage.getItem("Day"+i));

      if(spot_obj != null){
         for(var j = 1; j <= Object.keys(spot_obj).length; j++){
            var num = "index"+j;
            var budget = Number(spot_obj[num][7]);
            total += budget;
         }
      } else {
         return;
      }
   }

   // 포맷 설정
   var format = formatnumber(total,"3");

   // 다시 넣어주기
   $("#total").text(format);
   
}

// Storage_Key 만큼 Day 생성
function set_storage_schedule() {
   var storage_length = sessionStorage.length; // 세션에 있는 Key의 수 가져오기(Day의 수)
   var dep_date = get_departure_date(); // 시작일 가져오기

   for (var i = 1; i <= storage_length; i++) {
      var spot_obj = JSON.parse(sessionStorage.getItem("Day"+i));
       var city_name = spot_obj['index1'][9];
       var weekday = date_to_label(dep_date.getDay()); // 요일 반환하기
       var set_date = day_add_zero(dep_date);
       var spot_lat;
       var spot_lng;
       
       for(j=0; j<= $(".city_item").length; j++){
           if(city_name == $(".city_item").eq(j).data("ci_name")){
              spot_lat = $(".city_item").eq(j).data("lat");
              spot_lng = $(".city_item").eq(j).data("lng");
           }
        }
       
       $("#cat_menu").append(
               "<li data='" + i + "'  data-f_lat='" + spot_lat +"' data-f_lng='" + spot_lng +"' data-day_week='" + dep_date.getDay() + "' data-date='" + set_date  + "' class='day_menu' >"
               +    "<div class='fl cat_date_left_box'>"
               +       "<div class='cat_left_day'>DAY" + i + "</div>"
               +      "<div class='cat_left_date'>" + set_date + "</div>"
               +   "</div>"
               +   "<div class='fl cat_date_right_box'>"
               +      "<div class='cat_right_weekday'>" + weekday +"</div>"
               +      "<div class='cat_right_city'>" + city_name + "</div>"
               +   "</div>"
               +   "<div class='clear'></div>" +
               "</li>"
           );
       
       dep_date.setDate(dep_date.getDate() + 1); // 하루씩 날짜 더해주기
       
       if(i == 1){
          $('.day_menu').addClass('on');
       } 
   }
}

// 현재 설정된 날짜를 가져오는 함수
function get_departure_date() {
   var date_val = $("#datepick_input").val().split("/"); // 날짜 가져오기
   var date_MM = date_val[0]; // 월
   var date_DD = date_val[1]; // 일
   var day1_date = new Date(date_val[2],date_MM, date_DD); // Date 객체 생성
   return day1_date;
}

// date_info 날짜 설정
function set_info_date() {
   var first_date = $("#cat_menu").children().first().attr("data-date");
   var end_date = $("#cat_menu").children().last().attr("data-date");

   $(".full_date_info").html(first_date + " ~ " + end_date);
}

// 날짜 format 0붙여 주기
function day_add_zero(date) {
   var month = date.getMonth();
   var day = date.getDate();

   if((month+"").length < 2){
      month = "0"+month;
   }

   if((day+"").length < 2){
      day = "0" + day;
   }

   return month  + "." + day;
}

// data-date Date객체로 변환
function data_to_date(data) {
   var data_val = data.split(".");
   var dep_date = get_departure_date();
   dep_date.setDate(data_val[1]);
   dep_date.setMonth(data_val[0]);

   var month = dep_date.getMonth();
   var day = dep_date.getDate();

   if((month+"").length < 2){
      month = "0"+month;
   }

   if((day+"").length < 2){
      day = "0" + day;
   }

   return month  + "." + day;
}


// 세션에 있는 만큼 menu_edit_modal 작성
function cat_menu_edit() {
   var storage_length = sessionStorage.length; // 세션에 있는 Key의 수 가져오기(Day의 수)
   var dep_date = get_departure_date(); // 시작일 가져오기

   $("#cat_menu_edit_box").children().remove();
   for (var i = 1; i <= storage_length; i++) {
      var spot_obj = JSON.parse(sessionStorage.getItem("Day"+i));

      var city_name
      if(spot_obj['index1'] == null){
         city_name = "도시가 없습니다";
      } else{
         city_name = spot_obj['index1'][9];
      }

      var weekday = date_to_label(dep_date.getDay()); // 요일 반환하기
      var set_date = day_add_zero(dep_date);

      $("#cat_menu_edit_box").append(
          "<li data='" + i +"' data-date='" + set_date +"' data-day_week='" + dep_date.getDay() + "'>"
          +   "<div class='cat_edit_move fl'></div>"
          +   "<div class='fl cat_date_left_box'>"
          +      "<div class='cat_left_day'>DAY" + i + "</div>"
          +      "<div class='cat_left_date'>" + set_date + "</div>"
          +   "</div>"
          +   "<div class='fl cat_date_right_box'>"
          +      "<div class='cat_right_weekday'>" + weekday +"</div>"
          +      "<div class='cat_right_city'>" + city_name + "</div>"
          +   "</div>"
          +   "<div class='fr cat_edit_del' onclick='del_plan_day(" + i + ")'></div>"
          +   "<div class='clear'></div>"
          + "</li>"
      );

      dep_date.setDate(dep_date.getDate() + 1); // 하루씩 날짜 더해주기
   }

}

function del_plan_day(day_num) {
      if(confirm("정말 삭제하시겠습니까?")){
         /*      if(sessionStorage.length ==0){
                     alert("DAY가 하나인 경우는 삭제하실 수 없습니다.")
                 }*/

         var update_num
         for (var i = day_num; i <= sessionStorage.length; i++) {
            update_num = i + 1;
            sessionStorage.setItem("Day"+i, (sessionStorage.getItem("Day"+update_num)));
         }
         sessionStorage.removeItem("Day"+sessionStorage.length);

      } else {
      return;
   }
   // 목록 재작성
   cat_menu_edit();
}

function find_spot_seq(spot_no) {
   var name_num = $(".list_box").children(".day_spot_item").length; // 전체 검색 시 가져올 것들 갯수

   for(i = 0; i < name_num + 1; i++){
      var select_spot_no = $(".list_box").children(".day_spot_item").eq(i).data("no");
      var res;
      if(select_spot_no == spot_no){
         res = $(".list_box").children(".day_spot_item").eq(i).data("seq");
         return res;
      }
   } // 전체검색 end
}

// city_name으로 city_code 찾기
function find_city_code(city_name){
   var city_code;
   for (var i = 0; i < $(".city_item").length; i++) {
      if($(".city_item").eq(i).data("ci_name") == city_name){
         city_code = $(".city_item").eq(i).data("code");
      }
   }
   return city_code;
}

function del_marker_path() {
   // day 변경시 마커이미지 변경(Before)
   if($("#schedule_detail_box").children().length !=0){
      for(var i=1;i<=$("#schedule_detail_box").children().length;i++){
         var spot_no = $("#spot"+i).data("no");
         var spot_seq = find_spot_seq(spot_no);
         delMarkerIcon(spot_seq,$("#spot"+i).data("type"));
      }

      // day 변경시 찍힌 폴리라인 삭제
      for(var i=0;i<paths.length;i++){
         paths[i].setMap(null);
      }
      paths = [];
   }
}



//드래그 가능 코드
$(function() {
   $("#cat_menu_edit_box").sortable({
      start : function(event, ui) {
         ui.item.data("spos", ui.item.index() + 1);
      },
      stop: function(event, ui) {
         // var data_index = $("#cat_menu_edit_box li").attr("data") - 1; // 현재 클릭한 객체의  index 값
         var data_index = ui.item.data("spos");
         var drop_index = ui.item.index() + 1; // drop하는 곳의 위치 index
         
         if(data_index != drop_index){
            var click_obj = JSON.parse(sessionStorage.getItem("Day" + data_index));  // 클릭한 객체의 sessionData 
            var drop_obj = JSON.parse(sessionStorage.getItem("Day" + drop_index)); // 바꿀 객체의 sessionData
          
            sessionStorage.setItem("Day" + drop_index, JSON.stringify(click_obj));
            sessionStorage.setItem("Day" + data_index, JSON.stringify(drop_obj));
            
            // alert("click index : " + data_index + "  drop_index : " + drop_index); 
            
            
         }
         
         reorder(); // 번호 재정의 함수
   }
   });
});


//번호 재정렬 함수
function reorder() {
   var storage_length = sessionStorage.length; // Session에 있는 Key의 개수 가져오기
   var dep_date = get_departure_date(); // 시작일 가져오기
   
   for (var i = 0; i < $("#cat_menu_edit_box li").length; i++) {
      var day_index = i + 1;
      var set_date = day_add_zero(dep_date) // date 0붙여주기
      var weekday = date_to_label(dep_date.getDay());
      
      $("#cat_menu_edit_box li").eq(i).attr("data", day_index);
      $("#cat_menu_edit_box li").eq(i).children(".cat_date_left_box").children(".cat_left_day").html("DAY" + day_index);
      $("#cat_menu_edit_box li").eq(i).children(".cat_date_left_box").children(".cat_left_date").html(set_date);
      $("#cat_menu_edit_box li").eq(i).children(".cat_date_right_box").children(".cat_right_weekday").html(weekday);
      
      dep_date.setDate(dep_date.getDate() + 1); // Day 하루씩 늘려주기
   } // index 재정의
}


// 파일 업로드 
function insertPlan(){			
	var total_obj = new Object();
	var form_arr = $("#form").serializeObject();
	
	var form_data = new Object(); // form 데이터 
	var day_list = new Object();	
	

	for(var i=1;i<=$(".day_menu").length;i++){
		var spot_obj = JSON.parse(sessionStorage.getItem("Day"+i));
		var spot_code = new Object();
		
		for(var j=1; j<= Object.keys(spot_obj).length; j++){
			spot_code['index' + j] = spot_obj['index' + j][2] + "/" + spot_obj['index'+ j][7] + "/" + spot_obj['index'+j][8];
		}
		
		day_list['day'+i] = spot_code;
	}
	
	total_obj['form_data'] = form_arr;
	total_obj['day_list'] = day_list;
	
	console.log(JSON.stringify(total_obj));
	
 	$.ajax({
		type : "POST",
		url : "insertPlan.do",
		data : JSON.stringify(total_obj),
		dataType : "json",
		contentType : "application/json",
		processData : false,
		success : function(result){
			$("#file_name").val(result.file_name);
			
			$("#form").submit();
			
/*			var form_val = $("#form");
			var send_form = new FormData(form_val);
			alert(form_val + " , " + send_form);
			
			// file ajax
			$.ajax({
				type : "POST",
				url : "fileUpload.do",
				data : send_form,
				processData : false,
				contenType : false,
				success : function() {
					alert("성공")
				},
				erorr : function(request,status,error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}); // file_ajax end
*/			
		},
		erorr : function(request,status,error){
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	
	});

}

jQuery.fn.serializeObject = function() {
   var obj = null;
   try {
      if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
         var arr = this.serializeArray();
         if (arr) {
            obj = {};
            jQuery.each(arr, function() {
               obj[this.name] = this.value;
            });
         }
      }
   } catch (e) {
      alert(e.message);
   } finally {
   }
   return obj;
}
