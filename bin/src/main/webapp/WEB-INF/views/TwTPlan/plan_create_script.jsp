<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 바디 바로 밑 -->
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-56285148-1', 'auto');
	ga('send', 'pageview');

function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}


function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

</script>

<!-- header 안 -->
<script type="text/javascript">
//console.log('ko');
//console.log('ko/plan/create');
	$('#gnb_set_select_currency, #gnb_set_select_lang').on('click', 'li', function(){
		var select_val = $(this).attr('data-val');
      	var select_name = $(this).attr('data-name');

		var data = 'member_srl=1213145&'+select_name+'='+select_val;
			$.ajax({  
				type:'post',
				data:data,
				url:'/api/member/set_session',
				success: function(data){
					if(select_name == 'lang'){
						if(select_val == 'en'){
							location.href='/plan/create';
						}else{
							location.href='/'+select_val+'/plan/create';
						}
					}else{
						location.href='/plan/create';
					}
				}
			}); 
	});

   $.ajax({  
        type:'post',
        url:'/api/alert/get_unread_alert_cnt',
        success: function(data){
			//console.log(data);
        	 if(data.response_result.count > 0){
        		$('#gnb_login_box .cnt').text(data.response_result.count);
        		$('#gnb_login_box .cnt').show();
        	}else{
        		$('#gnb_login_box .cnt').hide();
        	}
        }
   }); 

$('#gnb_notice').click(function(){
		_this_is_open = $(this).attr('data-is_open');
		if(_this_is_open == 0){
			$(this).attr('data-is_open', '1');
			
		$.ajax({  
		        type:'post',
		        url:'/api/alert/get_alert_list',
		        success: function(data){
		        		$('#gnb_login_box .cnt').hide();
		        		//console.log(data);
		        		var html = '<div class="notice_box_arrow"></div>';
		        		
		        		$.each(data.response_data, function(key, val) {
		        			if(val.html_desc && val.img != null){
								if(val.alert_type == '2'){
									var al_link = '/ko/mypage/et_0630673001418979048?type=clipboard&ci_srl='+val.rel_srl;
								}else{
									var al_link = '';
								}
		        				html += '<div class="notice_item" data-link="'+al_link+'">'+cutStr(val.html_desc,85)+'<div class="notice_time">'+val.regdate+'</div></div>';
		        			}
							if(key == 4){
								return false;
							}
		        		});
		        		
		        		html += '<div class="notice_more_box">더보기</div>';
		        		$('#notice_content_box').html(html);
		        		$('#notice_content_box').slideDown();

		        }
	      }); 
	
	}else{
		$('#notice_content_box').slideUp(300);
		$(this).attr('data-is_open', '0');
	}
});

$('#notice_content_box').on('click','.notice_item, .notice_more_box',function(){
	if($(this).attr('data-link') == '' || $(this).attr('data-link') == null){
		location.href="/ko/notice";
	}else{
		location.href=$(this).attr('data-link');
	}
});

$(document).mouseup(function (e){
    var container = $(".et_slide");
    
    var _parent_sel_box = $(e.target).attr('id');


    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0 && _parent_sel_box != 'gnb_notice' 
        && _parent_sel_box != 'gnb_notice_img' && _parent_sel_box != 'hotel_type_filter' 
        && _parent_sel_box != 'hotel_amenity_filter' && _parent_sel_box != 'ht_filter_rank' 
        && _parent_sel_box != 'ht_filter_type' && _parent_sel_box != 'map_tag_select_box' 
        && _parent_sel_box != 'sky_filter_airlines' && _parent_sel_box != 'hotel_rank_filter' ){
    	
	    	// ... nor a descendant of the container
	        container.slideUp(300);
    
		    $('.et_slide_parent').removeClass('on');
		    $('.et_slide_parent').attr('data-is_open','0');

    }
});  

</script>

<!-- body end 위 -->
<script type="text/javascript">
var map;
var prev_infowindow =false;
var currentMark = false;
var markers = [];
var markerarray = [];
var s_markers = [];
var wayp;
var i_wins = [];
var marker_img = '/res/img/worldmap/normal_marker_off.png';
var marker_img_on = '/res/img/worldmap/normal_marker_on.png';
var marker_img_sk = '/res/img/worldmap/skt_pin.png';

$(document).ready(function(){
		var map_width = $( window ).width() - 336;
	var map_height = $( window ).height() -64;
	var map_list_height = $( window ).height() - 167;
	// $('#right_full_box').css('width',map_width+'px');
	// $('#right_full_box').css('height',map_height+'px');
	$('#country_list_box').css('height',map_height-121);
	$('#city_list_box').css('height',map_height-121);
  	$('#selected_cities').css('max-height',map_height-200);

	$('#map').css('width',map_width+'px');
	$('#map').css('height',map_height+'px');
	
	$('#full_wrap').css('height',map_height+'px');
	$('#map_spot_list').css('height',map_list_height+'px');
	$('#top_menu').css('width',map_width+'px');
	initialize();
});

$( window ).resize(function() {
	var map_width = $( window ).width() - 336;
	var map_height = $( window ).height() - 64;
	var map_list_height = $( window ).height() - 167;
	// $('#right_full_box').css('width',map_width+'px');
	// $('#right_full_box').css('height',map_height+'px');
	$('#country_list_box').css('height',map_height-121);
	$('#city_list_box').css('height',map_height-121);
	$('#selected_cities').css('max-height',map_height-200);
	
	$('#map').css('width',map_width+'px');
	$('#map').css('height',map_height+'px');
	
	$('#full_wrap').css('height',map_height+'px');
	$('#map_spot_list').css('height',map_list_height+'px');
	$('#top_menu').css('width',map_width+'px');
});

$('#date_pick_btn').click(function(){
	$('#date_pick').show();
});

$('#date_pick').datepicker({
	numberOfMonths:1,
	prevText:'',
	nextText:'',
	monthNames : [
		'1월', //1월', 
		'2월', //2월', 
		'3월', //3월', 
		'4월', //4월', 
		'5월', //5월', 
		'6월', //6월', 
		'7월', //7월', 
		'8월', //8월', 
		'9월', //9월', 
		'10월', //10월', 
		'11월', //11월', 
		'12월'], //12월'],
  	monthNamesShort : [
		'1월', //1월', 
		'2월', //2월', 
		'3월', //3월', 
		'4월', //4월', 
		'5월', //5월', 
		'6월', //6월', 
		'7월', //7월', 
		'8월', //8월', 
		'9월', //9월', 
		'10월', //10월', 
		'11월', //11월', 
		'12월'], //12월'],
	dayNames:['SUN','MON','TUE','WED','THU','FRI','SAT'],
	dayNamesShort:['SUN','MON','TUE','WED','THU','FRI','SAT'],
	dayNamesMin:['SUN','MON','TUE','WED','THU','FRI','SAT'],
	dateFormat:'yy-mm-dd',
	minDate:0,
	maxDate: '+1Y',
	hideIfNoPrevNext: true,
	onSelect: function (dateText, inst) {
		console.log(dateText);
		$('#date_pick_btn .pn_date_info').text(dateText);
		$('#date_pick_btn').attr('data',dateText);
		$('#date_pick').fadeOut();
  	},
  	onClose:function(selectedDate){
		var _this_start_day = selectedDate;
		var _this_select_day = $('.ht_checkout').val();

		var between_day = date_gap(_this_start_day, _this_select_day);

		if(between_day > 29){
		  alert('');
		  $('.ht_checkin').val('');
		}        
  	}
});

$('#cat_menu li').click(function(){
	$('#cat_menu li').removeClass('on');
	$(this).addClass('on');
	deleteMarkers();
	$('#city_list_box').hide();
	$('#city_list_title').hide();
	$('#country_list_box').show();
	$('#country_list_title').show();
	get_country_list();
});

$('#country_list_box').on('click','.item',function(){
	_cu_srl = $(this).attr('data');
	_cu_name = $(this).attr('data-val');
	deleteMarkers();
	$('#country_list_box').hide();
	$('#country_list_title').hide();
	$('#city_list_box').show();
	$('#city_list_title').show();
	if(_cu_srl == 205){
		get_ko_state(_cu_name);
	}else{
		get_city_list(_cu_srl,_cu_name);
	}
});

$('#city_list_title').on('click','.back_btn',function(){
	deleteMarkers();
	_go_state = $(this).attr('data-go_state');
	if(_go_state == '1'){
		get_ko_state('대한민국');
	}else{
		$('#city_list_box').hide();
		$('#city_list_title').hide();
		$('#country_list_box').show();
		$('#country_list_title').show();
		get_country_list();
	}
});

$('#selected_cities').on('click','.del_city_btn',function(){
	$(this).parent().parent().remove();
	draw_city_route();
});

$('#selected_cities').on('mouseover','.del_city_btn',function(){
	_img_src = $(this).find('img').attr('src');
	_c_img_src = _img_src.replace('_a.png','_b.png');
	$(this).find('img').attr('src',_c_img_src);
});

$('#selected_cities').on('mouseout','.del_city_btn',function(){
	_img_src = $(this).find('img').attr('src');
	_c_img_src = _img_src.replace('_b.png','_a.png');
	$(this).find('img').attr('src',_c_img_src);
});

$('#selected_cities').on('click','.city_set_minus_btn',function(){
	_now_set = $(this).parent().find('.city_set_day_info span').text();
	if(_now_set == '1'){
		_chg_set = 0.5;
	}else if(_now_set == '0.5'){
		_chg_set = 0.5;
	}else{
		_chg_set = Number(_now_set) - 1;
	}
	$(this).parent().find('.city_set_day_info span').text(_chg_set);
	$(this).parent().parent().parent().find('.city_set_day_info span').text(_chg_set);
	$(this).parent().parent().parent().attr('data-day',_chg_set);
	total_day_calc();

});

$('#selected_cities').on('click','.city_set_plus_btn',function(){
	_total_day = $('#selected_cities').attr('data');
	_now_set = $(this).parent().find('.city_set_day_info span').text();
	if(_now_set == '0.5'){
		_chg_set = 1;
	}else{
		_chg_set = Number(_now_set) + 1;
	}
	$(this).parent().find('.city_set_day_info span').text(_chg_set);
	$(this).parent().parent().parent().attr('data-day',_chg_set);
	total_day_calc();

});

$('#schedule_full_box').on('mouseover','.item',function(){
		var no = $(this).attr('data-no');
	if(markers[no]){
       markers[no].setZIndex(9);
       markers[no].setIcon('/res/map/marker/ic_current.png');
	}
});

$('#schedule_full_box').on('mouseout','.item',function(){
		var no = $(this).attr('data-no');
	if(markers[no]){
       markers[no].setZIndex(1);
       markers[no].setIcon('/res/img/worldmap/normal_marker_off.png');
	}
});

function initialize() {
	var styles = [{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#444444"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#46bcec"},{"visibility":"on"}]}];

	var mapOptions = {
		center: new google.maps.LatLng(29.324242, 147.697405),
		zoom: 3,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map"), mapOptions);
	//    map.setOptions({styles: styles});

	get_country_list();
}

function get_country_list(){
	_ct_code = $('#cat_menu li.on').attr('data');
	_ct_name = $('#cat_menu li.on').attr('data-val');
	$('#country_list_title .ct_title').text(_ct_name);
	var data = {'ct_code':_ct_code}
		$.ajax({
			type: "post",
			url: "/api/country/get_country_list2",
			data : data,
			dataType :"json",
			success: function(data) {
				console.log(data);
				html = '';
				$.each(data.response_data, function(key, val) {
					html += '<div class="item" data-no="'+key+'" data="'+val.cu_srl+'" data-latlng="'+val.cu_lat+','+val.cu_lng+'" data-val="'+val.cu_name+'">';
					html += '<div class="img_box fl"><img src="'+val.cu_img+'"></div>';
					html += '<div class="info_box fl"><div class="info_title">'+val.cu_name+'</div><div class="info_sub_title">'+val.cu_name_en+'</div></div>';
					html += '<div class="clear"></div></div>';
					add_marker_country(val.cu_lat,val.cu_lng,val.cu_name,val.cu_name_en,val.cu_srl,key);
				});
				$('#country_list_box').html(html);

			},error:function(data){
				console.log(data);
			},complete:function(){
				fitBoundsToVisibleMarkers();
			}
		});
}

function get_city_list(_cu_srl,_cu_name){
	$('#city_list_title .cu_title').text(_cu_name);
	console.log(_cu_srl);
	var data = {'ci_cu':_cu_srl,"option":"DETAIL"}
		$.ajax({
			type: "post",
			url: "/api/city/get_city_list",
			data : data,
			dataType :"json",
			success: function(data) {
				console.log(data);
				html = '';
				
				$.each(data.response_data.city_list, function(key, val) {
					html += '<div class="item" data-no="'+key+'" data="'+val.ci_srl+'" data-ci_name="'+val.ci_name+'" data-lat="'+val.ci_lat+'" data-lng="'+val.ci_lng+'">';
					html += '<div class="img_box fl"><img src="'+val.ci_image+'"></div>';
					html += '<div class="info_box fl"><div class="info_title">'+val.ci_name+'</div><div class="info_sub_title">'+val.ci_name_en+'</div></div>';
					html += '<div class="spot_to_inspot"><img src="/res/img/workspace/new/spot_to_inspot_a.png"></div>';
					html += '<div class="clear"></div></div>';
					add_marker_city(val.ci_lat,val.ci_lng,val.ci_name,val.ci_name_en,val.ci_srl,key,0);
				});
				$('#city_list_box').html(html);
				

			},error:function(data){
				console.log(data);
			},complete:function(){
				fitBoundsToVisibleMarkers();
			}
		});
	console.log(_ct_code);
}

function add_marker_country(_lat, _lng, cu_name, cu_name_en, cu_srl) {
	var marker_position = new google.maps.LatLng(_lat,_lng);
	var marker = new MarkerWithLabel({
			position: marker_position,
			map: map,
			icon: marker_img,
			title: cu_name,
			title_en : cu_name_en,
			cu_srl: cu_srl,
			lat:_lat,
			lng:_lng,
			labelContent: cu_name,
		    labelAnchor: new google.maps.Point(-11, 30),
			    labelClass: "labels", // the CSS class for the label
		    labelStyle: {opacity: 0.75}
		});
			markers.push(marker);
			google.maps.event.addListener(marker, 'click', function() {
				deleteMarkers();
				$('#country_list_box').hide();
				$('#country_list_title').hide();
				$('#city_list_box').show();
				$('#city_list_title').show();
				if(cu_srl == '205'){
					get_ko_state(cu_name);
				}else{
					get_city_list(cu_srl, cu_name);
				}
			});
			
}

function add_marker_city(_lat, _lng, ci_name, ci_name_en, ci_srl, no, is_state) {
	var marker_position = new google.maps.LatLng(_lat,_lng);

	city_marker_img = marker_img;
	
	var marker = new MarkerWithLabel({
			position: marker_position,
			map: map,
			icon: city_marker_img,
			title: ci_name,
			title_en : ci_name_en,
			cu_srl: ci_srl,
			lat:_lat,
			lng:_lng,
			labelContent: ci_name,
		    labelAnchor: new google.maps.Point(-11, 30),
			    labelClass: "labels", // the CSS class for the label
		    labelStyle: {opacity: 0.75}
		});
			markers.push(marker);
			google.maps.event.addListener(marker, 'click', function() {
				console.log(ci_name);
				console.log(is_state);
				if(is_state == '1'){
					 deleteMarkers();
     				 get_ko_city_in_state(ci_srl,ci_name);
				 }else{
					_html = '<div class="s_cities" data-ci="'+ci_srl+'" data-day="2" data-lat="'+_lat+'" data-lng="'+_lng+'"><div class="city_route_info"><div class="city_distance_info fl">0Km</div><a href="http://flights.earthtory.com" target="_blank"><div class="city_air_search_btn fr">항공검색</div></a><div class="clear"></div></div>';
					_html += '<div class="city_info"><div class="del_city_btn fl"><img src="/res/img/workspace/new/del_city_btn_a.png"></div><div class="fl">'+ci_name+'</div>';
					_html += '<div class="fr city_set_day_box"><div class="fl city_set_minus_btn"><img src="/res/img/workspace/new/city_item_minus_btn.png"></div><div class="fl city_set_day_info"><span>2</span>일</div>';
					_html += '<div class="fl city_set_plus_btn"><img src="/res/img/workspace/new/city_item_plus_btn.png"></div><div class="clear"></div></div><div class="clear"></div></div>';
					_html += '</div>';
					$('#selected_cities').append(_html);
					draw_city_route();
				 }
			});
}

$('#city_list_box').on('click','.spot_to_inspot',function(){
		ci_srl = $(this).parent().attr('data');
		_lat = $(this).parent().attr('data-lat');
		_lng = $(this).parent().attr('data-lng');
		ci_name = $(this).parent().attr('data-ci_name');
		_html = '<div class="s_cities" data-ci="'+ci_srl+'" data-day="2" data-lat="'+_lat+'" data-lng="'+_lng+'"><div class="city_route_info"><div class="city_distance_info fl">0Km</div><a href="http://flights.earthtory.com" target="_blank"><div class="city_air_search_btn fr">항공검색</div></a><div class="clear"></div></div>';
		_html += '<div class="city_info"><div class="del_city_btn fl"><img src="/res/img/workspace/new/del_city_btn_a.png"></div><div class="fl">'+ci_name+'</div>';
		_html += '<div class="fr city_set_day_box"><div class="fl city_set_minus_btn"><img src="/res/img/workspace/new/city_item_minus_btn.png"></div><div class="fl city_set_day_info"><span>2</span>일</div>';
		_html += '<div class="fl city_set_plus_btn"><img src="/res/img/workspace/new/city_item_plus_btn.png"></div><div class="clear"></div></div><div class="clear"></div></div>';
		_html += '</div>';
		$('#selected_cities').append(_html);
		draw_city_route();

});

$('#city_list_box').on('click','.item.state',function(){
	_is_state = $(this).attr('data-is_state');
	_ci_srl = $(this).attr('data');
	deleteMarkers();
	_this_st_name = $(this).attr('data-ci_name');
	get_ko_city_in_state(_ci_srl,_this_st_name);
});

function add_s_marker(_lat, _lng) {
	var s_marker_img = '/res/img/workspace/new/select_marker.png';
	var marker_position = new google.maps.LatLng(_lat,_lng);
	var marker = new google.maps.Marker({
			position: marker_position,
			map: map,
			icon: s_marker_img,
			lat:_lat,
			lng:_lng,
			zIndex:9999999999999
	});
	s_markers.push(marker);
}

function draw_city_route(){
    $( "#selected_cities" ).sortable({
  		revert: false,
		start: function (e, ui) {
			$(ui.placeholder).css('width', 0);
			//$('.city_route_info').hide();
			$(ui.item).find('.city_route_info').hide();
			$(ui.item).css('height','41px');
		},
      	change: function (e, ui) {
          	$(ui.placeholder).css('width', 'auto');
      	},
	  	stop: function (e, ui){
		  	$(ui.item).find('.city_route_info').show();
		 	// $('#selected_cities .s_cities .city_route_info').show();
		  	$('#selected_cities .s_cities .city_route_info').first().hide();
	  	},
      	placeholder: "ui-state-highlight",
      	update: function(event, ui){
        	draw_city_route();
      	}
    }).disableSelection();

	console.log(markerarray);
	console.log(wayp);
	console.log('');

	s_deleteMarkers();

    if(markerarray.length > 0){
		console.log('라인지우기');
//         markerarray.setMap(null);
 		wayp.setMap(null);
 		markerarray = [];
    }
			
	now_select_city_cnt = $('#selected_cities .s_cities').length;
	console.log('now_select_city_cnt:'+now_select_city_cnt);
	
	if(now_select_city_cnt > 0){
		$('#select_detail_view_city').show("slide", { direction: "left" }, 200);
	}else{
		$('#select_detail_view_city').hide("slide", { direction: "left" }, 200);
	}

	var i = 0;
	$('#selected_cities .s_cities').each(function() {
		_lat = $(this).attr('data-lat');
		_lng = $(this).attr('data-lng');
		console.log(_lat);
		var latlng = new google.maps.LatLng(parseFloat(_lat), parseFloat(_lng));
        markerarray.push(latlng);
		console.log(markerarray);
		_this_latlng = _lat+','+_lng;
		add_s_marker(_lat, _lng);
		if(i == 0){
			$(this).find('.city_route_info').hide();
		}else{
			$(this).find('.city_route_info').show();
			_this_distance = distance_calc(_prev_latlng,_this_latlng);
			$(this).find('.city_route_info .city_distance_info').text(_this_distance+'Km');
		}
		_prev_latlng = _lat+','+_lng;
		i++;
	});
    var color='#ff4a4a';

    var lineSymbol = {
         path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
    };
    
    wayp = new google.maps.Polyline({
        path: markerarray,
        icons: [{
              icon: lineSymbol,
              repeat:'100px',
              offset: '100%'
              }],
        geodesic: true,
        strokeColor: color,
        strokeOpacity: 1.0,
        strokeWeight: 1.5
   	});
    
	wayp.setMap(map);
	total_day_calc();
}

function total_day_calc(){
	var _total_day = 0;
	$('#selected_cities .s_cities').each(function() {
		_this_day = $(this).attr('data-day');
		_total_day = _total_day + Number(_this_day);
	});
	$('#selected_cities').attr('data',_total_day);
}

function setAllMap(map) {
	console.log(markers);
  	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
  	}
}

function clearMarkers() {
		setAllMap(null);
}

function deleteMarkers() {
		clearMarkers();
  	markers = [];
}


function s_setAllMap(map) {
	console.log(markers);
  	for (var i = 0; i < s_markers.length; i++) {
		s_markers[i].setMap(map);
  	}
}

function s_clearMarkers() {
		s_setAllMap(null);
}

function s_deleteMarkers() {
		s_clearMarkers();
  	s_markers = [];
}

function distance_calc(s_latlng,d_latlng){
    //alert(s_latlng);
    var slatlng = s_latlng.split(',');
    lat1 = slatlng[0];
    lon1 = slatlng[1];
    //alert(lon1);
    var dlatlng = d_latlng.split(',');
    lat2 = dlatlng[0];
    lon2 = dlatlng[1];

    var radlat1 = Math.PI * lat1/180
    var radlat2 = Math.PI * lat2/180
    var radlon1 = Math.PI * lon1/180
    var radlon2 = Math.PI * lon2/180
    var theta = lon1-lon2
    var radtheta = Math.PI * theta/180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
    dist = Math.acos(dist)
    dist = dist * 180/Math.PI
    dist = dist * 60 * 1.1515
    dist = dist * 1.609344 
    dist = Math.round(dist*100)/100;

    return dist;
}

function fitBoundsToVisibleMarkers() {
	var bounds = new google.maps.LatLngBounds();

    for (var i=0; i<markers.length; i++) {
        if(markers[i].getVisible()) {
            bounds.extend( markers[i].getPosition() );
        }
    }
    map.fitBounds(bounds);
}

function get_ko_state(_cu_name){
	$('#city_list_title .cu_title').text(_cu_name);
	$.ajax({
		type: "post",
		url: "/api/city/get_ko_state",
		dataType :"json",
		success: function(data) {
			console.log(data);
			html = '';
		
			$.each(data.response_data, function(key, val) {
				if(val.is_state == 1){
					html += '<div class="item state" data-no="'+key+'" data="'+val.ci_srl+'" data-ci_name="'+val.ci_name+'" data-lat="'+val.ci_lat+'" data-lng="'+val.ci_lng+'" data-is_state="'+val.is_state+'" style="background: url(\'/res/img/workspace/new/cu_next_icon.png\') no-repeat 225px 30px;">';
				}else{
					html += '<div class="item" data-no="'+key+'" data="'+val.ci_srl+'" data-ci_name="'+val.ci_name+'" data-lat="'+val.ci_lat+'" data-lng="'+val.ci_lng+'" data-is_state="'+val.is_state+'">';
				}
				if(val.ci_srl <10208){
					html += '<div class="img_box fl"><img src="'+val.ci_image+'"></div>';
				}else{
						html += '<div class="img_box fl"><img src="/res/img/city/ko_state/ko_'+val.ci_srl+'.jpg"></div>';
				}
				html += '<div class="info_box fl" style="width:140px;"><div class="info_title">'+val.ci_name+'</div><div class="info_sub_title">'+val.ci_name_en+'</div></div>';
				if(val.is_state != 1){
					html += '<div class="spot_to_inspot"><img src="/res/img/workspace/new/spot_to_inspot_a.png"></div>';
				}

				html += '<div class="clear"></div></div>';
				console.log(val.is_state);
				add_marker_city(val.ci_lat,val.ci_lng,val.ci_name,val.ci_name_en,val.ci_srl, key, val.is_state);

			});
			$('#city_list_box').html(html);
			$('#city_list_title .back_btn').attr('data-go_state','0');

		},error:function(data){
			//console.log(data);
		},complete:function(){
			fitBoundsToVisibleMarkers();
		}
	});
}

function get_ko_city_in_state(st_srl, st_name){
	$('#city_list_title .cu_title').text(st_name);
	$.ajax({
		type: "post",
		url: "/api/city/get_ko_city_in_state",
		dataType :"json",
		data:{'st_srl':st_srl},
		success: function(data) {
			console.log(data);
			html = '';
		
			$.each(data.response_data, function(key, val) {
				html += '<div class="item" data-no="'+key+'" data="'+val.ci_srl+'" data-ci_name="'+val.ci_name+'" data-lat="'+val.ci_lat+'" data-lng="'+val.ci_lng+'" data-is_state="0">';
				html += '<div class="img_box fl"><img src="'+val.ci_image+'"></div>';
				html += '<div class="info_box fl"><div class="info_title">'+val.ci_name+'</div><div class="info_sub_title">'+val.ci_name_en+'</div></div>';
				html += '<div class="spot_to_inspot"><img src="/res/img/workspace/new/spot_to_inspot_a.png"></div>';
				html += '<div class="clear"></div></div>';
				add_marker_city(val.ci_lat,val.ci_lng,val.ci_name,val.ci_name_en,val.ci_srl, key, 0);
			});
			$('#city_list_box').html(html);
			$('#city_list_title .back_btn').attr('data-go_state','1');

		},error:function(data){
			//console.log(data);
		},complete:function(){
			fitBoundsToVisibleMarkers();
		}
	});
}
</script>


</body>
</html>