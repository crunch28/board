<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>Register</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/reply.js"></script>

</head>

<body class="bg-gradient-primary">

	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Board Read Page</h1>
							</div>
							<div class="form-group">
								<label>Bno</label> <input class="form-control form-control-user"
									id="exampleInputEmail" name="bno"
									value='<c:out value="${board.bno }"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<label>Title</label> <input
									class="form-control form-control-user" id="exampleInputEmail"
									name="title" value='<c:out value="${board.title }"/>'
									readonly="readonly">
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control form-control-user"
									id="exampleInputEmail" name="content" readonly="readonly">
										<c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> <input
									class="form-control form-control-user" id="exampleInputEmail"
									name="writer" value='<c:out value="${board.writer }"/>'
									readonly="readonly">
							</div>
							<button data-oper="modify"
								class="btn btn-primary btn-user btn-block">Modify</button>
							<hr>
							<button data-oper="list"
								class="btn btn-warning btn-user btn-block">List</button>

							<form action="/board/modify" id="operForm" method="get">
								<input type="hidden" id="bno" name="bno"
									value="<c:out value='${board.bno }' />"> <input
									type="hidden" id="pageNum" name="pageNum"
									value="<c:out value='${cri.pageNum }' />"> <input
									type="hidden" id="amount" name="amount"
									value="<c:out value='${cri.amount }' />"> <input
									type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
								<input type="hidden" name="keyword"
									value='<c:out value="${cri.keyword}"/>'>
							</form>
							<div class="row" style="margin: 15px 0 0 0">
								<div class="col-lg-12">
									<!-- /.panel -->
									<div class="panel panel-default">
										<div class="panel-heading row">
											<div class="col-auto mr-auto">
												<i class="fa fa-comments fa-fw"></i>Reply
											</div>
											<button id="addReplyBtn"
												class="btn btn-primary btn-xs col-auto">New Reply</button>
										</div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<ul class="chat">
												<!-- start reply -->

											</ul>
										</div>
										<div class="panel-footer">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> <input class="form-control" name="reply"
							value="Reply">
					</div>
					<div class="form-group">
						<label>Replyer</label> <input class="form-control" name="replyer"
							value="Replyer">
					</div>
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name="replyDate" value="">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
					<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
					<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>


	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>



</body>

</html>

<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		// 버튼 이벤트 처리
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");
						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");
						
						showList(1);
						
						// 댓글 목록구성
						function showList(page) {
							console.log("show list "+page);
							// 댓글 목록처리
							replyService.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {
												console.log("replyCnt: "+ replyCnt);
												console.log("list: "+ list);
												console.log(list);
												
												if(page == -1){
													pageNum = Math.ceil(replyCnt/10.0);
													showList(pageNum);
													return;
												}
												
												var str = "";

												if (list == null || list.length == 0) {
													//replyUL.html("");
													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix'  style='margin:15px 0 0 0' data-rno='"+list[i].rno+"'>";
													str += "<div><div class='header row'><strong class='primary-font col-auto mr-auto'>"
															+ list[i].replyer
															+ "</strong>";
													str += "<small class='pull-right text-muted col-auto'>"
															+ replyService
																	.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "<p>"
															+ list[i].reply
															+ "</p></div></li>";
												}
												replyUL.html(str);
												showReplyPage(replyCnt);
											});
						}//end showList

						// 댓글 페이지 번호 출력
						function showReplyPage(replyCnt){
							var endNum = Math.ceil(pageNum/10.0)*10;
							var startNum = endNum -9;
							
							var prev = startNum !=1;
							var next = false;
							
							if(endNum * 10 >= replyCnt){
								endNum = Math.ceil(replyCnt/10.0);
							}
							
							if(endNum * 10 < replyCnt){
								next = true;
							}
							
							var str = "<ul class='pagination pull-right'>";
							
							if(prev){
								str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";								
							}
						
						for(var i = startNum; i <=endNum; i++){
							var active = pageNum == i? "active": "";
							
							str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
						}
						
						if(next){
							str += "<li class='page-item'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
						}
						
						str += "</ul></div>";
						
						console.log(str);
						replyPageFooter.html(str);
						
						}
						
						// 페이지 번호 눌리면 이동
						replyPageFooter.on("click", "li a", function(e){
							e.preventDefault();
							console.log("page click");
							
							var targetPageNum = $(this).attr("href");
							
							console.log("targetPageNum:"+targetPageNum);
							
							pageNum = targetPageNum;
							showList(pageNum);
						});
						
						
						// 댓글 추가 이벤트 처리
						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						// New Reply 버튼 눌렀을 시
						$("#addReplyBtn").on("click", function(e) {

							modal.find("input").val(""); //input 값들 초기화
							modalInputReplyDate.closest("div").hide(); //div 숨기기
							modal.find("button[id !='modalCloseBtn']").hide();

							modalRegisterBtn.show();

							$(".modal").modal("show");
						});

						// 새로운 댓글 추가처리
						modalRegisterBtn.on("click", function(e) {
							
							var reply = {
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								bno : bnoValue
							};
							replyService.add(reply, function(result) {
								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								showList(-1);
							});

						});
						
						// 댓글 조회 클릭 이벤트 처리
						$(".chat").on("click", "li", function(e){
							var rno = $(this).data("rno");
							console.log(rno);
							
							replyService.get(rno, function(reply){
								modalInputReply.val(reply.reply);
								modalInputReplyer.val(reply.replyer);
								modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
								.attr("readonly", "readnoly");
								modal.data("rno", reply.rno);
								
								modal.find("button[id !='modalCloseBtn']").hide();
								modalModBtn.show();
								modalRemoveBtn.show();
								
								$(".modal").modal("show");
								
							});
						});
						
						// 댓글 수정
						modalModBtn.on("click", function(e){
							var reply = {rno: modal.data("rno"), reply: modalInputReply.val()};
						
							replyService.update(reply, function(result){
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});
						
						// 댓글 삭제
						modalRemoveBtn.on("click", function(e){
							var rno = modal.data("rno");
							
							replyService.remove(rno, function(result){
								alert(result);
								modal.modal("hide");
								showList(pageNum);
								
							});
						});
						
						
						
					
						
						
						
						
						/*
						// 댓글 등록처리
						replyService.add({
							reply : "JS Test",
							replyer : "tester",
							bno : bnoValue
						}, function(result) {
							alert("RESULT : " + result);
						});
						
						// 댓글 목록처리
						replyService.getList({bno:bnoValue,page:1},function(list){
							for(var i =0;len=list.length||0;i<len;i++){
								console.log(list[i]);
							}
						});
						
						// 댓글 삭제
						replyService.remove(100,function(count){
							console.log(count);
							if(count ==="success"){
								alert("REMOVED");
							}
						},function(err){
							alert("ERROR...");
						});
						
						// 댓글 수정
						replyService.update({
							rno:22,
							bno:bnoValue,
							reply:"Modified Reply"
						}, function(result){
							alert("수정완료...");
						});
						
						// 특정 댓글 조회
						replyService.get(10, function(data){
							console.log(data);
						})
						 */

					});
</script>

