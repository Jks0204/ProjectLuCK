<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />	
	<style>
		.pic2 {
		    width: 50px;
		    height: auto;
		}
		.side-ad{
        	margin-left:-10px;
         	margin-right:0; 
          	position: relative;
          	top: 170px; /* 원하는 값으로 설정 */
        }
		
	</style>

    <div class="col-sm-3 side-ad">
      <table width="100%" class="table table-striped table-bordered">		
		<c:forEach items="${side}" var="board">
			    <tr>
			        <td style="width:50px;">
			          <c:forEach items="${board.attachList}" var="attach">
                          <c:if test="${attach.fileType}">
                               <img class="pic2" src="/display?fileName=${fn:replace(attach.uploadPath,'\\','/')}/s_${attach.uuid}_${attach.fileName}" alt="기사 이미지">                  	
                          </c:if>
                      </c:forEach>
			        </td>
			        <td>
			            <a class="move" href='<c:out value="${board.bno}"/>'> 
			                <c:out value="${board.title}"/>
			                <c:if test="${ board.replyCnt != 0 }">
			                <b>[<c:out value="${board.replyCnt}"/>]</b>
			                </c:if>
			            </a><br/>
						<c:set var="content" value="${board.content}" />
						<c:set var="maxLength" value="30" />
						
						<c:choose>
						    <c:when test="${fn:length(content) > maxLength}">
						        <c:out value="${fn:substring(content, 0, maxLength)}..."/>
						    </c:when>
						    <c:otherwise>
						        <c:out value="${content}"/>
						    </c:otherwise>
						</c:choose>
			        	<br/><c:out value="${board.wname}"/><span style="margin-right: 10px;"></span><i class="fa-solid fa-eye"></i><span style="margin-right: 4px;"></span><c:out value="${board.viewCount}"/>
			        </td>
			    </tr>
			</c:forEach>                     
		</table>

    </div>
    <!-- row끝 -->
