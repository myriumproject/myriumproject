<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="../includes_admin/header.jsp"%>

<style>
    .panel-heading.clickable {
        cursor: pointer;
    }
</style>

<body>
<%@include file="../main/header.jsp"%>
	<div class="row">
		<div class="col-lg-12">
			<sec:authorize access="hasAuthority('ADMIN')">
				<h1 class="page-header">자주 묻는 질문 (FAQ)(관리자)</h1>
			</sec:authorize>
			<sec:authorize access="!hasAuthority('ADMIN')">
				<h1 class="page-header">자주 묻는 질문 (FAQ)</h1>
			</sec:authorize>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
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
				            <div class="panel-heading clickable"
							     role="tab"
							     id="heading${i}"
							     data-toggle="collapse"
							     data-parent="#faqAccordion"
							     data-target="#collapse${i}"
							     aria-expanded="${isAdmin || status.first}"
							     aria-controls="collapse${i}">
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
				                                <strong>Q. ${faq.question}</strong>
				                                <span class="pull-right text-muted">
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
																	<button type="button" class="btn btn-sm btn-warning softdel-btn"
																		data-id="${faq.id}">감추기</button>
																	<button type="button" class="btn btn-sm btn-danger harddel-btn"
																		data-id="${faq.id}">영구삭제</button>
																</c:when>
																<c:otherwise>
																	<button type="button" class="btn btn-sm btn-success restore-btn"
																		data-id="${faq.id}">복구</button>
																	<button type="button" class="btn btn-sm btn-danger harddel-btn"
																		data-id="${faq.id}">영구삭제</button>
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


<!-- jQuery -->
<script src="/resources/bsAdmin2/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var result = '${result}'; 	
    
	checkModal(result);
	//상태 객체, 제목,  URL, 현재 상태를 빈 상태로 대체, 뒤로가기 버튼을 눌렀을 때 이전 페이지로 되돌아가지 않고 현재 페이지에 그대로 만듬
	history.replaceState({}, null,null);   // 뒤로가기 모달창을 보여준 뒤에는 더 이상 모달창이 필요하지 않음
	//페이지 이동(뒤로가기)하므로 세션 기록(history)을 조작하는history.replaceState({}, null, null); 메서드 사용
           //마지막 값이 null로 설정되면 현재 URL이 유지
	
	function checkModal(result){
		if(result === '' || history.state){  //빈문자열이거나 history.state true일 때 모달이 보이지 않음
			return ;
		}else{
			if(parseInt(result)>0){
				$(".modal-body").html("새 FAQ " + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
	}
	    
	// 관리자용 버튼 이벤트
	$(document).on("click","#regBtn",function(){
		window.location.href = "/adminfaq/register";
	})
	
	
	$(document).on("click", ".edit-btn", function () {
	    const id = $(this).data("id");
	    window.location.href = "/adminfaq/modify?id=" + id;
	});

	$(document).on("click", ".harddel-btn", function () {
	    const id = $(this).data("id");
	    if (confirm("삭제 후 복구할 수 없습니다. 정말 삭제하시겠습니까?")) {
	        $.ajax({
	            type: "post",
	            url: "/adminfaq/harddel",
	            data: { id: id },
	            success: function () {
	                location.reload();
	            },
	            error: function () {
	                alert("삭제 실패");
	            }
	        });
	    }
	});
	
	$(document).on("click", ".softdel-btn", function () {
	    const id = $(this).data("id");
	    if (confirm("글이 노출되지 않습니다. 정말 하시겠습니까?")) {
	        $.ajax({
	            type: "post",
	            url: "/adminfaq/softdel",
	            data: { id: id },
	            success: function () {
	                location.reload();
	            },
	            error: function () {
	                alert("글내림 실패");
	            }
	        });
	    }
	});

	$(document).on("click", ".restore-btn", function () {
	    const id = $(this).data("id");
	    if (confirm("복구하시겠습니까?")) {
	        $.ajax({
	            type: "post",
	            url: "/adminfaq/restore",
	            data: { id: id },
	            success: function () {
	                location.reload();
	            },
	            error: function () {
	                alert("복구 실패");
	            }
	        });
	    }
	});
	
    
});
</script>

</body>
<%@include file="../includes_admin/footer.jsp"%>
<%@include file="../main/footer.jsp"%>

