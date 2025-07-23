<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>타임세일</title>

<!-- Swiper CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<style>
.swiper {
	width: 100%;
	height: 70%;
	display: flex;
}

.swiper-slide {
	width: 24%;
}

.timesaleSliderIn {
	cursor: pointer;
	text-align: center; /* 글씨 가운데 정렬 */
}

.timesaleSliderIn img {
	width: 100%;
	height: auto;
}

.originalPrice {
	color: gray;
	font-size: 0.9em;
}

.salePrice {
	font-weight: bold;
}

.timeSaleWrap {
	padding: 20px;
}

.timeSale h2 {
	margin: 0;
}
</style>
</head>
<body>

	<div class="timeSaleWrap">
		<div class="timeSale">
			<h2>🕙 타/임/세/일</h2>
			<p>바로 지금이 제일 저렴해요!</p>
			<div class="swiper" id="timesale-swiper">
				<div class="swiper-wrapper" id="timesale-container">
					<c:forEach var="item" items="${timesaleList}">
						<div class="swiper-slide timesaleSliderIn">
							<img src="resources/img/${item.thumbnail.img_path}" alt="1000" />
							<h6>${item.product.product_name}</h6>
							<p class="content">${item.product.product_content}</p>
							<p class="originalPrice">
								<s>${item.product.product_price}원</s>
							</p>
							<p class="salePrice">
<<<<<<< HEAD
								<span style="color: #e32e15">임시 %</span> ${item.product.product_price}원
=======
								<span style="color: #e32e15">${item.product.total_discountrate}%</span> ${item.product.discount_price}원
>>>>>>> main
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<script>
		new Swiper("#timesale-swiper", {
			spaceBetween : 10,
			slidesPerView : 4,
			loop : false,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			autoplay : {
				delay : 4000,
			},
		});

		function goToDetail(id) {
			location.href = "/detail/timesale/" + id;
			window.scrollTo({
				top : 0,
				behavior : "smooth"
			});
		}
	</script>

</body>
</html>
