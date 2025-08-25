<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>주문조회</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/order_history.css" />
</head>
<body>

<%@ include file="../main/header.jsp" %>

<div class="mypage-layout">
  <!-- 사이드바 -->
  <aside class="sidebar">
    <h2>My Account</h2>
    <div class="sidebar-section">
      <p>쇼핑 정보</p>
      <ul>
        <li>주문내역 조회</li>
      </ul>
    </div>
    <div class="sidebar-section">
      <p>활동 정보</p>
      <ul>
        <li>나의 게시글</li>
      </ul>
    </div>
    <div class="sidebar-section">
      <p>나의 정보</p>
      <ul>
        <li><a href="${pageContext.request.contextPath}/mypage/member_update">회원 정보 수정</a></li>
        <li><a href="${pageContext.request.contextPath}/mypage/change_password">비밀번호 변경</a></li>
        <li>
          <form action="${pageContext.request.contextPath}/logout" method="post" class="logout-form">
            <button type="submit" class="logout-btn">로그아웃</button>
          </form>
        </li>
      </ul>
    </div>
    <button class="inquiry-btn">1:1 문의하기</button>
  </aside>

  <!-- 주문조회 본문 -->
  <div class="order-container">
    <h2>주문조회</h2>

    <div class="tab-menu">
      <button class="tab active" data-tab="order">주문내역조회 (${orderCount})</button>
		<button class="tab" data-tab="cancel">취소/반품/교환 내역 (${cancelCount})</button>
    </div>

    <!-- 주문내역 탭 -->
    <div class="tab-content active" id="order">
      <div class="order-guide-text">
        <p>- 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</p>
        <p>- 취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.</p>
      </div>
	
	<c:choose>
	  <c:when test="${empty groupedOrders}">
	    <div class="empty-msg">주문 내역이 없습니다.</div>
	  </c:when>
	  <c:otherwise>
	    <c:forEach var="entry" items="${groupedOrders}">
	      <c:set var="ordersId" value="${entry.key}" />
	      <c:set var="orders" value="${entry.value}" />
	
	      <div class="order-box">
	        <!-- 주문 상단 정보 -->
	        <div class="order-header">
			  <div class="order-date">
			    <strong>${orders[0].orderDate}</strong> <span>(${orders[0].ordersIdfull})</span>
			  </div>
			  <a href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${orders[0].id}" class="detail-link">상세보기 &gt;</a>
			</div>
			
			<!-- 선택 처리 버튼(모달 오픈) -->
			<div class="order-batch-actions">
			  <button type="button" class="order-btn" onclick="openItemPicker(this, 'cancel')" data-order-id="${orders[0].id}">선택 취소</button>
			  <button type="button" class="order-btn" onclick="openItemPicker(this, 'exchange')" data-order-id="${orders[0].id}">선택 교환</button>
			  <button type="button" class="order-btn" onclick="openItemPicker(this, 'refund')"  data-order-id="${orders[0].id}">선택 반품</button>
			</div>
	
	       <!-- 상품 라인 -->
			<c:forEach var="order" items="${orders}">
			  <div class="order-content"
			       data-product-id="${order.productId}"
			       data-order-status="${order.orderStatus}">
			    <img src="${pageContext.request.contextPath}/upload/${order.img_path}" alt="상품 이미지" class="product-img">
			    <div class="product-info">
			      <p class="product-title">${order.productName}</p>
			      <p class="product-price">
			        <c:if test="${order.discount_price == 0}">
			          <fmt:formatNumber value="${order.productPrice}" pattern="#,###" />원 (${order.quantity}개)
			        </c:if>
			        <c:if test="${order.discount_price != 0}">
			          <fmt:formatNumber value="${order.discount_price}" pattern="#,###" />원 (${order.quantity}개)
			        </c:if>
			      </p>
			    </div>
			  </div>
			</c:forEach>
	
	        <!-- 주문 상태 및 버튼 -->
		<div class="order-status">
		  <p class="status">${orders[0].orderStatusText}</p>
		  <div class="status-buttons">
		    <c:if test="${orders[0].orderStatus == 3}">
		      <button onclick="location.href='${pageContext.request.contextPath}/mypage/review?orderId=${orders[0].id}&productId=${orders[0].productId}'">구매후기</button>
		    </c:if>
		
		    <!--취소신청: 상태 0,1만 노출 -->
		    <c:if test="${orders[0].orderStatus == 0 || orders[0].orderStatus == 1}">
		            <button class="order-btn" onclick="submitRequest('cancel', ${orders[0].id}, ${orders[0].productId}, ${orders[0].orderStatus})">취소신청</button>
		    </c:if>
		
		    <button class="order-btn" onclick="submitRequest('exchange', ${orders[0].id}, ${orders[0].productId})">교환신청</button>
		    <button class="order-btn" onclick="submitRequest('refund', ${orders[0].id}, ${orders[0].productId})">반품신청</button>
		  </div>
		</div>
		</div>
	    </c:forEach>
	  </c:otherwise>
	</c:choose>
    </div> <!-- /tab-content#order -->
    
       <!-- 취소/반품/교환 탭 -->
    <div class="tab-content" id="cancel">
      <div class="order-guide-text">
        <p>- 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</p>
        <p>- 취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.</p>
      </div>
	
		<c:choose>
	  <c:when test="${empty cancelGroupedOrders}">
	    <div class="empty-msg">취소/반품/교환 내역이 없습니다.</div>
	  </c:when>
	  <c:otherwise>
	    <c:forEach var="entry" items="${cancelGroupedOrders}">
	      <c:set var="ordersId" value="${entry.key}" />
	      <c:set var="orders" value="${entry.value}" />
	
	      <div class="order-box">
	        <!-- 주문 정보 상단 -->
	        <div class="order-header">
	          <div class="order-date">
	            <strong>${orders[0].orderDate}</strong> <span>(${orders[0].ordersIdfull})</span>
	          </div>
	          <a href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${orders[0].id}&productId=${orders[0].productId}">상세보기 &gt;</a>
	        </div>
	
	        <!-- 상품 목록 -->
	        <c:forEach var="order" items="${orders}">
	          <div class="order-content">
	            <img src="${pageContext.request.contextPath}/upload/${order.img_path}" alt="${order.product_name}" class="product-img" />
	            <div class="product-info">
	              <p class="product-title">${order.productName}</p>
	              <p class="product-price">
	              <c:if test="${order.discount_price == 0}">
	                <fmt:formatNumber value="${order.productPrice}" pattern="#,###" />원 (${order.quantity}개)
	              </c:if>
				  <c:if test="${order.discount_price != 0}">
	                <fmt:formatNumber value="${order.discount_price}" pattern="#,###" />원 (${order.quantity}개)
				  </c:if>
	              </p>
	            </div>
	          </div>
	        </c:forEach>
	
	        <!-- 주문별 상태 및 버튼 -->
	        <div class="order-status">
	          <p class="status">${orders[0].orderStatusText}</p>
	          <div class="status-buttons">
	            <button>환불영수증</button>
	            <button class="confirm-btn">환불확인</button>
	          </div>
	        </div>
	      </div>
	    </c:forEach>
	  </c:otherwise>
	</c:choose>
    </div> <!-- /tab-content#cancel -->

	<div id="pagination-wrapper">
	  <div class="pagination" id="pagination-content">
	    <!-- 기본은 주문 탭용 -->
	    <button>&lt;</button>
	    <button class="active">1</button>
	    <button>&gt;</button>
	  </div>
	</div>
  </div> <!-- /order-container -->
</div> <!-- /mypage-layout -->



<%@ include file="/WEB-INF/views/main/footer.jsp" %>

<!-- 선택 상품 모달 -->
<div id="itemPickerModal" class="modal" style="display:none;">
  <div class="modal-content">
    <h3 id="itemPickerTitle">상품 선택</h3>
    <div id="itemPickerList" class="item-list"></div>
    <div class="modal-actions">
      <button type="button" onclick="closeItemPicker()">닫기</button>
      <button type="button" class="confirm" onclick="confirmItemPicker()">확인</button>
    </div>
  </div>
</div>


<script> const ctx = "${pageContext.request.contextPath}"; </script>
<script src="${pageContext.request.contextPath}/resources/js/order_history.js"></script>

<script>
const paginationHTML = {
		  order: `
		    <button>&lt;</button>
		    <button class="active">1</button>
		    <button>&gt;</button>
		  `,
		  cancel: `
		    <button>&lt;</button>
		    <button class="active">1</button>
		    <button>&gt;</button>
		  `
		};

		document.querySelectorAll('.tab').forEach(btn => {
		  btn.addEventListener('click', () => {
		    const targetTab = btn.dataset.tab;

		    // 탭 콘텐츠 전환
		    document.querySelectorAll('.tab-content').forEach(tab => {
		      tab.classList.remove('active');
		    });
		    document.getElementById(targetTab).classList.add('active');

		    // 탭 버튼 전환
		    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
		    btn.classList.add('active');

		    // 페이징 갱신
		    document.getElementById('pagination-content').innerHTML = paginationHTML[targetTab];
		  });
		});
		</script>

	
<script>
  // 컨텍스트 경로 (항상 앞에 / 포함)
  const CTX = '<c:url value="/" />';     // 예: "/myrium/"

  // 공통 헤더 (CSRF 자동 주입)
  const BASE_HEADERS = { 'Content-Type': 'application/json' };
  <c:if test="${not empty _csrf}">
    BASE_HEADERS['${_csrf.headerName}'] = '${_csrf.token}';
  </c:if>

  // 전역 함수 (inline onclick에서 호출)
  window.submitRequest = function(type, orderId, productId, currentStatus){
    const MAP = {
      exchange: { status: 4, msg: '교환을 신청하시겠어요?' },
      refund:   { status: 6, msg: '반품을 신청하시겠어요?' }, // 프로젝트에서 6=반품신청
      cancel:   { status: 8, msg: '취소를 신청하시겠어요?', allow: [0,1] }
    };
    const conf = MAP[type];
    if (!conf) return alert('잘못된 요청입니다.');
    if (type === 'cancel' && !conf.allow.includes(Number(currentStatus)))
      return alert('취소신청은 입금전/배송준비중 상태에서만 가능합니다.');
    if (!confirm(conf.msg)) return;

    fetch(CTX + 'mypage/updateOrderStatus', {
      method: 'POST',
      headers: BASE_HEADERS,
      body: JSON.stringify({ orderId: Number(orderId), productId: Number(productId), orderStatus: conf.status })
    })
    .then(res => { if (!res.ok) return res.text().then(t => { throw new Error(t || '요청 실패'); }); })
    .then(() => { alert('요청이 처리되었습니다.'); location.reload(); })
    .catch(err => { console.error(err); alert('서버 요청 중 오류가 발생했습니다.\n' + err.message); });
  };
</script>
<script>
// 액션 정책 (허용 상태 제한)
var ACTION_MAP = {
  cancel:   { status: 8, title: '선택 취소',   allow: [0,1] }, // 입금전/배송준비중만
  exchange: { status: 4, title: '선택 교환',   allow: [3] },   // 배송완료만
  refund:   { status: 6, title: '선택 반품',   allow: [3] }    // 배송완료만
};

var pickerState = { orderId: null, action: null };

// 모달 열기: 버튼(this)와 액션타입('cancel'|'exchange'|'refund')
function openItemPicker(btn, action){
  var conf = ACTION_MAP[action];
  if(!conf){ alert('잘못된 동작입니다.'); return; }

  var orderId = btn.getAttribute('data-order-id');
  pickerState.orderId = Number(orderId);
  pickerState.action  = action;

  // 이 버튼이 속한 주문박스에서 상품 라인들 수집
  var orderBox = btn.closest('.order-box');
  var rows = orderBox.querySelectorAll('.order-content');

  var list = document.getElementById('itemPickerList');
  list.innerHTML = ''; // 초기화
  document.getElementById('itemPickerTitle').innerText = conf.title;

  rows.forEach(function(row, idx){
    var pid   = Number(row.getAttribute('data-product-id'));
    var st    = Number(row.getAttribute('data-order-status'));
    var title = row.querySelector('.product-title') ? row.querySelector('.product-title').textContent : ('상품 '+(idx+1));

    var allowed = !conf.allow || conf.allow.indexOf(st) >= 0;

    var wrap = document.createElement('label');
    wrap.className = 'item-row' + (allowed ? '' : ' disabled');
    // 템플릿리터럴 대신 + 연결(EL 충돌 방지)
    wrap.innerHTML =
      '<input type="checkbox" class="item-check" value="' + pid + '"' + (allowed ? '' : ' disabled') + '>' +
      '<span class="name">' + title + '</span>' +
      '<span class="hint"> (현재상태: ' + st + ')</span>';
    list.appendChild(wrap);
  });

  document.getElementById('itemPickerModal').style.display = 'flex';
}

function closeItemPicker(){
  document.getElementById('itemPickerModal').style.display = 'none';
  pickerState.orderId = null; pickerState.action = null;
}

function confirmItemPicker(){
  var modal = document.getElementById('itemPickerModal');
  var checks = modal.querySelectorAll('.item-check:checked');
  if(!checks.length){ alert('상품을 선택하세요.'); return; }

  var conf = ACTION_MAP[pickerState.action];
  if(!confirm(conf.title + '을(를) 진행하시겠어요?')) return;

  // 선택된 productId들만 기존 단건 API에 반복 호출
  var orderId = pickerState.orderId;
  var productIds = Array.prototype.map.call(checks, function(c){ return Number(c.value); });

  // 순차 호출 (실패 시 멈추고 에러 표시)
  (async function run(){
    try{
      for (var i=0;i<productIds.length;i++){
        var pid = productIds[i];
        await fetch(CTX + 'mypage/updateOrderStatus', {
          method: 'POST',
          headers: BASE_HEADERS,
          body: JSON.stringify({ orderId: orderId, productId: pid, orderStatus: conf.status })
        }).then(function(res){
          if(!res.ok) return res.text().then(function(t){ throw new Error(t || '요청 실패'); });
        });
      }
      alert('요청이 처리되었습니다.');
      location.reload();
    }catch(e){
      console.error(e);
      alert('처리 중 오류가 발생했습니다.\n' + e.message);
    }
  })();

  closeItemPicker();
}
</script>

</body>
</html>
