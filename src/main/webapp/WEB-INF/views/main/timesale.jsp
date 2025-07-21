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
          <!-- AJAX로 아이템이 추가될 영역 -->
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

  <script>
    fetch("https://notuna87.github.io/noh_myrium_json/timesale.json")
      .then(response => response.json())
      .then(data => {
        const container = document.getElementById("timesale-container");

        data.forEach(item => {
          const disPrice = Math.round(item.price * (1 - item.discount / 100));
          const slide = document.createElement("div");
          slide.className = "swiper-slide";

          slide.innerHTML = `
            <div class="timesaleSliderIn" onclick="goToDetail(${item.id})">
              <img src="/noh_myrium/${item.imgUrl[0]}" alt="${item.title}" />
              <h6>${item.title}</h6>
              <p class="content">${item.content}</p>
              <p class="originalPrice"><s>${item.price.toLocaleString()}원</s></p>
              <p class="salePrice">
                <span style="color: #e32e15">${item.discount}%</span>
                ${disPrice.toLocaleString()}원
              </p>
            </div>
          `;

          container.appendChild(slide);
        });

        new Swiper("#timesale-swiper", {
        	  spaceBetween: 10,
        	  slidesPerView: 4,
        	  loop: true,
        	  pagination: {
        	    el: "#timesale-pagination", // 이 부분도 ID로!
        	    clickable: true,
        	  },
        	  autoplay: {
        	    delay: 4000,
        	  },
        	});
      })
      .catch(err => console.error(err));

    function goToDetail(id) {
      location.href = "/detail/timesale/" + id;
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
  </script>

</body>
</html>