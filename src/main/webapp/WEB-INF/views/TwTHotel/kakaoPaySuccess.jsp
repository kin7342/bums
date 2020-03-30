<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>결제 완료</title>

</head>
<body>
 



<div style="height: 500px">

<form action="Success.do" method="post" style="text-align:center; height: 500px; "><!-- 호텔에어 컨트롤러 -->
<h2 style="margin-top: 150px;">카카오페이 결제가 정상적으로 완료되었습니다.</h2>

<h4 style="margin-top: 50px;">결제 내용 : ${hotelname}</h4>

<h4 style="margin-top: 50px;">결제금액 : ${price}</h4>

<input type="hidden" id="m_code" name="m_code" value="${m_code }">
<input type="hidden" id="reservation_hr_code" name="reservation_hr_code" value="${hr_code }">
<input type="hidden" id="reservation_h_code" name="reservation_h_code" value="${h_code }">
<input type="hidden" id="checkin_date" name="checkin_date" value="${checkin }">
<input type="hidden" id="checkout_date" name="checkout_date" value="${checkout }">
<input type="hidden" id="hb_check" name="hb_check" value="${hb_check }">
<input type="hidden" id="reservation_name" name="reservation_name" value="${uname }">
<input type="hidden" id="hb_people" name="hb_people" value="${hb_people }">

	
<input type="hidden" value="${hotelname}" name="hotelname">
<input type="submit" value="확인" 
style="height: 60px; width:300px; border: 0px; background-color: #FAE100; font-size: 30px; margin-top: 100px;">
</form>

</div>






<%-- 결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/> --%>


 
<%-- <h2>[[${info}]]</h2> --%>
 
</body>
</html>