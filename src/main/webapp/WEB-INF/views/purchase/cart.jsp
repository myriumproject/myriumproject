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
		<c:forEach var="item" items="${cartList}">
			<c:set var="disprice" value="1" />

			<div class="cartContentsWrap">
				<!-- 상품 이미지 -->
				<div class="cartImgWrap">
					<a href="#"> <img class="cartImg" src="${pageContext.request.contextPath}/resources/img/${item.thumbnail.img_path}" />
					</a>
				</div>

				<!-- 상품 정보 및 조작 버튼 -->
				<div class="cartContents">
					<div class="cartTitle">${item.product.product_name}</div>
					<c:if test="${item.product.discount_price == 0}">
						<div class="cartPrice" style="font-weight: bold">
							<span class="productPrice" data-price="${item.product.product_price}"> <fmt:formatNumber value="${item.product.product_price}" type="number" />
							</span>원
						</div>
					</c:if>
					<c:if test="${item.product.discount_price != 0}">
						<div class="cartPrice">
							<s><fmt:formatNumber value="${item.product.product_price}" type="number" groupingUsed="true" />원</s>
						</div>
						<div class="cartPrice" style="color: red; font-weight: bold;">
							${item.product.total_discountrate}% <span class="productPrice" data-price="${item.product.discount_price}"> <fmt:formatNumber value="${item.product.discount_price}" type="number" />
							</span>원
						</div>
					</c:if>

					<div class="cartDelivery">배송: 3,000원[조건] / 기본배송</div>

					<div class="cartCount">
						<button type="button" class="buttonMinus" onclick="changeQuantity('decrease', this)" data-product-id="${item.product.id}">-</button>
						<input type="number" class="productQty" name="quantity" id="quantity" value="${item.inCart.quantity}" min="1" readonly />
						<button type="button" class="buttonPlus" onclick="changeQuantity('increase', this)" data-product-id="${item.product.id}">+</button>
					</div>



					<!-- 상품 삭제 -->
					<div class="cartDelete">
						<button type="submit" class="productDel" onclick="deleteProduct('increase', this)" data-product-id="${item.product.id}">상품삭제</button>
					</div>
				</div>
			</div>
		</c:forEach>
		<hr><br>
		
		<c:if test=" $${'{total}'}"></c:if>
		<!-- 총 결제 예정 금액 -->
		<div class="cartTotal" style="text-align: right; font-size: 20px; font-weight: bold;">
				
		
		</div>

		<!-- 주문 버튼 -->
		<form action="/purchasepage" method="get">
			<button type="submit" class="cartPurchase">주문하기</button>
		</form>

	</div>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
<script src="${pageContext.request.contextPath}/resources/js/deleteProduct.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/updateTotalPrice.js"></script>
<script>
  // 수량 변경 함수
  function changeQuantity(action, button) {
    const container = button.closest('.cartCount');
    const qtyInput = container.querySelector('input[name="quantity"]');
    const productId = button.getAttribute('data-product-id');

    let currentQty = parseInt(qtyInput.value);

    if (action === 'increase') {
      currentQty += 1;
    } else if (action === 'decrease' && currentQty > 1) {
      currentQty -= 1;
    } else {
      return;
    }

    // UI에 수량 반영
    qtyInput.value = currentQty;

    // AJAX 요청 보내기 (서버에 수량 업데이트)
    fetch('/cart/updateQuantity', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]')?.getAttribute('content') || '' // CSRF 토큰
      },
      body: JSON.stringify({
        productId: productId,
        quantity: currentQty
      })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('서버 오류 발생');
      }
      return response.json();
    })
    .then(data => {
      console.log('수량 업데이트 성공:', data);
      updateTotalPrice();
    })
    .catch(error => {
      console.error('수량 업데이트 실패:', error);
      alert('수량 변경에 실패했습니다.');
    });
  }
  
  
  document.addEventListener("DOMContentLoaded", updateTotalPrice);
</script>

</html>
