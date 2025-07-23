<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@include file="../main/header.jsp" %> 
<%@include file="../includes_admin/header.jsp" %> 

<body>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">고객게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            새로운 글을 작성하려면 게시글 작성 버튼을 클릭하세요. 
              		         <button id='regBtn' type="button" class="btn btn-xs pull-right btn-info">게시글 작성</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
								  <c:forEach items="${list}" var="board">
									<tr class="odd gradeX">										                                        
										<td>${board.bno}</td>
										<td><a class="move" href='${board.bno}'>   ${board.title}</a><b>[  <c:out value="${board.replyCnt}" />  ]</b></td>
                                        <td>${board.writer}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                    </tr>
                                  </c:forEach>											
                              	</tbody>
                            </table>
                            
                            
                            <!-- 검색조건 -->
							<div class='row'>
								<div class="col-lg-12">
									<form id='searchForm' action="/board/list" method='get'>
										<select name='type'>
											<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택하세요</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
											<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
											<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
											<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
											<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
										</select> 
									            <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
									            <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
									            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
										<button class='btn btn-default'>검색</button>
									</form>
								</div>
							</div>
							<!-- end 검색조건 -->  
                            
                            
                            
                            <!-- 페이지 처리 -->
							<div class="pull-right">
							    <ul class="pagination">
							        <c:if test="${pageMaker.prev}">
								<li class="paginate_button"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
							        </c:if>
							
							      <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': ''} "><a href="${num}">${num}</a></li>
							      </c:forEach>
							   
							      <c:if test="${pageMaker.next}">
								<li  class="paginate_button"><a href="${pageMaker.endPage+1}">Next</a></li>
							      </c:if>
							    </ul>
							</div>
							<!-- end 페이지 처리 -->
							
							<form id='actionForm' action="/board/list" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='type' value='${pageMaker.cri.type}'>
								<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
							</form>


							<!-- The Modal -->
							<div class="modal" id="myModal">
							  <div class="modal-dialog">
							    <div class="modal-content">
							
							      <!-- Modal Header -->
							      <div class="modal-header">
							        <h4 class="modal-title">Modal Heading</h4>
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							      </div>
							
							      <!-- Modal body -->
							      <div class="modal-body">
							        처리가 완료되었습니다.
							      </div>
							
							      <!-- Modal footer -->
							      <div class="modal-footer">
							        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							      </div>
							
							    </div>
							  </div>
							<!-- End Modal -->



                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->

    <!-- </div>  -->

</body>

<%@include file="../includes_admin/footer.jsp" %>       
<%@include file="../main/footer.jsp" %>

<script>
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
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
	}
	
	$("#regBtn").on("click",function(){
		self.location = "/board/register";
	})
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		// 클릭된 요소의 href 값을 찾아서 input 폼 안의 pageNum 필드에 설정		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/board/get");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
	});
    
    
});
</script>

