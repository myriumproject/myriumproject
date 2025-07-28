<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>장바구니</title>
<!-- reset css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>


</head>
<body>
	<%@ include file="/WEB-INF/views/main/topad.jsp"%>
	<%@ include file="/WEB-INF/views/main/header.jsp"%>


	<div class="cartWrap">

		<!-- 제목 -->
		<h5 style="padding: 50px; font-size: 22px; text-align: center;">장바구니</h5>

		<!-- 주문 단계 표시 -->
		<div class="orderSequence">
			<ul>
				<li>1.장바구니</li>
				<li class="cartliMiddle">2.주문서작성</li>
				<li style="color: #939393;">3.주문완료</li>
			</ul>
		</div>

		<!-- 장바구니 목록 -->
		<c:forEach var="item" items="${cart}">
			<c:set var="disprice" value="${item.price - (item.price * item.discount / 100)}" />

			<div class="cartContentsWrap">
				<!-- 상품 이미지 -->
				<div class="cartImgWrap">
					<a href="${pageContext.request.contextPath}/detail/${item.kind}/${item.id}"> <img class="cartImg" src="${pageContext.request.contextPath}/resources/img/${item.imgurl[0]}" alt="${item.name}" />
					</a>
				</div>

				<!-- 상품 정보 및 조작 버튼 -->
				<div class="cartContents">
					<div class="cartTitle">${item.name}</div>
					<div class="cartPrice">
						<s><fmt:formatNumber value="${item.price}" type="number" />원</s>
					</div>
					<div class="cartPrice" style="color: red; font-weight: bold;">
						${item.discount}%
						<fmt:formatNumber value="${disprice}" type="number" />
						원
					</div>
					<div class="cartDelivery">배송: 3,000원[조건] / 기본배송</div>

					<!-- 수량 조절 버튼 (기능은 JavaScript로 연결해야 함) -->
					<div class="cartCount">
						<form action="/cart/decrease" method="post" style="display: inline;">
							<input type="hidden" name="id" value="${item.id}" />
							<button type="submit" class="buttonPlus">-</button>
						</form>

						<p>${item.count}</p>

						<form action="/cart/increase" method="post" style="display: inline;">
							<input type="hidden" name="id" value="${item.id}" />
							<button type="submit" class="buttonMinus">+</button>
						</form>
					</div>

					<!-- 상품 삭제 -->
					<form action="/cart/delete" method="post">
						<input type="hidden" name="id" value="${item.id}" />
						<button type="submit" class="productDel">상품삭제</button>
					</form>
				</div>
			</div>
		</c:forEach>

		<!-- 총 결제 예정 금액 -->
		<div class="cartTotal" style="margin-top: 30px; text-align: right; font-size: 20px; font-weight: bold;">
			<span style="font-size: 14px; margin-right: 30px;">결제예정금액</span>
			<fmt:formatNumber value="${totalPrice}" type="number" />
			원
		</div>

		<!-- 주문 버튼 -->
		<form action="/order/checkout" method="post">
			<button type="submit" class="cartPurchase">주문하기</button>
		</form>

	</div>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>
