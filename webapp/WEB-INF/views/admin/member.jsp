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
				height:50px;
			}
		</style>
		
		<script>
			function reply(msg,idn){
				if(msg==null||msg==""){
					return;
				}
				if(idn==null||idn==""){
					alert("삭제"+msg);					
				} else {
					alert(idn+"님의 계정 삭제"+msg);
				}
			}
			function confirmRemove(){
				return confirm("정말로 지우시겠습니까?");
			}
		
			$(document).ready(function(){
				
				var updateMsg='<c:out value="${updateMsg}" escapeXml="false"/>';
				if(updateMsg==null||updateMsg==""){
					console.log("not");
				} else {
					alert(updateMsg);
				}
				
				var msg='<c:out value="${msg}"/>';
				var idn='<c:out value="${idn}"/>';
				reply(msg,idn);
				var actionForm=$("#actionForm");
				
				
				$(".btn-danger").on("click",function(e){
					e.preventDefault();
					if(confirmRemove()){
						$(".apdhidden").remove();
						var str="<input type='hidden' class='apdhidden' name='date' value='"+$("#date").val()+"'>";
						$(this).closest('form').append(str).attr('action','/admin/deleteMember').submit();
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

		        $(".changeAuth").on("change", function(e) {
		            var previousValue = $(this).data('prevValue') || $(this).val();
		            
		            if (confirm("권한을 변경하시겠습니까?")) {
		            	$(".apdhidden").remove();
		            	var str="<input type='hidden' class='apdhidden' name='date' value='"+$("#date").val()+"'>";
						str+="<input type='hidden' class='apdhidden' name='auth' value='"+$(this).val()+"'>";
						$(this).closest('form').append(str).attr('action','/admin/updateAuth').submit();
		            } else {
		            	$(this).val(previousValue);
		                return false;
		            }
		        }).each(function() {
		            $(this).data('prevValue', $(this).val());
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
				<input id="date" type="date" style="position:absolute; right:0.5vw; top:-0.5vw;" value="${date}">	
				<div class="row" style="margin-top:10px">
					<c:if test="${empty member}">
						<div class="col-sm-12" style="text-align:center; font-size:40px; height:60px;">검색결과가 없습니다</div>
					</c:if>
					<c:if test="${not empty member}">
						<c:forEach items="${member}" var="list">
							<form method="post" action="/admin/deleteMember">
								<div class="col-sm-1">		
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<input type="hidden" name="userid" value="${list.userid}"/>
										<button type="submit" class="btn btn-danger" style="margin-top:7px; margin-left:5px;">삭제</button>
									
								</div>
								
								<div class="col-sm-1 getId">
									${list.userid}							
								</div>
								<div class="col-sm-2">
									${list.name}
								</div>
								<div class="col-sm-2">
									<fmt:formatDate pattern="yyyy/MM/dd-HH:mm" value="${list.regdate}"/>
								</div>
								<div class="col-sm-2">
									${list.email}
								</div>
								<div class="col-sm-2">
									${list.phone}
								</div>
								<div class="col-sm-2">
									<c:forEach items="${list.authList}" var="auth">
										<select class="changeAuth" style="width:90%; height:80%; text-align:center; margin-top:5px; margin-left:5px">
											<option value="ROLE_USER" ${auth.auth=="ROLE_USER"?"selected":""}>일반유저</option>
											<option value="ROLE_MEMBER" ${auth.auth=="ROLE_MEMBER"?"selected":""}>기자</option>
										</select>
										
									</c:forEach>
								</div>
							</form>	
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
				<form id="actionForm" action="/admin/member" method="get">
					<input type="hidden" name="pageNum" value="${pages.cri.pageNum}">
					<input type="hidden" name="amount" value="10">
				</form>
				<!-- page번호 이벤트 처리시 필요한 form.end -->
			</div>
		</div>

	
	<%@ include file="./aFooter.jsp" %>		