<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<%@ include file="../includes/header.jsp" %>    
           <style>
       .row{
          width:100%;
       }
       .uploadResult {
           width:100%;
           background-color: gray;
           overflow:auto;   
      }
      .uploadResult ul{
        display:flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
      }
      .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        text-align: center;
      }
      .uploadResult ul li img{
        width: 100px;
      }
      .uploadResult ul li span {
        color:white;
      }
      .bigPictureWrapper {
        position: fixed;
        display: none;
        justify-content: center;
        align-items: center;
        top:0 !important;
        left:0 !important;
        width:100%;
        height:100%;
        z-index: 1000 !important;
        background:rgba(0,0,0,0.7);                   
      }
      .bigPicture {
        position: relative;
        display:flex;
        justify-content: center;
        align-items: center;           
      }
      
      .bigPicture img {
        width:600px;
      }
         
       #page-wrapper{
          box-shadow: 3px 15px 25px rgba(0, 50, 0, .9);
          width:60%;
          margin-top:50px;
       }
       .col-sm-3{
           margin-left:40px;
          margin-right:0; 
       }
       
       .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control{
       background-color: #F9F9F9;
       opacity:1;
       }
       
       .btn-default{
          background: linear-gradient(135deg, #C8E2C2, #CCDBC8); /* 더 옅은 그라디언트 배경 색상 */
          color: #000000; /* 텍스트 색상 */
          border: 0.2px solid #B5DF9E; /* 테두리 두께 줄임 */
          padding: 8px 16px; /* 패딩 조정 */
          font-size: 15px; /* 폰트 크기 */
          font-weight: 5; /* 폰트 두께 줄임 */
          border-radius: 1px; /* 모서리 둥글게 */
          transition: background 0.3s ease, color 0.3s ease, border-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease; /* 호버 효과 전환 */
      }

      .btn-default:hover {
          background: linear-gradient(135deg, #A3D09A, #7FA96E); /* 호버 시 그라디언트 색상 */
          color: #ffffff; /* 호버 시 텍스트 색상 유지 */
          border-color: #92B68A; /* 호버 시 테두리 색상 변경 */
          transform: translateY(-4px); /* 호버 시 버튼이 살짝 위로 이동 */
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4); /* 호버 시 그림자 추가 */
      }
      
      .form-group .pic{
         width:100%;
         margin:0 auto;
      }
      
      .col-lg-12{
         margin-bottom:20px;
      }
      
      .btn-modify{
         margin: 10px -10px 50px 10px;
          background: linear-gradient(145deg, rgba(255, 219, 88, 0.2), rgba(255, 193, 7, 0.2));
          color: rgba(51, 51, 51, 0.9);
          font-weight:400;
          border: 1px solid rgba(255, 193, 7, 0.6);
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(255, 215, 0, 0.6);
          transition: all 0.3s ease;
      }

      .btn-modify:hover {
             background: linear-gradient(145deg, #FFC107, #FFB300); /* 더 어두운 금색으로 그라데이션 변경 */
             box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(255, 215, 0, 0.8); /* 그림자 더 강조 */
             border-color: #FFB300; /* 테두리 색상도 변경 */
             transform: translateY(-10px); /* 살짝 위로 이동하는 효과 */
             color: #fff; /* 텍스트 색상을 흰색으로 설정 */
            }
        
       #addReplyBtn {
          background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2)); /* 초록색 계열로 그라데이션 변경 */
          color: rgba(51, 51, 51, 0.9);
          font-weight: 400;
          border: 1px solid rgba(76, 175, 80, 0.6); /* 테두리 색상도 초록색으로 변경 */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6); /* 그림자 초록색으로 변경 */
          border-radius: 0;
          padding: 10px 15px;
          transition: all 0.3s ease;
      }

      #addReplyBtn:hover {
          background: linear-gradient(145deg, #4CAF50, #388E3C); /* 어두운 초록색으로 그라데이션 변경 */
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8); /* 호버 시 그림자 더 강조 */
          border-color: #388E3C; /* 테두리 색상도 어두운 초록색으로 변경 */
          transform: translateY(-10px); /* 살짝 위로 이동하는 효과 */
          color: #fff; /* 텍스트 색상을 흰색으로 설정 */
      }
      
      .panel-heading{
         margin-top:0px;
         font-size:20px;
      }
      
      
      #modalRegisterBtn{
         background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2)); /* 초록색 계열로 그라데이션 변경 */
          color: rgba(51, 51, 51, 0.9);
          font-weight: 400;
          border: 1px solid rgba(76, 175, 80, 0.6); /* 테두리 색상도 초록색으로 변경 */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6); /* 그림자 초록색으로 변경 */
          border-radius: 0;
          padding: 8px 10px;
          transition: all 0.3s ease;
      }
      
      #modalRegisterBtn:hover{
         background: linear-gradient(145deg, #4CAF50, #388E3C); /* 어두운 초록색으로 그라데이션 변경 */
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8); /* 호버 시 그림자 더 강조 */
          border-color: #388E3C; /* 테두리 색상도 어두운 초록색으로 변경 */
          transform: translateY(-7px); /* 살짝 위로 이동하는 효과 */
          color: #fff; /* 텍스트 색상을 흰색으로 설정 */
      }
      
      #modalCloseBtn {
          background: linear-gradient(145deg, rgba(96, 125, 139, 0.2), rgba(69, 90, 100, 0.2)); /* 회색 계열로 그라데이션 */
          color: rgba(51, 51, 51, 0.9);
          font-weight: 400;
          border: 1px solid rgba(96, 125, 139, 0.6); /* 테두리 색상도 회색으로 변경 */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(96, 125, 139, 0.6); /* 그림자 회색으로 변경 */
          border-radius: 0;
          padding: 8px 10px;
          transition: all 0.3s ease;
      }

      #modalCloseBtn:hover {
          background: linear-gradient(145deg, #78909C, #808080); /* 어두운 회색으로 그라데이션 변경 */
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(96, 125, 139, 0.8); /* 호버 시 그림자 더 강조 */
          border-color: #455A64; /* 테두리 색상도 어두운 회색으로 변경 */
          transform: translateY(-7px); /* 살짝 위로 이동하는 효과 */
          color: #fff; /* 텍스트 색상을 흰색으로 설정 */
      }
      
      .modal-body label {
         font-weight:450;
      }
      .form-group input{
         font-weight:200;
      }
      
      .side-ad{
           margin-left:70px !important;
            margin-right:0; 
            padding-left:50px; 
             position: relative;
             margin-top:-120px; /* 원하는 값으로 설정 */
        }
        
      @media (max-width: 800px) {
         .side-ad {
            display: none;
         }
         #page-wrapper{
            margin-left:10% !important;
         }
         .navbar-right{
            margin-right:0;
         }
      }
      
      @media (max-width: 768px) {
           #page-wrapper{
            margin-left:20% !important;
            margin-top:10%;
         }
       }
      
      
    </style>
       <div class="row">
         <div class="col-sm-1"></div>
           <div id="page-wrapper" class="col-sm-8" style="padding-right:0px !important;">
       
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><c:out value="${board.title}"/></h1>
                </div>
                <div>
                <p class="col-lg-12" style="color: #5D7C0D; font-size: 15px;">
    <span style="background-color: rgba(126, 211, 81, 0.1); padding: 1px 10px; border-radius: 16px; display: inline-block;">
        <c:out value="${board.wname}"/>&nbsp&nbsp;<i class="fa-regular fa-pen-to-square"></i>&nbsp&nbsp;
        <c:if test="${empty board.updateDate}"><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${board.regdate}"/></c:if>
        <c:if test="${not empty board.updateDate}"><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${board.updateDate}"/>(수정됨)</c:if>
    </span>
    <span style="float:right;">
        <span style="background-color: rgba(126, 211, 81, 0.1); padding: 1px 10px; border-radius: 16px; display: inline-block;">
            조회수 : [<c:out value="${board.viewCount}"/>]
        </span>
    </span>
</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover">                   
                              <div class="form-group">
                         <c:forEach items="${board.attachList}" var="attach">
                             <c:if test="${attach.fileType}">
                                 <img class="pic" src="/display?fileName=${fn:replace(attach.uploadPath,'\\','/')}/${attach.uuid}_${attach.fileName}" alt="기사 이미지">
                             </c:if>
                         </c:forEach>
                         <textarea class="form-control" rows="30" name="content" style="margin-top:1vw; font-size:20px; font-weight:380;" readonly><c:out value="${board.content}"/></textarea>
                     </div>
                              
                      <%--      <button class="btn btn-default">
                              <a href="/board/modify?bno=<c:out value='${board.bno}'/>">Modify</a>
                           </button>
                           <button type="reset" class="btn btn-default">
                              <a href="/board/list">List</a>
                           </button>    --%>       
                           
                           <%-- principal을 pinfo변수에 저장 --%>
                           <sec:authentication property="principal" var="pinfo" />
                           <%-- 로그인이 되어있고, 로그인아이디와 작성자가 같을 때 Modify버튼 출력 --%>
                           <sec:authorize access="isAuthenticated() and hasRole('ROLE_MEMBER')">
                           <c:if test="${pinfo.username eq board.writer}">
                              <button data-oper="modify" class="btn btn-default">글 수정</button>
                           </c:if>                            
                           </sec:authorize>                       
                              <button data-oper="list" class="btn btn-default main-btn" style="float:right;">목록</button>
                          
                           </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- 첨부파일 ------------------------------------------------------------------->
            <div class='bigPictureWrapper'>
           <div class='bigPicture'>
           </div>
         </div>         
         
         <div class="row">
           <div class="col-lg-12">
             <div class="panel panel-default">
         
               <!--  end panel-body -->
             </div>
             <!--  end panel-body -->
           </div>
           <!-- end panel -->
         </div>
         <!-- /.row -->          
            
            
            <!-- 댓글목록 ---------------------------------------------------------------->
            <div class="row">
               <div class="col-lg-12">
                  <div class="panel panel-defualt">
                     <div class="panel-heading">
                        <i class="fa fa-comments fa-fw"></i> 댓글
                        
                        <%-- 로그인한 경우만 댓글등록 버튼 출력 --%>
                        <sec:authorize access="isAuthenticated()">
                        <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 작성</button>
                        </sec:authorize>
                        
                     </div>
                     <div class="panel-body">
                        <!-- 댓글목록 출력 UL태그 --------------------------------------->
                        <ul class="chat">
                        
                        </ul>
                     </div>
                     <div class="panel-footer"></div>
                  </div>
               </div>
            </div>
            
            <!-- 댓글목록.end -->
            
            
            
            <!-- 모달 ------------------------------------------------------------------->            
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal"
                         aria-hidden="true">&times;</button>
                       <h4 class="modal-title" id="myModalLabel">댓글&nbsp&nbsp;<i class="fa fa-comments fa-fw"></i></h4>
                     </div>
                     <div class="modal-body">
                       <div class="form-group">
                         <textarea class="form-control" name='reply' id="reply" placeholder="매너있는 댓글 부탁드립니다" style="height:100px; word-break:break-all;" ></textarea>
                         <span id="showCount"><span id="charCount">0</span>/100</span>                                  
                       </div>      
                       <div class="form-group">
                         <label>작성자</label> 
                           <input class="form-control" name='rname' value="" readonly> 
                            <input type="hidden" name='replyer' value="">
                       </div>
                       <div class="form-group">
                         <label>댓글 작성일</label> 
                         <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
                       </div>               
                     </div>
                  <div class="modal-footer">
                       <button id='modalModBtn' type="button" class="btn btn-warning">댓글 수정</button>
                       <button id='modalRemoveBtn' type="button" class="btn btn-danger">댓글 삭제</button>
                       <button id='modalRegisterBtn' type="button" class="btn btn-primary">댓글 등록</button>
                       <button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
                     </div>          
                  </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div>
            <!-- 모달.end -->
            
            
            <!-- 히든태그에 값을 넣어서 전송하기위한 폼 ----------------------------------------> 
            <form id="operForm" action="/board/modify" method="get">
               <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
               <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
               <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
               <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
               <input type="hidden" name="category" value='<c:out value="${cri.category}"/>'>
            </form>            
            <!-- 히든태그에 값을 넣어서 전송하기위한 폼.end -->
    
   <script>   
      /* csrf토큰 *****************************************************************/
      var csrfHeaderName ="${_csrf.headerName}"; 
      var csrfTokenValue="${_csrf.token}";
      
      
      /* 댓글작성자 *****************************************************************************/
      var replyer="";
      var rname="";
      <sec:authorize access="isAuthenticated()">          
         var replyer = '<sec:authentication property="principal.username"/>';
            <sec:authentication property="principal" var="pinfo" />
         var rname= "${pinfo.member.name}";
           
      </sec:authorize>
      
      // 사이드바 적용, 정관수
      $(document).ready(function(){
         $(".move").on("click",function(e){
            e.preventDefault(); //기본이벤트방지.다른페이지로 넘어가는 것 방지
            var sideForm=$("#operForm");
             sideForm.find("input[name='bno']").val($(this).attr("href"));     
             sideForm.attr("action","/board/get"); //상세보기로 변경   
            sideForm.submit();//폼전송
         });         
      });
      
   </script>      
      
     <script src="/resources/js/reply3.js?bno=<c:out value='${board.bno}'/>"></script>    
        
            
       </div>
           <!-- /#page-wrapper -->
      <%@ include file="../includes/sidebar.jsp" %> 
    </div>
    <!-- /#wrapper -->        
            
<%@ include file="../includes/footer.jsp" %>            