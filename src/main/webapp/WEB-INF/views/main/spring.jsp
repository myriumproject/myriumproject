<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>미리 만나는 봄</title>
<style>
.springWrap {
	padding: 40px;
}

.springProductwrap {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.originalPrice s {
	color: gray;
}

.more {
	margin-top: 20px;
	padding: 10px 20px;
}
</style>
</head>
<body>
	<div class="springWrap">
		<div class="spring">
			<h2>미리 만나는 봄 🌱</h2>
			<p>마이리움 식물키트</p>
			<div class="springProductwrap" id="springProductwrap">
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_01.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_02.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_03.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_04.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_05.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
				<div class="springProduct">
					<img src="resources/img/flower/babysbreath/babysbreath_06.jpg" alt="1" style="width: 100%; height: auto;" />
					<h4>임시</h4>
					<p class="springContent">임시</p>
					<p class="originalPrice">
						<s>1000원</s>
					</p>
					<p class="salePrice">
						<span style="color: #e32e15; margin-right: 5px;">임시할인률%</span>임시 원
					</p>
				</div>
			</div>
			<button class="more" id="loadMoreBtn">상품 더보기</button>
		</div>
	</div>

	<script>
    let items = [];
    let visibleCount = 6;
 
      const btn = document.getElementById("loadMoreBtn");
      if (visibleCount >= items.length) {
        btn.style.display = "none";
      } else {
        btn.innerText = `상품 더보기 ${Math.ceil((visibleCount - 3) / 3)}/${Math.ceil((items.length - 6) / 3)}`;
      }
    }

    function goToDetail(id) {
      location.href = "/detail/kit/" + id;
      window.scrollTo({ top: 0, behavior: "smooth" });
    }

    document.getElementById("loadMoreBtn").addEventListener("click", () => {
      visibleCount = Math.min(visibleCount + 3, items.length);
      renderItems();
    });

    loadData();
  </script>
</body>
</html>
