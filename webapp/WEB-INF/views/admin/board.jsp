<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<!DOCTYPE html>
		
		<%@ include file="./aHeader.jsp" %> 

		<style>
			.row div {
				border:1px solid black;
				word-break:break-all;
				height:200px;
			}
			img{
				width:100%;
				height:100%;
				object-fit:contain;	
			}
		</style>
		<script>
			function reply(msg){
				if(msg==null||msg==""){
					return;
				}	
				if(parseInt(msg)>0){
					alert(msg+"번 기사 삭제성공");
				}
			}
			function confirmRemove(){
				return confirm("정말로 지우시겠습니까?");
			}
		
			$(document).ready(function(){
				var msg='<c:out value="${msg}"/>';
				reply(msg);
				
        		var actionForm=$("#actionForm");
				
				
				$(".btn-danger").on("click",function(e){
					e.preventDefault();
					if(confirmRemove()){
						$(".apdhidden").remove();
						var str="<input type='hidden' class='apdhidden' name='date' value='"+$("#date").val()+"'>";
						$(this).closest('form').append(str).submit();
					}
				});
				
				$("#date").on("change",function(e){
					var date=$("#date").val();
					if(date==null||date==""){
						actionForm.find("input[name='pageNum']").val(1);
						actionForm.submit();
					} else {
						actionForm.find("input[name='pageNum']").val(1);
						$(".apdhidden").remove();
						var str="<input type='hidden' class='apdhidden' name='date' value='"+$("#date").val()+"'>";
						actionForm.append(str).submit();
					}
				});
        		
        		$(".paginate_button a").on("click",function(e){	        			
        			e.preventDefault();
        			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					$(".apdhidden").remove();
					var str="<input type='hidden' class='apdhidden' name='date' value='"+$("#date").val()+"'>";
					actionForm.append(str).submit();
        		});
			});
		</script>   

		<div class="container-fulid" style="margin-top:50px">
			<div class="container" style="position:relative;">
				<span style="margin-right:1vw"><a href="/admin/main">관리자 메인</a></span>
			    <span style="margin-right:1vw"><a href="/admin/member">유저관리</a></span>
				<span style="margin-right:1vw"><a href="/admin/board">기사관리</a></span>
				<span style="margin-right:1vw"><a href="/admin/reply">댓글관리</a></span>
  				<input id="date" type="date" name="date" style="position:absolute; right:0.5vw; top:-0.5vw;" value="${date}">

				<div class="row" style="margin-top:10px">
					<c:if test="${empty board}">
						<div class="col-sm-12" style="text-align:center; font-size:40px; height:60px;">검색결과가 없습니다</div>
					</c:if>
					<c:if test="${not empty board}">				
						<c:forEach items="${board}" var="list">
							<div class="col-sm-1">
								글번호:${list.bno}<br>
								${list.wname}<br>
								id: ${list.writer}
								<form method="post" action="/admin/deleteBoard">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="bno" value="${list.bno}"/>
									<button type="submit" class="btn btn-danger">삭제</button>
								</form>
							</div>
							<div class="col-sm-1">
								<c:if test="${not empty list.updateDate}">
									<fmt:formatDate pattern="yyyy/MM/dd-HH:mm" value="${list.updateDate}"/><br>(수정일)
								</c:if>
								<c:if test="${empty list.updateDate}">
									<fmt:formatDate pattern="yyyy/MM/dd-HH:mm" value="${list.regdate}"/>							
								</c:if>
								
							</div>
							<div class="col-sm-2" style="max-heigh:200px;">
								<c:forEach items="${list.attachList}" var="attach">
									<c:if test="${attach.fileType}">
										<img class="pic" src="/display?fileName=${fn:replace(attach.uploadPath,'\\','/')}/s_${attach.uuid}_${attach.fileName}" alt="기사 이미지">
									</c:if>
								</c:forEach>
							</div>
							<div class="col-sm-2" style="max-height:200px; overflow:auto;">
								${list.title }
							</div>
							<div class="col-sm-6" style="max-height:200px; overflow:auto;">
								${list.content}
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- page번호 출력 ------------------------------------------------------>
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pages.prev}">
							<li class="paginate_button previous">
								<a href="${pages.startPage-1}">Previous</a>
							</li>
						</c:if>
				
						<c:forEach var="num" begin="${pages.startPage}" end="${pages.endPage}">
							<li class="paginate_button ${pages.cri.pageNum==num? 'active' : ''  }">
								<a href="${num}">${num}</a>
							</li>                            		
						</c:forEach>         
				
						<c:if test="${pages.next}">
							<li class="paginate_button next">
								<a href="${pages.endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- page번호출력.end -->
				<!-- page번호 이벤트 처리시 필요한 form -------------------------------------------->
				<form id="actionForm" action="/admin/board" method="get">
					<input type="hidden" name="pageNum" value="${pages.cri.pageNum}">
					<input type="hidden" name="amount" value="${pages.cri.amount}">
				</form>
				<!-- page번호 이벤트 처리시 필요한 form.end -->

			</div>
		</div>	
		
		<%@ include file="./aFooter.jsp" %>
