<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>팁게시판 | 모닥불🏕  </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<style>
			.content img {
				width: 100% !important;
			}
			
			.replyBtn, .timeDiv {
				text-align: right !important;
			}
			
			.replies a {
				text-decoration: none;
			}
			
			.paging a {
				text-decoration: none;
			}
			
			.paging code {
				background: white;
			}
			
			#boardModify, #boardRemove {
    			color: black !important;
    			border-radius: 0;
			}
			
			.far {
				color: red;
			}
		</style>
	</head>
	<body class="is-preload">
		<%@include file="../includes/header.jsp" %>
		<div id="main">
		<!-- Post -->
			<section class="main special" style="margin-top: 30px;">
				<div class="inner banner">
					<header class="major">
						<span class="category">팁게시판</span>
					</header>
				</div>
				<div class="row" style="display:block;">
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;"><h2 style="font-weight: bold;">제목 : ${board.title}</h2></div>
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto; text-align: right;">
						<a class="button small" id="boardModify" href="/campfire/tipModify${cri.getListLink()}&bno=${board.bno}" style="box-shadow: 0 0 0 0.5px black"><i class="far fa-lightbulb"></i>&nbsp;신고</a>
						<c:if test="${sessionId eq board.writer}">
							<a class="button small" id="boardModify" href="/campfire/tipModify${cri.getListLink()}&bno=${board.bno}" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-pencil-alt"></i>&nbsp;수정</a>
							<a class="button small" id="boardRemove" href="javascript:removeForm.submit()" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
						</c:if>
					</div>
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;">
						<div class="header">
							<h3 style="font-weight: bold; text-align: left; margin: 0 0;">
								No.${board.bno}
							</h3>
							<div style="position: absolute;">
								<span>작성자 : ${board.writer}</span>
							</div>
							<div style="text-align: right;">
								<span>조회수 : ${board.readCnt}</span>
							</div>
						</div>
						<div style="margin-bottom: 10px; width: 100%;" class="content">
							${board.content}
							<%-- <textarea>는 html 태그를 적용하지 않고 그대로 출력하기 때문에 사용 안함 --%>
							<%-- <textarea rows="" cols=""></textarea> --%>
						</div>
					</div>
					<form name="removeForm" action="/campfire/tipRemove">
						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="type" value="${cri.type}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name="bno" value="${board.bno}">
					</form>
				
					<!-- 댓글작성칸 -->
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
						<div class="row">
							<div class="col-9">
								<input type="text" name="reply">
								<%-- 현재 로그인된 sessionId 들어오는지 확인해야함 --%>
								<input type="hidden" name="replyer" value="${sessionId}">
							</div>
							<div class="col-3" style="padding:0 0;">
								<ul class="actions stacked" style="margin: 0 0;">
									<li>
										<a class="button primary fit write" href="javascript:void(0)" style="border-radius: 6px;">댓글 작성</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				
					<!-- 댓글리스트 -->
					<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
						<div>
							<h3 style="font-weight: bold; text-align: left; margin-right: 3%;">댓글</h3>
						</div>
						<ul class="alt replies">
							<!-- <li>
								<div style="position: absolute;">
									<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
								</div>
								<div style="text-align: right;">
									<h5 style="margin: 0;">12분 전</h5>
								</div>
								<div style="text-align: left;">
									<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
								</div>
							</li>
							<li>
								<div style="position: absolute;">
									<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
								</div>
								<div style="text-align: right;">
									<h5 style="margin: 0;">12분 전</h5>
								</div>
								<div style="text-align: left;">
									<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
								</div>
							</li> -->
						</ul>
						<div class="paging" style="text-align: center; margin-bottom: 2%;">
							<ul class="pagination">
							
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../includes/footer.jsp"/>
		<script src="/resources/assets/js/campfire/tipReply.js"></script>
	</body>
	<script>
		$(document).ready(function () {
			var pageNum = 1;
			var bno = "${board.bno}";
			var sessionId = "${sessionId}";
			
			showList(pageNum);
			
			$("#heartIcon").on("click", function(e){
				e.preventDefault();
				$(this).find(".fa-heart").toggleClass("far");
				$(this).find(".fa-heart").toggleClass("fas");
			});
			
			$(".write").on("click", function(e){
				e.preventDefault();
				
				var reply = $("input[name='reply']").val();
				var replyer = $("input[name='replyer']").val();
				
				if(reply == ""){alert("내용을 입력해주세요."); return;}
				if(replyer == ""){alert("로그인 후 이용이 가능합니다."); return;}
				
				replyService.add({bno: bno, reply: reply, replyer: replyer}, function(result){
					alert(result);
					pageNum = 1;
					showList(pageNum);
					$("input[name='reply']").val("");
				});
			});
			
			function showReplyPage(replyCnt){
				var str = "";
				var endNum = Math.ceil(pageNum / 10.0) * 10
				var startNum = endNum - 9;
				var realEnd = Math.ceil(replyCnt / 10.0)
				var divTag = $(".paging ul");   			
				
				if(endNum > realEnd){
					endNum = realEnd;
				}
				
				var prev = startNum != 1;
				var next = endNum * 10 < replyCnt;
				
				if(matchMedia("screen and (max-width:918px)").matches){
					//918px보다 작을 때
					if(pageNum > 1){
						str += "<li><a class='changePage' href='" + (pageNum - 1) + "'>이전</a></li>";
					}
					str += "<li><a class='page active'>" + pageNum + "</a></li>";
					if(pageNum < realEnd){
						str += "<li><a class='changePage' href='" + (pageNum + 1) + "'>다음</a>";
					}
				}else{
					//918px 이상일 때
					if(prev){
						str += "<li><a class='changePage' href='" + (startNum - 1) + "'>이전</a></li>";
					}
					for(let i=startNum; i<=endNum; i++){
						if(i == pageNum){
							str += "<li><a class='page active'>" + i + "</a></li>";
							continue;
						}
						str += "<li><a class='changePage' href='" + i + "'>" + i + "</a></li>";
					}
					if(next){
						str += "<li><a class='changePage' href='" + (endNum + 1) + "'>다음</a><li>";
					}
				}
				divTag.html(str);
			}
			
			//페이지 이동
			$(".paging").on("click", "a.changePage", function(e){
				e.preventDefault();
				pageNum = parseInt($(this).attr("href"));
				showList(pageNum);
			});
			
			function showList(page){
				var replyUL = $(".replies");
				
				replyService.getList({bno:bno, page:page||1},
					function(replyCnt, list){
						var str = "";
						if(list == null || list.length == 0){
							//등록된 댓글이 없습니다.
							if(pageNum > 1) {
								pageNum -= 1;
								showList(pageNum);
							}
							replyUL.html("등록된 댓글이 없습니다.");
							return;
						}
							
						for(let i=0, len=list.length; i<len; i++){
							str += "<li data-rno='" + list[i].rno + "'>";
							str += "<div style='position: absolute;'>";
							str += "<h4 style='margin: 0; text-align: left;'>";
							str += "작성자: " + list[i].replyer + "</h4></div><div class='replyBtn'><a class='far fa-lightbulb' href='" + list[i].rno + "' style='color: red;'></a><br>";
							str += "<div style='text-align: left; width: 90%; margin: 0 auto; margin-top: 3%;'>";
							str += "<span class='reply" + list[i].rno + "'>" + list[i].reply + "</span></div>";
							if(list[i].replyDate != list[i].updateDate){
								str += "<div class='timeDiv'><strong>"+replyService.timeForToday(list[i].updateDate) + " 수정";
							}else {
								str += "<div class='timeDiv'><strong>" + replyService.timeForToday(list[i].replyDate);
							}
							str += "</strong></div>";
							if(sessionId == list[i].replyer){
								str += "<a class='modify' href='" + list[i].rno + "'><i class='fas fa-pencil-alt'></i></a>";
								str += "<a class='finish' href='" + list[i].rno + "' style='display:none;'><i class='fas fa-check' style='color: #41e841'></i></a>";
								str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
								str += "<a class='remove' href='" + list[i].rno + "'><i class='fas fa-trash-alt'></i></a>";
								str += "</div>";
							}
							str += "</li>";
						}
						replyUL.html(str);
						showReplyPage(replyCnt);
					});
			}
			
			$(".replies").on("click", "a.remove", function(e){
				e.preventDefault();
				var rnoValue = $(this).attr("href");
				replyService.remove(rnoValue, 
					function(result){
						alert(result);
						showList(pageNum);
					}
				);
			});
			
			var check = false;
			//댓글 수정
			$(".replies").on("click", "a.modify", function(e){
				e.preventDefault();
				
				if(check){alert("수정중인 댓글이 있습니다."); return;}
				
				var rnoValue = $(this).attr("href");
				var replyTag = $(".reply" + rnoValue);
				replyTag.html("<textarea style='resize: none;' class='" + rnoValue + "'>" + replyTag.text() + "</textarea>");
				$(this).hide();
				
				var finishs = $(".finish");
				for(let i=0; i<finishs.length; i++){
					if($(finishs[i]).attr("href") == rnoValue){
						$(finishs[i]).show();
						check = true;
						break;
					}
				}   			
			});
			
			//수정 완료
			$(".replies").on("click", "a.finish", function(e){
				e.preventDefault();
				
				var rnoValue = $(this).attr("href");
				var newReply = $("." + rnoValue).val();
				
				if(newReply == ""){return;}
				
				replyService.modify({rno:rnoValue, reply:newReply},
						function(result){
							alert(result);
							check = false;
							showList(pageNum);
				});
			});
		});
	</script>
</html>