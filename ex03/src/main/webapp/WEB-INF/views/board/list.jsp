<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<a href="/board/list"><h1 class="h3 mb-2 text-gray-800">게시판</h1></a>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
			<button id="regBtn" type="button" class="btn btn-primary btn-block">Register
				New Board</button>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }"></c:out></td>
								<td><a class="move" href="<c:out value='${board.bno }'/>"><c:out
											value="${board.title }"></c:out> <b>[ <c:out
												value="${board.replyCnt }"></c:out> ]
									</b></a></td>
								<!-- <a target="_blank"> 하면 새창으로 열림 -->
								<td><c:out value="${board.writer }"></c:out></td>
								<td><fmt:formatDate value="${board.regdate }"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${board.updatedate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 검색 처리 -->
				<div class='row'>
					<div class="col-lg">
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>선택사항</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>제목
									or 내용 or 작성자</option>
							</select> <input type="text" name="keyword"
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type="hidden" name="pageNum"
								value='<c:out value="${pageMaker.cri.pageNum}"/>'> <input
								type="hidden" name="amount"
								value='<c:out value="${pageMaker.cri.amount}"/>'>
							<button class="btn btn-light">Search</button>
						</form>
					</div>
				</div>

				<!-- 페이지 처리 -->
				<div aria-label="Page navigation example">
					<ul class="pagination justify-content-end">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage -1 }">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage}">
							<li
								class='page-item ${pageMaker.cri.pageNum == num ? "active" : "" }'><a
								class="page-link" href="${num }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>

				<!-- 페이지 이동 -->
				<form action="/board/list" id="actionForm" method="get">
					<input type="hidden" name='pageNum'
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="type"
						value='<c:out value="${pageMaker.cri.type}"/>'> <input
						type="hidden" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>

				<!-- Modal-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h5 class="modal-title" id="myModalLabel">Modal title</h5>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button class="btn btn-default" type="button"
									data-dismiss="modal">Close</button>
								<button class="btn btn-primary" type="button">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<!-- Redirect와 모달창에 관한 스크립트 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>'; //등록처리 결과값

						checkModal(result); //등록하는거 체크
						history.replaceState({}, null, null); //뒤로하기

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) { // parseInt 정수형으로 바꿔줌
								$(".modal-body").html(
										"게시글" + parseInt(result)
												+ "번이 등록되었습니다.");
							}
							$("#myModal").modal("show");
						}
						$("#regBtn").on("click", function() { //regBtn 등록페이지 이동
							self.location = "/board/register";
						});

						var actionForm = $("#actionForm");

						// a태그 먹통 만들고 form에 있는 input값에 속성을 href로 바꾸기
						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault(); //a태그 먹통만들기

									console.log("click");

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						// 게시판 제목 클릭시
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>"); //클릭하면 input 태그 만들어서 넘김
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();
										});

						// 검색버튼 이벤트 처리
						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();
								});
					});
</script>

<%@ include file="../includes/footer.jsp"%>
