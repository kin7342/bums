/**
 * 
 */

$(document).ready(function() {
	$(".item").on("click", function() {
		$('#select_detail_view_city').css("display", "block");
		var city_no = $('.item').data("no");	
		$("#city_no").val(city_no);
	});
	
	$('body').on('click','.et_modal_close, .et_modal_bg.on',function(){
		$('.et_modal').remove();
	});
});

function et_modal(width, height, type, loading, url, scroll_type, animation, bg_close, close_type){ //모달
	$('html').css('overflow-y','hidden');
	if(bg_close == '1'){
		var bg_class = 'et_modal_bg on';
	}else{
		var bg_class = 'et_modal_bg';
	}
	var ie8_sc = '';
	if(isIE(8)){
		var bg_class = 'et_modal_bg on';
	}
	if(scroll_type == '0'){
		var m_height = height.replace('px','');
		var margin = parseInt(height)/2;
		var modal_default_html = '<div class="et_modal">';
				modal_default_html += '<div class="et_modal_layer">';
					modal_default_html += '<div class="'+bg_class+'"></div>';
					modal_default_html += '<div class="et_modal_load">로딩중</div>';
					modal_default_html += '<div class="et_modal_window" style="width:'+width+'px;height:'+height+'px;margin-top:-'+margin+'px;top:50%;">';
					if(close_type == '1'){
						modal_default_html += '<div class="et_modal_close">X</div>';
					}
						modal_default_html += '<iframe id="modal_view" border="0" frameborder="0" class="et_iframe" src="" scrolling=no allowTransparency="true"></iframe>';
					modal_default_html += '</div>';
				modal_default_html += '</div>';
			modal_default_html += '</div>';
	}else if(scroll_type == '1'){
		var modal_default_html = '<div class="et_modal">';
				modal_default_html += '<div class="et_modal_layer">';
					modal_default_html += '<div class="'+bg_class+'"></div>';
					modal_default_html += '<div class="et_modal_load">로딩중</div>';
					modal_default_html += '<div class="et_modal_window" style="width:'+width+';height:100%;margin-top:10px;overflow:scroll">';
					if(close_type == '1'){
						modal_default_html += '<div class="et_modal_close">X</div>';
					}
						modal_default_html += '<iframe id="modal_view" scrolling="no" border="0" frameborder="0" class="et_iframe" style="width:1000px;height:1500px;" src="" allowTransparency="true"></iframe>';
					modal_default_html += '</div>';
				modal_default_html += '</div>';
			modal_default_html += '</div>';
	}else if(scroll_type == '2'){
		var m_height = height.replace('px','');
		var margin = parseInt(height)/2;
		var modal_default_html = '<div class="et_modal" style="overflow:hidden;">';
				modal_default_html += '<div class="et_modal_layer">';
					modal_default_html += '<div class="'+bg_class+'"></div>';
					modal_default_html += '<div class="et_modal_load">로딩중</div>';
					modal_default_html += '<div class="et_modal_window" style="width:'+width+';height:'+height+';margin-top:-'+margin+'px;top:50%;overflow:hidden;">';
					if(close_type == '1'){
						modal_default_html += '<div class="et_modal_close">X</div>';
					}
						modal_default_html += '<iframe id="modal_view" scrolling="no" border="0" frameborder="0" class="et_iframe" src="" style="overflow:hidden;" allowTransparency="true"></iframe>';
					modal_default_html += '</div>';
				modal_default_html += '</div>';
			modal_default_html += '</div>';		
	}
}
