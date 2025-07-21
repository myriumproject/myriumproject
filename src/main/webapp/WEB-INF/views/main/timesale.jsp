<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_01.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
            <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_02.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
            <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_03.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
            <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_04.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
            <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_01.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
            <div class="swiper-slide timesaleSliderIn">
        	  <img src="resources/img/gardening/cilantro/cilantro_02.jpg" alt="1000" />
              <h6>1000</h6>
              <p class="content">1000</p>
              <p class="originalPrice"><s>1000원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">1000</span>
                1000원
              </p>
            </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<script>
  new Swiper("#timesale-swiper", {
    spaceBetween: 10,
    slidesPerView: 4,
    loop: false,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    autoplay: {
      delay: 4000,
    },
  });

  function goToDetail(id) {
    location.href = "/detail/timesale/" + id;
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
</script>

</body>
</html>
