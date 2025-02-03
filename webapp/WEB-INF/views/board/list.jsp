<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<%@ include file="../includes/header.jsp" %>    
             
       <style>
       a:hover{
       		text-decoration:none;
       }
       .row{
          width:100%;
       }
       .panel-default{
          box-shadow: 3px 15px 25px rgba(0, 50, 0, .9);
          margin-top:10px;
          width:100%;
       }

         /* 재혁 */
         .thumbnails {
             display: flex;        /* Flexbox를 사용하여 썸네일을 정렬 */
             flex-wrap: wrap;      /* 여러 줄로 썸네일 감싸기 */
             gap: 10px;            /* 썸네일 사이의 간격 설정 */
         }
         
         .thumbnails img {
             width: 150px;         /* 썸네일 이미지의 너비 */
             height: 150px;        
             object-fit: cover;    
         }
         /* 재혁.end */
         
         .category-nav img {
             width: 70px;
             height: 70px;
         }
         .menu-container{
               width:100%; 
               margin:20px auto;
         }
        #side-menu td {
           width: 400px;
           text-align: center;
      	}
         /* 천유리 시작 0831 */
.btn-primary {
    background: linear-gradient(135deg, #C8E2C2, #CCDBC8); /* 더 옅은 그라디언트 배경 색상 */
    color: #000000; /* 텍스트 색상 */
    border: 0.2px solid #B5DF9E; /* 테두리 두께 줄임 */
    padding: 8px 16px; /* 패딩 조정 */
    font-size: 15px; /* 폰트 크기 */
    font-weight: 5; /* 폰트 두께 줄임 */
    border-radius: 1px; /* 모서리 둥글게 */
    transition: background 0.3s ease, color 0.3s ease, border-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease; /* 호버 효과 전환 */
   margin-right:15px;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #A3D09A, #7FA96E); /* 호버 시 그라디언트 색상 */
    color: #ffffff; /* 호버 시 텍스트 색상 유지 */
    border-color: #92B68A; /* 호버 시 테두리 색상 변경 */
    transform: translateY(-4px); /* 호버 시 버튼이 살짝 위로 이동 */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4); /* 호버 시 그림자 추가 */
}

         /* 카테고리 부모 div에 위치 관련 스타일을 추가 */
         #selectCategory {
             position: relative; /* 또는 'static'일 수도 있음 */
         }
         
         /* 카테고리 'active' 클래스를 가진 <td>에 대한 스타일 */
         #side-menu td.active {
             position: relative; /* '::after' 가상 요소의 기준 위치 */
         }
         
         /* 카테고리  'active' 클래스가 있는 <td> 내부의 <a> 요소에 대한 스타일 */
         #side-menu td.active a::after {
             content: ''; /* 내용 없음 */
             position: absolute;
             bottom: -4px; /* 밑줄 위치 */
             left: 0;
             width: 100%; /* 전체 너비 */
             height: 4px; /* 밑줄 두께 */
             background: linear-gradient(to right, #76A633, #ffffff); /* 색상 그라디언트 */
                z-index: -1; /* 글자 위에 위치하게 함 */
         }

/* 기본 선택 상자 스타일 */
#searchForm select {
    position: relative;
    display: inline-block;
    padding: 8px 16px;
    margin:2px;
    font-size: 14px;
    font-family: "Sunflower", sans-serif;
    font-weight: normal;
    color: #000;
    background: linear-gradient(145deg, rgba(200, 200, 200, 0.3), rgba(180, 180, 180, 0.3));
   border: 1px solid rgba(180, 180, 180, 0.7);
   box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(200, 200, 200, 0.7);
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    appearance: none; /* 기본 스타일 제거 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
}

#searchForm {
   margin-left: 15px;
}

/* 입력 상자 스타일 */
#searchForm input {
    padding: 8px 16px;
    margin:2px;
    font-size: 14px;
    font-family: "Sunflower", sans-serif;
    font-weight: normal;
    color: #333;
background: linear-gradient(145deg, rgba(200, 200, 200, 0.3), rgba(180, 180, 180, 0.3));
border: 1px solid rgba(180, 180, 180, 0.7);
box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(200, 200, 200, 0.7);
    border-radius: 1px;
    outline: none; /* 기본 포커스 스타일 제거 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
}

/* 기본 버튼 스타일 */
.btn-default {
    display: inline-block;
    padding: 9.5px 16px;
    margin:2px;
    font-size: 14px;
    font-family: "Sunflower", sans-serif;
    font-weight: normal;
    color: #333;
    background: linear-gradient(145deg, rgba(200, 200, 200, 0.3), rgba(180, 180, 180, 0.3));
   border: 1px solid rgba(180, 180, 180, 0.7);
   box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(200, 200, 200, 0.7);
    border-radius: 1px;
    cursor: pointer;
    text-align: center;
    text-decoration: none; /* 링크에 사용되는 경우 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
}

/* 호버 및 포커스 시 효과 */
#searchForm select:hover,
#searchForm input:hover,
.btn-default:hover,
#searchForm select:focus,
#searchForm input:focus,
.btn-default:focus {
     background: linear-gradient(145deg, rgba(180, 180, 180, 0.4), rgba(160, 160, 160, 0.4));
    border: 1px solid rgba(160, 160, 160, 0.8);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(180, 180, 180, 0.8);
    transform: translateY(-5px);
    outline:none;
}

/* 클릭 시 효과 */
#searchForm select:active,
#searchForm input:active,
.btn-default:active {
    background: linear-gradient(145deg, rgba(160, 160, 160, 0.8), rgba(140, 140, 140, 0.8)); /* 클릭 시 배경색 변경 */
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2), inset 0 0 8px rgba(170, 170, 170, 0.8); /* 클릭 시 그림자 효과 변경 */
   transform: translateY(2px); /* 클릭 시 살짝 눌린 느낌 */
   outline:none !important;
}

.more-button{
   width:100%;
   height:45px;
   color:#5D7C0D; 
   font-size:15px; 
   font-weight:130;
   background-color:rgba(126, 211, 81, 0.3); 
   padding: 1px 10px; 
   border-radius: 40px;
   margin-bottom: 30px;
   margin-top:20px;
   transition: transform 0.3s ease, background-color 0.3s ease;
   font-size:20px;
   border:1px solid #04D05D;
}

.more-button:hover {
    transform: translateY(13px);
    background-color: rgba(126, 211, 81, 0.7); /* 호버 시 배경색을 조금 더 진하게 */
}
		@media (max-width: 768px) {
          .sidebar-content {
            display: none;
          }
         #page-wrapper{
            width:100%;
            padding-left:50px;
          }
          
         .menu-container {
            min-width: 400px;
            width:100%; 
                 margin:10px auto;
          }
         
           #side-menu {
             width:100%;
             table-layout: fixed;
              margin:10px auto;
          }
            
          #side-menu td {
              width: 200px;
              text-align: center;
          }
        }


         /* 천유리 끝 */
      </style>
       <div id="selectCategory" class="menu-container"> 
          <table id="side-menu" class="category-nav">
             <tr>
                 <td class="${pageMaker.cri.category == '' || pageMaker.cri.category == null ? 'active' : ''}">
                     <a href="${pageMaker.cri.category}" data-value="">
                         <img src="/resources/img/main_icon.png" alt="main_icon" class="main_icon">
                         통합
                     </a>
                 </td>
                 <td class="${pageMaker.cri.category eq 'money' ? 'active' : ''}">
                     <a href="${pageMaker.cri.category}" data-value="money">
                         <img src="/resources/img/money_icon.png" alt="money_icon" class="money_icon">
                         금융
                     </a>
                 </td>
                 <td class="${pageMaker.cri.category eq 'house' ? 'active' : ''}">
                     <a href="${pageMaker.cri.category}" data-value="house">
                         <img src="/resources/img/house_icon.png" alt="house_icon" class="house_icon">
                         부동산
                     </a>
                 </td>
                 <td class="${pageMaker.cri.category eq 'life' ? 'active' : ''}">
                     <a href="${pageMaker.cri.category}" data-value="life">
                         <img src="/resources/img/life_icon.png" alt="life_icon" class="life_icon">
                         생활경제
                     </a>
                 </td>
             </tr>
         </table>
       </div>
       
       <div class="row">
         <div id="page-wrapper" class="col-sm-9">
         
            <div class="row">
               <div class="col-lg-12">
                  <h1 class="page-header">뉴스 기사
                  
                  
                 </h1>
               </div>
                  <!-- 검색폼 ----------------------------------------------------------->
                           <form id="searchForm" action="/board/list" method="get">
                               <select name="type" class="dropdown-content" style="border-radius:1px;">
                                  <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                                  <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                                  <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                                  <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
                                  </select>
                               <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                               <input type="hidden" id = "amount" name="amount" value="${pageMaker.cri.amount}">
                               <input type="hidden" id="hiddenCategory" name="category" value="${pageMaker.cri.category}">
                               <input type="hidden" id="total" value="${ pageMaker.total }">
                               <button class="btn btn-default">검색</button>
                            <!-- 검색폼.end -->
                            <sec:authorize access="isAuthenticated() and hasRole('ROLE_MEMBER')">
                  <a href="/board/register" class="btn btn-primary btn-xs pull-right" style="float:right; font-size:15px;">글쓰기</a>
                   </sec:authorize>
                            </form>
               <!-- /.col-lg-12 -->
            </div>
            <div>
            </div>
            <!-- /.row -->
            <div class="row">
               <div class="col-lg-12">
               <div class="panel panel-default">
               <!-- /.panel-heading -->
						<div class="panel-body" style="width: 100%;min-height:1200px;" >
                            
                            <c:if test="${empty list}">
                            	<table width="100%" id="listboard" class="table table-striped table-bordered table-hover">
                                     <td style="text-align:center; font-size:21px;">검색결과가 없습니다.&nbsp&nbsp;<i class="fa-solid fa-triangle-exclamation" style="font-size:21px; color:red;"></i></td>
                                </table>
                            </c:if>
                            <c:if test="${not empty list}">
                               	<table width="100%" id="listboard" class="table table-striped table-bordered table-hover" >
                                	<c:forEach items="${list}" var="board">
                           				<tr>
                              				<td class="th1">
                              					<div class="thumbnails">
				                                  <c:if test="${not empty board.attachList}">
				                                      <c:forEach items="${board.attachList}" var="attach" varStatus="status">
				                                          <c:if test="${status.index == 0 && attach.fileType}">
				                                              <img class="pic" src="/display?fileName=${fn:replace(attach.uploadPath,'\\','/')}/s_${attach.uuid}_${attach.fileName}" alt="기사 이미지" >
				                                          </c:if>
				                                      </c:forEach>
				                                  </c:if>
				                              </div>
				                            </td>
                           					<td style="position:relative;">
			                              		<a class="move" href='<c:out value="${board.bno}"/>'>
				                                 	<div style="font-size:20px;"><c:out value="${board.title}"/>
				                                 		<c:if test="${ board.replyCnt != 0 }">
				                                    		<b>[<c:out value="${board.replyCnt}"/>]</b>
				                                 		</c:if>
				                                 	</div>
			                              		</a>
			                              		<br/>
					                            <c:set var="content" value="${board.content}" />
					                            <c:set var="maxLength" value="150" />
			                              
					                             <c:choose>
					                                 <c:when test="${fn:length(content) > maxLength}">
					                                     <c:out value="${fn:substring(content, 0, maxLength)}..."/>
					                                 </c:when>
					                                 <c:otherwise>
					                                     <c:out value="${content}"/>
					                                 </c:otherwise>
					                             </c:choose>
					                             <br/>
							                     <div style="right:5px; bottom:5px; position:absolute; color:#5D7C0D; font-size:15px; background-color:rgba(126, 211, 81, 0.1); padding: 1px 10px; border-radius: 16px;">
								                     <c:out value="${board.wname}"/>&nbsp&nbsp;<i class="fa-regular fa-pen-to-square"></i>&nbsp&nbsp;
								                     <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${board.regdate}"/>
							                     </div>
			                          		</td>
			                        	</tr>
									</c:forEach>
                            	</table>
                            	<span style="float:right"><i class="fa-regular fa-newspaper"></i>&nbsp&nbsp;전체 글수 [<c:out value="${pageMaker.total}"/>]</span>
							    <div style="text-align:center;display:none;" id="showMoreBtn">
							    	<button class="more-button" type="submit" id="moreButton">더보기&nbsp&nbsp;<i class="fa-solid fa-arrow-turn-down"></i></button>
							    </div>
                        	</c:if>                      
                            <!-- /.table-responsive -->


							
                            <!-- page번호 이벤트 처리시 필요한 form -------------------------------------------->
                            <form id="actionForm" action="/board/list" method="get">
                               <input type="hidden" id="pageNume" name="pageNum" value="${pageMaker.cri.pageNum}">
                               <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
                               <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
                               <input type="hidden" name="category" value='<c:out value="${pageMaker.cri.category}"/>'>
                               <input type="hidden" value="${ pageMaker.total }">
                            </form>
                            <!-- page번호 이벤트 처리시 필요한 form.end -->
                            
                            
                            
                            <!-- 모달 ------------------------------------------------------------>
                            
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                                 <h4 class="modal-title" id="myModalLabel">알림</h4>
                              </div>
                              <div class="modal-body">해당 기사가 삭제되었습니다.</div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                                 
                              </div>	
                           </div>
                           <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                     </div>
                     
                            <!-- 모달.end ------------------------------------------------------------------------>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <script>

               $(document).ready(function(){
            	   
                  /* csrf토큰 **********************************************************/
                 var csrfHeaderName ="${_csrf.headerName}"; 
                 var csrfTokenValue="${_csrf.token}";
                 
                  //등록된 글번호
                  var result='<c:out value="${result}"/>';
                  
                  checkModal(result);
                  
                  /* 모달창 띄우기 ************************************************************/
                  function checkModal(result){
                     if(result===""){
                        return;
                     }
                     if(parseInt(result)>0){
                        $(".modal-body").html("게시글 "+parseInt(result)+"번 글이 등록되었습니다.");
                     }
                     $("#myModal").modal("show"); //모달창 보이게
                  }
                  
                  /* 페이지번호 이벤트처리 ********************************************************/
                  var actionForm=$("#actionForm"); // id "actionForm"을 미리 찾아놓음
                  
                  $(".paginate_button a").on("click",function(e){
                     console.log("@@@@@@@@@@@@@");
                     
                     e.preventDefault(); // 링크를 클릭했을 때 다음주소로 넘어가는 것을 방지
                     actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                     actionForm.attr("action","/board/list"); // 목록으로 전송
                     actionForm.submit(); //폼전송
                  });
                  
               /* 더보기 버튼 이벤트 처리 ******************************************/
                 var currentAmount = parseInt($("#amount").val()); // 현재 amount 값 가져오기
                 
                 if(${ pageMaker.total }>10 && currentAmount<${ pageMaker.total }){
                	 $("#showMoreBtn").css("display","block");
                 } else {
                	 $("#showMoreBtn").css("display","none");
                 }
                 
			    $("#moreButton").on("click", function(e) {
			        e.preventDefault();
			
			        $.ajax({
			            url: '/board/list', // 데이터를 요청할 URL
			            type: 'GET',
			            data: {
			                pageNum: "${pageMaker.cri.pageNum}", // 현재 페이지 번호
			                amount: currentAmount + 5, // 현재 amount 값 + 5
			                type: '<c:out value="${pageMaker.cri.type}"/>',
			                keyword: '<c:out value="${pageMaker.cri.keyword}"/>',
			                category: '${pageMaker.cri.category}' // 현재 카테고리 값
			            },
			            success: function(response) {
			            	console.log(response);
			                // 응답 데이터를 받아서 처리하는 부분
			                var $table = $("#listboard"); // 데이터를 추가할 테이블
			                var newRows = $(response).find("#listboard").html(); // 응답에서 새로운 데이터 추출
			                
			                if( currentAmount + 5 >= ${pageMaker.total}){
			                	$("#moreButton").hide();
			                }
			                
			                if (newRows.trim().length > 0) {
			                	$table.empty();
			                	$table.append(newRows); // 테이블에 새로운 데이터 추가
			                    currentAmount += 5; // 현재 amount 값 업데이트
			                    $("#amount").val(currentAmount); // hidden input 값 업데이트
			                }
			            },
			            error: function(xhr, status, error) {
			                console.error("Ajax 요청 실패:", status, error);
			            }
			        });
			    
			    });
                 
                   /* 더보기 버튼.end */
                  
                  /* 제목클릭시 이벤트처리 ************************************************************************/
                 $(document).on("click", ".move", function(e) {
                   e.preventDefault(); // 기본 동작 방지
               
                   // if문으로 제어해서 bno가 한번만 append되도록 변경
                   if (!actionForm.find("input[name='bno']").val()) {
                       actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
                   } else {
                       actionForm.find("input[name='bno']").val($(this).attr("href"));
                   }
                   actionForm.attr("action", "/board/get"); // 상세보기로 변경   
                   actionForm.submit(); // 폼전송
               });
                  
                  /* 검색버튼 이벤트처리 ******************************************************************************/
                  var searchForm=$("#searchForm");
                  $("#searchForm button").on("click",function(e){
                     e.preventDefault(); // 폼전송방지
                     if(!searchForm.find("option:selected").val()){
                        alert("검색필드를 선택하세요");
                        return false;
                     }
                     if(!searchForm.find("input[name='keyword']").val()){
                        alert("검색어를 입력하세요");
                        return false;
                     }
                     searchForm.find("input[name='pageNum']").val("1");                     
                     searchForm.submit();
                     
                  });
                  
                  
                  // 정관수 추가
                    var menuItems = $('#selectCategory a');
                    var hiddenInput = $('#hiddenCategory');

                    // category 선택한 것 값찾아 hidden input에 넣기
                    menuItems.on('click', function(event) {
                       event.preventDefault();

                       menuItems.parent().removeClass('active');
                       $(this).parent().addClass('active');

                       hiddenInput.val($(this).data('value'));
                       
                       searchForm.find("input[name='pageNum']").val("1"); 
                       searchForm.find("input[name='amount']").val("10"); 
                       searchForm.submit(); //폼전송
                    });
                  
               });
            </script>
            
      </div>
        <!-- /#page-wrapper -->
        <div class="sidebar-content">
      		<%@ include file="../includes/sidebar.jsp" %> 
    	</div>
    </div>
    <!-- /#wrapper -->       
            
<%@ include file="../includes/footer.jsp" %>            