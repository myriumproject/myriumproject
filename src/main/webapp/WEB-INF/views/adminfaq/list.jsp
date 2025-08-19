<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="../includes_admin/header.jsp"%>

<style type="text/css">
  .panel-heading.clickable {
	  cursor: pointer;
</style>

<body>
	<%@include file="../main/header.jsp"%>
	<div style="width: 1240px; margin: 0 auto;">

		<div class="row">
			<div class="col-lg-12">
				<sec:authorize access="hasAuthority('ADMIN')">
					<h1 class="page-header">
						자주 묻는 질문 (FAQ)<span class="badge">관리자</span>
					</h1>
				</sec:authorize>
				<sec:authorize access="!hasAuthority('ADMIN')">
					<h1 class="page-header">자주 묻는 질문 (FAQ)</h1>
				</sec:authorize>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<sec:authorize access="hasAuthority('ADMIN')">
						<div class="panel-heading">
							새로운 FAQ 등록은 작성 버튼을 클릭하세요.
							<button id='regBtn' type="button" class="btn btn-info">작성</button>
						</div>
					</sec:authorize>

					<sec:authorize access="hasAuthority('ADMIN')">
						<c:set var="isAdmin" value="true" />
					</sec:authorize>
					<sec:authorize access="!hasAuthority('ADMIN')">
						<c:set var="isAdmin" value="false" />
					</sec:authorize>

					<div class="panel-group" id="faqAccordion" role="tablist" aria-multiselectable="true">
						<c:forEach var="i" begin="0" end="4" varStatus="status">
							<div class="panel panel-default">
								<div class="panel-heading clickable" role="tab" id="heading${i}" data-toggle="collapse" data-parent="#faqAccordion" data-target="#collapse${i}" aria-expanded="${isAdmin || status.first}" aria-controls="collapse${i}">
									<h4 class="panel-title" style="cursor: pointer;">
										<c:choose>
											<c:when test="${i == 0}">📌 일반</c:when>
											<c:when test="${i == 1}">📦 상품 관련</c:when>
											<c:when test="${i == 2}">🌱 관리 & 재배 관련</c:when>
											<c:when test="${i == 3}">🚚 배송 관련</c:when>
											<c:when test="${i == 4}">🔁 반품 & 환불 관련</c:when>
										</c:choose>
									</h4>
								</div>

								<div id="collapse${i}" class="panel-collapse collapse ${(isAdmin || status.first) ? 'in' : ''}" role="tabpanel" aria-labelledby="heading${i}">
									<div class="panel-body">
										<c:set var="found" value="false" />
										<c:forEach var="faq" items="${list}">
											<c:if test="${faq.section == i}">
												<div class="faq-item" style="margin-bottom: 10px;">
													<strong>Q. ${faq.question}</strong> <span class="pull-right text-muted">
														<fmt:formatDate value="${faq.createdAt}" pattern="yyyy-MM-dd" />
													</span>
													<div style="margin-top: 5px; padding: 10px; background-color: #f9f9f9; border-left: 3px solid #28a745;">
														${faq.answer}
													</div>

													<sec:authorize access="hasAuthority('ADMIN')">
														<div style="margin-top: 5px; display: flex; justify-content: space-between; align-items: center;">
															<span class="label label-${faq.isDeleted == 0  ? 'success' : 'default'}">
																${faq.isDeleted == 0 ? '노출' : '미노출'}
															</span>
															<div>
																<button class="btn btn-sm btn-primary edit-btn" data-id="${faq.id}">수정</button>
																<c:choose>
																	<c:when test="${faq.isDeleted == 0}">
																		<button type="button" class="btn btn-sm btn-warning softdel-btn" data-id="${faq.id}">감추기</button>
																		<button type="button" class="btn btn-sm btn-danger harddel-btn" data-id="${faq.id}">영구삭제</button>
																	</c:when>
																	<c:otherwise>
																		<button type="button" class="btn btn-sm btn-success restore-btn" data-id="${faq.id}">복구</button>
																		<button type="button" class="btn btn-sm btn-danger harddel-btn" data-id="${faq.id}">영구삭제</button>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</sec:authorize>
												</div>
												<c:set var="found" value="true" />
											</c:if>
										</c:forEach>

										<c:if test="${!found}">
											<p class="text-muted">등록된 FAQ가 없습니다.</p>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/resources/bsAdmin2/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var result = '${result}';

			// 모달 체크 함수
			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$(".modal-body").html("새 FAQ " + parseInt(result) + "번이 등록되었습니다.");
					$("#myModal").modal("show");
					console.log("FAQ 등록 모달 표시: 번호 " + result);
				}
			}

			checkModal(result);

			// 뒤로가기 시 URL 유지
			history.replaceState({}, null, null);

			// FAQ 작성 버튼 클릭 이벤트
			$(document).on("click", "#regBtn", function() {
				console.log("작성 버튼 클릭");
				window.location.href = "/adminfaq/register";
			});

			// FAQ 수정 버튼 클릭 이벤트
			$(document).on("click", ".edit-btn", function() {
				const id = $(this).data("id");
				console.log("수정 버튼 클릭 - FAQ ID:", id);
				window.location.href = "/adminfaq/modify?id=" + id;
			});

			// 영구삭제 버튼 클릭 이벤트
			$(document).on("click", ".harddel-btn", function() {
				const id = $(this).data("id");
				console.log("영구삭제 버튼 클릭 - FAQ ID:", id);
				if (confirm("삭제 후 복구할 수 없습니다. 정말 삭제하시겠습니까?")) {
					$.ajax({
						type: "post",
						url: "/adminfaq/harddel",
						data: { id: id },
						success: function() {
							console.log("영구삭제 성공 - FAQ ID:", id);
							location.reload();
						},
						error: function() {
							console.error("영구삭제 실패 - FAQ ID:", id);
							alert("삭제 실패");
						}
					});
				} else {
					console.log("영구삭제 취소 - FAQ ID:", id);
				}
			});

			// 감추기(소프트 삭제) 버튼 클릭 이벤트
			$(document).on("click", ".softdel-btn", function() {
				const id = $(this).data("id");
				console.log("감추기 버튼 클릭 - FAQ ID:", id);
				if (confirm("글이 노출되지 않습니다. 정말 하시겠습니까?")) {
					$.ajax({
						type: "post",
						url: "/adminfaq/softdel",
						data: { id: id },
						success: function() {
							console.log("감추기 성공 - FAQ ID:", id);
							location.reload();
						},
						error: function() {
							console.error("감추기 실패 - FAQ ID:", id);
							alert("글내림 실패");
						}
					});
				} else {
					console.log("감추기 취소 - FAQ ID:", id);
				}
			});

			// 복구 버튼 클릭 이벤트
			$(document).on("click", ".restore-btn", function() {
				const id = $(this).data("id");
				console.log("복구 버튼 클릭 - FAQ ID:", id);
				if (confirm("복구하시겠습니까?")) {
					$.ajax({
						type: "post",
						url: "/adminfaq/restore",
						data: { id: id },
						success: function() {
							console.log("복구 성공 - FAQ ID:", id);
							location.reload();
						},
						error: function() {
							console.error("복구 실패 - FAQ ID:", id);
							alert("복구 실패");
						}
					});
				} else {
					console.log("복구 취소 - FAQ ID:", id);
				}
			});
		});
	</script>

</body>
<%@include file="../includes_admin/footer.jsp"%>
<%@include file="../main/footer.jsp"%>
