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
				height:100px;
			}
		</style>
		
		<script>
			function reply(dReplyer,dTitle, dRname, dBno) {
			    if(dBno==null||dBno==""){
			    	return;
			    }
				alert(dBno+"번 기사 "+dTitle+"의 "+dRname+"("+ dReplyer+")님의 댓글 삭제성공");
			}
			function confirmRemove(){
				return confirm("정말로 지우시겠습니까?");
			}
		
			$(document).ready(function(){
				var dReplyer='<c:out value="${dReplyer}"/>';
				var dRname='<c:out value="${dRname}"/>';
				var dBno='<c:out value="${dBno}"/>';
				var dTitle='<c:out value="${dTitle}"/>';
				reply(dReplyer,dTitle, dRname, dBno);
				
        		var actionForm=$("#actionForm");
        		
				
				var dForm=$("#deleteForm");
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
					<c:if test="${empty reply}">
						<div class="col-sm-12" style="text-align:center; font-size:40px; height:60px;">검색결과가 없습니다</div>
					</c:if>
					<c:if test="${not empty reply}">
						<c:forEach items="${reply}" var="rpl">
							<div class="col-sm-1">
								댓글번호<br>${rpl.rno}
								<form method="post" action="/admin/deleteReply">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="rno" value="${rpl.rno}"/>
									<button type="submit" class="btn btn-danger">삭제</button>
								</form>
							</div>
							<div class="col-sm-1" style="max-height:200px; overflow:auto;">
								글번호<br>${rpl.bno}
							</div>						
							<div class="col-sm-1" style="max-height:200px; overflow:auto;">
								${rpl.rname}<br>
								id: ${rpl.replyer}
							</div>
							<div class="col-sm-3">
								<c:if test="${not empty rpl.updateDate}">
									<fmt:formatDate pattern="yyyy/MM/dd-HH:mm" value="${rpl.updateDate}"/><br>(수정일)
								</c:if>
								<c:if test="${empty rpl.updateDate}">
									<fmt:formatDate pattern="yyyy/MM/dd-HH:mm" value="${rpl.replyDate}"/>							
								</c:if>
								
							</div>
							<div class="col-sm-6" style="max-height:200px; overflow:auto;">
								${rpl.reply }
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
				<form id="actionForm" action="/admin/reply" method="get">
					<input type="hidden" name="pageNum" value="${pages.cri.pageNum}">
					<input type="hidden" name="amount" value="${pages.cri.amount}">
				</form>
				<!-- page번호 이벤트 처리시 필요한 form.end -->
			</div>
		</div>
		
		<%@ include file="./aFooter.jsp" %>	