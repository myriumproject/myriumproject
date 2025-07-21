<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<html>
<head>
  <title>마이리움</title>

  <!-- reset css  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

  <!-- Swiper CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
</head>
<body>
  <%@ include file="/WEB-INF/views/main/topad.jsp" %>
  <%@ include file="/WEB-INF/views/main/header.jsp" %>
  <%@ include file="/WEB-INF/views/main/slider.jsp" %>
  <%@ include file="/WEB-INF/views/main/timesale.jsp" %>
  <%@ include file="/WEB-INF/views/main/spring.jsp" %>
  <%@ include file="/WEB-INF/views/main/howgrow.jsp" %>
  <%@ include file="/WEB-INF/views/main/myriumstory.jsp" %>
  <%@ include file="/WEB-INF/views/main/ceopick.jsp" %>
  <%@ include file="/WEB-INF/views/main/advertise.jsp" %>
  <%@ include file="/WEB-INF/views/main/footer.jsp" %>
  <!-- 상단 광고 Swiper 인스턴스 초기화 -->

</body>
</html>
