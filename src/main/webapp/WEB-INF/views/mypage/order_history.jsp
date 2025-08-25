<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>주문조회</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/order_history.css" />


</head>
<body>

	<%@ include file="../main/header.jsp"%>

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
					<li><a
						href="${pageContext.request.contextPath}/mypage/member_update">회원
							정보 수정</a></li>
					<li><a
						href="${pageContext.request.contextPath}/mypage/change_password">비밀번호
							변경</a></li>
					<li>
						<form action="${pageContext.request.contextPath}/logout"
							method="post" class="logout-form">
							<button type="submit" class="logout-btn">로그아웃</button>
						</form>
					</li>
				</ul>
			</div>
			<button class="inquiry-btn">1:1 문의하기</button>
		</aside>

		<!-- 본문 -->
		<div class="order-container">
			<h2>주문조회</h2>

			<div class="tab-menu">
				<button class="tab active" data-tab="order">주문내역조회
					(${orderCount})</button>
				<button class="tab" data-tab="cancel">취소/반품/교환 내역 (${cancelTabCount})</button>
			</div>

			<!-- 주문내역 탭 -->
			<div class="tab-content active" id="order">
				<div class="order-guide-text">
					<p>- 최근 3개월 기준이며, 처리완료 후 36개월 내 조회 가능.</p>
					<p>- 취소/교환/반품 신청은 배송완료일 기준 7일까지.</p>
				</div>

				<c:choose>
					<c:when test="${empty groupedOrders}">
						<div class="empty-msg">주문 내역이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="entry" items="${groupedOrders}">
							<c:set var="ordersId" value="${entry.key}" />
							<c:set var="orders" value="${entry.value}" />

							<%-- 취소 허용 라인, 전체취소 가능여부 계산 --%>
							<c:set var="anyCancelable" value="false" />
							<c:set var="allCancelable" value="true" />
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.orderStatus == 0 || o.orderStatus == 1}">
									<c:set var="anyCancelable" value="true" />
								</c:if>
								<c:if test="${!(o.orderStatus == 0 || o.orderStatus == 1)}">
									<c:set var="allCancelable" value="false" />
								</c:if>
							</c:forEach>
							
							<c:set var="anyExOrRefund" value="false" />
							<c:forEach var="o2" items="${orders}">
							  <c:if test="${o2.orderStatus == 1 or o2.orderStatus == 2 or o2.orderStatus == 3 or o2.orderStatus == 18}">
							    <c:set var="anyExOrRefund" value="true" />
							  </c:if>
							</c:forEach>

							<div class="order-box" data-order-id="${orders[0].id}">
								<div class="order-header">
									<div class="order-date">
										<strong>${orders[0].orderDate}</strong> <span>(${orders[0].ordersIdfull})</span>
									</div>
									<div class="header-actions">
										<a class="detail-link"
											href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${orders[0].id}">상세보기
											&gt;</a>
									</div>
								</div>

								<!-- 라인 목록 -->
								<!-- 상품 라인 -->
								<c:forEach var="order" items="${orders}">
									<div class="order-content" data-product-id="${order.productId}">
										<!-- 체크박스 -->
										<input type="checkbox" class="action-check"
										       name="select_${orders[0].id}[]"
										       value="${order.productId}" data-status="${order.orderStatus}" />
											<img
											class="product-img"
											src="${pageContext.request.contextPath}/upload/${order.img_path}"
											alt="상품 이미지" />

										<div class="product-info">
											<p class="product-title">${order.productName}</p>
											<p class="product-price">
												<c:choose>
													<c:when test="${order.discount_price == 0}">
														<fmt:formatNumber value="${order.productPrice}"
															pattern="#,###" />원 (${order.quantity}개)
            </c:when>
													<c:otherwise>
														<fmt:formatNumber value="${order.discount_price}"
															pattern="#,###" />원 (${order.quantity}개)
            </c:otherwise>
												</c:choose>
											</p>

											<div class="status-buttons">
												<c:if test="${order.orderStatus == 3}">
													<button
														onclick="location.href='${pageContext.request.contextPath}/mypage/review?orderId=${orders[0].id}&productId=${order.productId}'">
														구매후기</button>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
								
								<!-- 전체 선택 라인 (select-mode에서만 체크박스가 보임) -->
								<div class="order-content all-action-row" data-all-cancel="${allCancelable}">
								<input type="checkbox" class="action-check select-all" data-role="select-all" />
								  <div class="product-info">
								    <p class="product-title all-title">주문 전체 취소</p>
								    <p class="product-price all-desc">이 주문의 모든 상품을 선택합니다.</p>
								  </div>
								</div>

								<!-- 선택모드 전용 액션 -->
								<div class="select-actions">
									<button type="button" class="order-btn primary"
										onclick="confirmSelect(${orders[0].id})">선택 신청</button>
									<button type="button" class="order-btn outline"
										onclick="exitSelect(${orders[0].id})">선택 종료</button>
								</div>


								<!-- 헤더 기준 상태 표시 -->
								<!-- 상태 표시 -->
								<!-- 상태 표시 (order 탭) -->
								<div class="order-status">
									<p class="status">${orders[0].orderStatusText}</p>
									
									<div class="status-actions">
									  <!-- 취소 버튼: 기존 로직 유지 -->
									  <c:if test="${anyCancelable}">
									    <button type="button" class="order-btn ghost"
									            onclick="startSelect(${orders[0].id}, 'cancel', true)">취소신청</button>
									  </c:if>
									
									  <!-- 교환/반품 버튼: 0/1만 있는 주문이면 숨김 -->
									  <c:if test="${anyExOrRefund}">
									    <button type="button" class="order-btn ghost"
									            onclick="startSelect(${orders[0].id}, 'exchange', true)">교환신청</button>
									    <button type="button" class="order-btn ghost"
									            onclick="startSelect(${orders[0].id}, 'refund', true)">반품신청</button>
									  </c:if>
									</div>

								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 취소/반품/교환 탭 (기존 그대로) -->
			<div class="tab-content" id="cancel">
  <div class="order-guide-text">
    <p>- 최근 3개월 기준이며, 처리완료 후 36개월 내 조회 가능.</p>
    <p>- 취소/교환/반품 신청은 배송완료일 기준 7일까지.</p>
  </div>

  <!-- ▼ 취소 목록 -->
<h3 class="sect-title">
  취소 내역 <small>(${fn:length(cancelList)})</small>
</h3>
<c:choose>
  <c:when test="${empty cancelList}">
    <div class="cancel-empty">취소 내역이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <c:forEach var="row" items="${cancelList}">
      <c:set var="price" value="${row.discount_price ne 0 ? row.discount_price : row.productPrice}" />
      <div class="order-row">
        <img class="product-img"
             src="${pageContext.request.contextPath}/upload/${row.img_path}"
             alt="상품 이미지" />
        <div class="row-info">
          <div class="row-meta">
            <strong>${row.orderDate}</strong>
            <span class="row-oid">(${row.ordersIdfull})</span>
          </div>
          <div class="row-title">${row.productName}</div>
          <div class="row-sub">
            <fmt:formatNumber value="${price}" pattern="#,###" />원
            (${row.quantity}개)
          </div>
              <a class="row-detail"
       href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${row.id}&productId=${row.productId}">
      상세보기
    </a>
        </div>
        <div class="row-status">${row.orderStatusText}</div>
      </div>
<<<<<<< HEAD
	
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
=======
    </c:forEach>
  </c:otherwise>
</c:choose>
>>>>>>> main

<!-- ▼ 교환 목록 -->
<h3 class="sect-title">
  교환 내역 <small>(${fn:length(exchangeList)})</small>
</h3>
<c:choose>
  <c:when test="${empty exchangeList}">
    <div class="cancel-empty">교환 내역이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <c:forEach var="row" items="${exchangeList}">
      <c:set var="price" value="${row.discount_price ne 0 ? row.discount_price : row.productPrice}" />
      <div class="order-row">
        <img class="product-img"
             src="${pageContext.request.contextPath}/upload/${row.img_path}"
             alt="상품 이미지" />
        <div class="row-info">
          <div class="row-meta">
            <strong>${row.orderDate}</strong>
            <span class="row-oid">(${row.ordersIdfull})</span>
          </div>
          <div class="row-title">${row.productName}</div>
          <div class="row-sub">
            <fmt:formatNumber value="${price}" pattern="#,###" />원
            (${row.quantity}개)
          </div>
              <a class="row-detail"
       href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${row.id}&productId=${row.productId}">
      상세보기
    </a>
        </div>
        <div class="row-status">${row.orderStatusText}</div>
      </div>
    </c:forEach>
  </c:otherwise>
</c:choose>

<!-- ▼ 반품/환불 목록 -->
<h3 class="sect-title">
  반품/환불 내역 <small>(${fn:length(refundList)})</small>
</h3>
<c:choose>
  <c:when test="${empty refundList}">
    <div class="cancel-empty">반품/환불 내역이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <c:forEach var="row" items="${refundList}">
      <c:set var="price" value="${row.discount_price ne 0 ? row.discount_price : row.productPrice}" />
      <div class="order-row">
        <img class="product-img"
             src="${pageContext.request.contextPath}/upload/${row.img_path}"
             alt="상품 이미지" />
        <div class="row-info">
          <div class="row-meta">
            <strong>${row.orderDate}</strong>
            <span class="row-oid">(${row.ordersIdfull})</span>
          </div>
          <div class="row-title">${row.productName}</div>
          <div class="row-sub">
            <fmt:formatNumber value="${price}" pattern="#,###" />원
            (${row.quantity}개)
          </div>
              <a class="row-detail"
       href="${pageContext.request.contextPath}/mypage/order_detail?orderId=${row.id}&productId=${row.productId}">
      상세보기
    </a>
        </div>
        <div class="row-status">${row.orderStatusText}</div>
      </div>
    </c:forEach>
  </c:otherwise>
</c:choose>
</div>

			<div id="pagination-wrapper">
				<div class="pagination" id="pagination-content">
					<button>&lt;</button>
					<button class="active">1</button>
					<button>&gt;</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/main/footer.jsp"%>

	<script> const ctx = "${pageContext.request.contextPath}"; </script>
	<script
		src="${pageContext.request.contextPath}/resources/js/order_history.js"></script>

<<<<<<< HEAD
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
=======
	<script>
>>>>>>> main
const paginationHTML = {
  order: `<button>&lt;</button><button class="active">1</button><button>&gt;</button>`,
  cancel:`<button>&lt;</button><button class="active">1</button><button>&gt;</button>`
};
document.querySelectorAll('.tab').forEach(btn=>{
  btn.addEventListener('click', ()=>{
    const t = btn.dataset.tab;
    document.querySelectorAll('.tab-content').forEach(x=>x.classList.remove('active'));
    document.getElementById(t).classList.add('active');
    document.querySelectorAll('.tab').forEach(x=>x.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById('pagination-content').innerHTML = paginationHTML[t];
  });
});
</script>
<script>
// 액션 정책 (허용 상태 제한)
var ACTION_MAP = {
  cancel:   { status: 8, title: '선택 취소',   allow: [0,1] }, // 입금전/배송준비중만
  exchange: { status: 4, title: '선택 교환',   allow: [3] },   // 배송완료만
  refund:   { status: 6, title: '선택 반품',   allow: [3] }    // 배송완료만
};

<<<<<<< HEAD
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
=======
<script>
/* 컨텍스트 경로 + CSRF */
var CTX = '<c:url value="/" />';
var BASE_HEADERS = {'Content-Type':'application/json'};
<c:if test="${not empty _csrf}">
  BASE_HEADERS['${_csrf.headerName}'] = '${_csrf.token}';
</c:if>

/* 타입 메타(상태코드/허용 상태) + 라벨 */
var TYPE  = {
  cancel:   { status: 8, allow: [0,1] }, // 취소: 입금전/배송준비중
  exchange: { status: 4, allow: [1, 2, 3, 18] }, // 교환: 배송완료
  refund:   { status: 6, allow: [1, 2, 3, 18] }  // 반품: 배송완료
};
var LABEL = { cancel: '취소', exchange: '교환', refund: '반품' };

/* 받침 판단 → 을/를 */
function hasBatchim(kor){
  if (!kor) return false;
  var code = kor.charCodeAt(kor.length - 1);
  if (code < 0xAC00 || code > 0xD7A3) return false;
  return ((code - 0xAC00) % 28) !== 0;
}
function eulReul(word){ return hasBatchim(word) ? '을' : '를'; }

/* 돔 헬퍼 */
function box(orderId){
  return document.querySelector('.order-box[data-order-id="' + orderId + '"]');
}

/* 초기: 체크박스/선택 버튼 숨김 */
document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.order-box').forEach(function(b){
    toggleSelectUI(b, false);
  });
});

/* 선택 UI 토글 */
function toggleSelectUI(b, on){
  b.querySelectorAll('.action-check').forEach(function(c){
    c.style.display = on ? '' : 'none';
  });
  var sa = b.querySelector('.select-actions');
  if (sa) sa.style.display = on ? '' : 'none';
  var stAct = b.querySelector('.status-actions');
  if (stAct) stAct.style.display = on ? 'none' : '';

  // ✅ 모든 타입에서 '주문 전체 [취소/교환/반품]' 행 노출
  var allRow = b.querySelector('.all-action-row');
  if (allRow){
    if (!on) {
      allRow.style.display = 'none';
    } else {
      allRow.style.display = '';
      var anyEnabled = b.querySelector('.action-check:not(.select-all):not(:disabled)') !== null;
      var selectAll = b.querySelector('.select-all');
      if (selectAll) { selectAll.disabled = !anyEnabled; selectAll.checked = false; }
    }
  }
}

/* 선택모드 진입 (checkbox 기반) */
function startSelect(orderId, type, canEnter){
  var b = box(orderId); if(!b) return;
  b.classList.add('select-mode');
  b.dataset.selectType = type;

  var primary = b.querySelector('.select-actions .primary');
  if (primary) primary.textContent = '선택 ' + LABEL[type] + '신청';

  // '주문 전체 XXX' 문구 타입별로 세팅
  var allRow = b.querySelector('.all-action-row');
  if (allRow){
    var t = LABEL[type];
    var title = allRow.querySelector('.all-title');
    var desc  = allRow.querySelector('.all-desc');
    if (title) title.textContent = '주문 전체 ' + t;
    if (desc)  desc.textContent  = '이 주문의 모든 상품을 ' + t + '합니다.';
  }

  // 타입별 허용 상태 기준으로 체크박스 enable/disable
  var allow = (TYPE[type] && TYPE[type].allow) ? TYPE[type].allow : null;
  b.querySelectorAll('.action-check').forEach(function(chk){
    var st = Number(chk.dataset.status || 0);
    var isAll = chk.classList.contains('select-all');
    if (!isAll && allow && allow.indexOf(st) < 0){
      chk.disabled = true;
      var row = chk.closest('.order-content');
      if (row) row.classList.add('dim');
    } else {
      chk.disabled = false;
      var row2 = chk.closest('.order-content');
      if (row2) row2.classList.remove('dim');
    }
    chk.checked = false; // 진입 시 초기화
  });

  // 전체선택 바인딩(최초 1회)
  var selectAll = b.querySelector('.select-all');
  if (selectAll && !selectAll._bound){
    selectAll.addEventListener('change', function(){
      b.querySelectorAll('.action-check:not(.select-all):not(:disabled)')
       .forEach(function(c){ c.checked = selectAll.checked; });
    });
    b.querySelectorAll('.action-check:not(.select-all)').forEach(function(c){
      c.addEventListener('change', function(){
        var enabled = b.querySelectorAll('.action-check:not(.select-all):not(:disabled)');
        var checked = b.querySelectorAll('.action-check:not(.select-all):checked');
        selectAll.checked = (enabled.length>0 && checked.length === enabled.length);
      });
    });
    selectAll._bound = true;
  }

  toggleSelectUI(b, true);
}

/* 선택모드 종료 */
function exitSelect(orderId){
  var b = box(orderId); if(!b) return;
  b.classList.remove('select-mode');
  delete b.dataset.selectType;
  b.querySelectorAll('.action-check').forEach(function(c){ c.checked=false; c.disabled=false; });
  b.querySelectorAll('.order-content.dim').forEach(function(x){ x.classList.remove('dim'); });
  toggleSelectUI(b, false);
}

/* 선택 확인 (여러 상품 반복 호출) */
function confirmSelect(orderId){
  var b = box(orderId); if(!b) return;
  var type = b.dataset.selectType || 'cancel';

  var selected = Array.from(
    b.querySelectorAll('.action-check:not(.select-all):checked')
  ).map(function(c){
    return { productId: Number(c.value), status: Number(c.dataset.status || 0) };
  });
  if (!selected.length) { alert(LABEL[type] + '할 상품을 선택하세요.'); return; }

  // 타입별 허용 상태 검증
  var allow = (TYPE[type] && TYPE[type].allow) ? TYPE[type].allow : null;
  if (allow){
    var invalid = selected.some(function(x){ return allow.indexOf(x.status) < 0; });
    if (invalid) { alert(LABEL[type] + ' 불가 상태의 상품이 포함되어 있습니다.'); return; }
  }

  var word = LABEL[type], particle = eulReul(word);
  if (!confirm(word + particle + ' 신청하시겠어요?')) return;

  (async function(){
    try{
      for (var i=0; i<selected.length; i++){
        var it = selected[i];
        await fetch(CTX + 'mypage/updateOrderStatus', {
          method: 'POST',
          headers: BASE_HEADERS,
          body: JSON.stringify({
            orderId: Number(orderId),
            productId: it.productId,
            orderStatus: TYPE[type].status
          })
        }).then(function(res){
          if (!res.ok) return res.text().then(function(t){ throw new Error(t || '요청 실패'); });
        });
      }
      alert('요청이 접수되었습니다.');
      location.reload();
    }catch(e){
      console.error(e);
      alert('서버 요청 중 오류가 발생했습니다.\n' + e.message);
    }
  })();
}

/* 단건 호출이 필요하면 사용 (선택) */
function submitRequest(type, orderId, productId, currentStatus){
  var meta  = TYPE[type]  || {};
  var label = LABEL[type] || '요청';
  var allow = meta.allow || null;

  if (productId > 0 && allow && allow.indexOf(Number(currentStatus)) < 0){
    alert(label + '이(가) 불가한 상태입니다.');
    return;
  }

  var particle = eulReul(label);
  if (!confirm(label + particle + ' 신청하시겠어요?')) return;

  fetch(CTX + 'mypage/updateOrderStatus', {
    method: 'POST',
    headers: BASE_HEADERS,
    body: JSON.stringify({
      orderId: Number(orderId),
      productId: Number(productId),
      orderStatus: meta.status || 0
    })
  })
  .then(function(res){ if (!res.ok) return res.text().then(function(t){ throw new Error(t || '요청 실패'); }); })
  .then(function(){ alert(label + ' 요청이 접수되었습니다.'); location.reload(); })
  .catch(function(err){ console.error(err); alert('서버 요청 중 오류가 발생했습니다.\n' + err.message); });
}
</script>


>>>>>>> main

</body>
</html>
