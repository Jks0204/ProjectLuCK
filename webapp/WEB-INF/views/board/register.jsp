<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>    
     <div id="page-wrapper">   
    
       <style>
          /* 천유리 시작 */
          
          .content {
        font-family: "Sunflower", sans-serif;
        font-weight: 300;
        font-style: normal;
        color:black;
      }
          
           .row{
              width:70%;
              margin:0 auto;
           }
           
           .logo-overlay {
          position: fixed;
          top: 50%;
          left: 50%;
          transform: translate(-50%,-50%);
          opacity: 0.1;
          z-index: 10;
          pointer-events: none;
      }
      
      .luck_logo{
         width:100%;
              max-width:800px;
              height:auto;
      }
      
       .content {
           position: relative;
           z-index: 1;
       }
       
       /* 숨기기 파일 입력 필드 */
      input[type="file"] {
          display: none;
      }

      /* 파일선택 */
      .custom-file-upload {
          display: inline-block;
          padding: 8px 16px; /* 사이즈를 줄임 */
          font-size: 14px; /* 글자 크기를 줄임 */
          font-family: "Sunflower", sans-serif; /* 글씨체를 변경 */
          font-weight: normal; /* 글씨체를 일반으로 설정 */
          color: #333; /* 글자색을 검정색으로 설정 */
          background: linear-gradient(145deg, rgba(255, 219, 88, 0.2), rgba(255, 193, 7, 0.2)); /* 그라데이션 배경에 투명도 추가 */
          color: rgba(51, 51, 51, 0.9); /* 텍스트 색상에 약간의 투명도 추가 */
          border: 1px solid rgba(255, 193, 7, 0.6); /* 테두리에 투명도 추가 */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(255, 215, 0, 0.6); /* 그림자 그대로 유지 */
         /*  border-radius: 5px; */
          cursor: pointer;
          text-align: center;
          transition: background 0.1s ease; /* 배경색 전환 애니메이션 추가 */
      }
      
      .custom-file-upload:hover {
          background: linear-gradient(275deg, #F9F9C4, #FFDB58); /* 호버 시 배경 변경 */
	      transform: translateY(-7px);
      }
      
      /* 카테고리 */
.custom-select-wrapper {
    position: relative;
    display: inline-block;
    width: 120px; /* 원하는 너비로 설정 */
}

.custom-select {
	  position: relative;
	  display: inline-block;
      padding: 8px 16px; /* 사이즈를 줄임 */
      font-size: 14px; /* 글자 크기를 줄임 */
      font-family: "Sunflower", sans-serif; /* 글씨체를 변경 */
      font-weight: normal; /* 글씨체를 일반으로 설정 */
      color: #333; /* 글자색을 검정색으로 설정 */
      background: linear-gradient(145deg, rgba(255, 219, 88, 0.2), rgba(255, 193, 7, 0.2)); /* 그라데이션 배경에 투명도 추가 */
      color: rgba(51, 51, 51, 0.9); /* 텍스트 색상에 약간의 투명도 추가 */
      border: 1px solid rgba(255, 193, 7, 0.6); /* 테두리에 투명도 추가 */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(255, 215, 0, 0.6); /* 그림자 그대로 유지 */
      cursor: pointer;
      text-align: center;
      transition: background 0.1s ease; /* 배경색 전환 애니메이션 추가 */
}

.custom-select:hover{
			    background: linear-gradient(275deg, #F9F9C4, #FFDB58); /* 호버 시 배경 변경 */
}
 
.custom-select-trigger {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width:110px;
}

.custom-options {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: #FFF;
    border: 1px solid #ddd;
    /* border-radius: 5px; */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    z-index: 1000; /* 드롭다운이 다른 요소 위에 표시되도록 */
}

.custom-option {
    padding: 10px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #ddd; /* 옵션 간 경계선 */
    cursor: pointer;
}

.custom-option:last-child {
    border-bottom: none;
}

.custom-option:hover {
    background: #FFC107; /* 호버 시 배경색 */
    color: #FFF; /* 호버 시 글자색 */
}

.option-icon {
    margin-left: 10px; /* 이미지와 텍스트 간 여백 */
    width: 10px; /* 이미지 너비 조정 */
    height: 16px; /* 이미지 높이 조정 */
}

/* 옵션에 아이콘 제거 (필요 없음) */
.custom-option img {
    display: none;
}

           /* 천유리 끝 */
           
         .uploadResult {
            width: 100%;
            height:300px;
            background-color: rgba(118, 166, 51, 0.2);
            padding: 10px;
         }
         
         .uploadResult ul {
            display: flex;
            flex-flow: row;
            justify-content: center;
            align-items: center;
         }
         
         .uploadResult ul li {
            list-style: none;
            padding: 10px;
         }
         
         .uploadResult ul li img {
            width: 100px;
         }

         .bigPictureWrapper {
           position: absolute;
           display: none;
           justify-content: center;
           align-items: center;
           top:0%;
           width:100%;
           height:100%;
           background-color: gray; 
           z-index: 100;
         }
         
         .bigPicture {
           position: relative;
           display:flex;
           justify-content: center;
           align-items: center;
         }      
      .btn {
          margin-bottom: 50px;
          margin-left: 20px;
          background: linear-gradient(145deg, rgba(255, 219, 88, 0.2), rgba(255, 193, 7, 0.2)); /* 그라데이션 배경에 투명도 추가 */
          color: rgba(51, 51, 51, 0.9); /* 텍스트 색상에 약간의 투명도 추가 */
          border: 1px solid rgba(255, 193, 7, 0.8); /* 테두리에 투명도 추가 */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(255, 215, 0, 0.6); /* 그림자 그대로 유지 */
          /* border-radius: 5px; */ /* 모서리를 부드럽게 둥글게 */ 
          transition: all 0.3s ease;
      }
      
      .btn:hover {
              background: linear-gradient(145deg, #FFC107, #FFB300); /* 더 어두운 금색으로 그라데이션 변경 */
       box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(255, 215, 0, 0.8); /* 그림자 더 강조 */
       border-color: #FFB300; /* 테두리 색상도 변경 */
          transform: translateY(-10px); /* 살짝 위로 이동하는 효과 */
          color: #fff; /* 텍스트 색상을 흰색으로 설정 */
      }
           
        </style>
          
        <div class="background-image">
      <div class="logo-overlay">
          <img src="/resources/img/luck_logo.png" alt="Logo" class="luck_logo">
      </div>
</div>
      <div class="content">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">글쓰기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <form role="form" action="/board/register" method="post" onsubmit="return validateForm(this);">
                           
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                           
                              <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="title" id="title" placeholder="최대 60글자 입니다.">
                              	 <br><span>글자 수: <span id="titleCount">0</span>/60</span>
                              </div>
                              <div class="form-group">
                                 <label>내용</label>
                                 <textarea class="form-control" id="content" type="text" name="content" placeholder="최대 1,300글자 입니다." maxlength="4000" rows="20"></textarea>
                                 <br><span>글자 수: <span id="charCount">0</span>/1300</span>
                              </div>
                              <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="wname" value='<sec:authentication property="principal.member.name"/>' readonly >   
                                 <input type="hidden" name="writer" value='<sec:authentication property="principal.username"/>' readonly >   
                              </div>    
							
                     	<div class="custom-select-wrapper">
                           <div class="custom-select">
                               <div class="custom-select-trigger">카테고리 선택
                                   <img src="/resources/img/dropdown_icon.png" alt="dropdown_icon" class="dropdown-icon" style="width:15px; height:15px;">
                               </div>
                               <div class="custom-options">
                                   <div class="custom-option" data-value="money">금융</div>
                                   <div class="custom-option" data-value="house">부동산</div>
                                   <div class="custom-option" data-value="life">생활경제</div>
                               </div>
                               <select name="category" id="category-select" style="display:none;">
                                   <option value="" selected>선택 안 함</option>
                                   <option value="money">금융</option>
                                   <option value="house">부동산</option>
                                   <option value="life">생활경제</option>
                               </select>
                           </div>
                       </div>                 
                           </form>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- 첨부파일 ------------------------------------------------------------------------->
            <div class="row">
               <div class="col-lg-12">
                  <div class="panel panel-default">
                     <div class="panel-heading">
                        <b>첨부파일</b>
                     </div>
                     <div class="panel-body">
                        <div class="form-group uploadDiv">
                           <label for="fileInput" class="custom-file-upload">
                         사진을 선택해주세요 (하나만 업로드 가능합니다)
                     </label>
                     <input type="file" id="fileInput" name="uploadFile" multiple />
                        </div>
                        <div class="uploadResult" style="height:300px;">
                           사진을 여기에 끌어다 놓으세요
                           <ul id="imgLists">
                           
                           </ul>
                        </div>
                     </div>                     
                  </div>
               </div>
            </div>            
            <!-- 첨부파일.end --> 
            
            <div class="row">
               <sec:authorize access="isAuthenticated() and hasRole('ROLE_MEMBER')">
			   		<button type="submit" class="btn btn-default">등록</button>
			   </sec:authorize>
               <button id="goList" type="button" data-oper="list" class="btn btn-default" onclick="location.href='/board/list'">목록</button>             
            </div>
           
   <script>
      /* 파일크기.파일확장자 체크 ****************************************************************************/
       function checkExtension(fileName, fileSize){   
          var regex = new RegExp("(.*?)\.(jpg|jpeg|png|svg|gif)$");
          var maxSize = 5242880; //5MB
          
          if(fileSize >= maxSize){
            alert("파일 사이즈 초과, 5MB 이하의 사진을 업로드 해주세요.");
            return false;
          }
          
          if(!regex.test(fileName)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
          }
          return true;
        }
      
      /* 첨부파일목록 미리보기  ******************************************************************************/
      function showUploadResult(uploadResultArr){
         //첨부파일목록이 없으면 중지
         if(!uploadResultArr || uploadResultArr.length==0){
            return;
         }
         
         //출력할 ul태그 미리 찾아놓기
         var uploadUL=$(".uploadResult ul");
         
         var str="";
			//첨부파일목록에서 하나씩 처리 
			$(uploadResultArr).each(function(i,obj){
				//이미지인경우
				if(obj.image){
					//썸네일경로
					var fileCallPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					str+="<li data-path='"+obj.uploadPath+"'";
					str+=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
					str+="	<div>";
					str+="		<span>"+obj.fileName+"</span>";
					str+="		<button type='button' data-file='"+fileCallPath+"' ";
					str+=" 			data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str+="		<image src='/display?fileName="+fileCallPath+"'>";
					str+="	</div>";
					str+="</li>";					
				}else{ //이미지가 아닌 경우
					//파일경로
					var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/"); // '\\'를 '/'로 변경
					str+="<li data-path='"+obj.uploadPath+"'";
					str+=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
					str+="	<div>";
					str+="		<span>"+obj.fileName+"</span>";
					str+="		<button type='button' data-file='"+fileCallPath+"' ";
					str+=" 			data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str+="		<image src='/resources/img/attach.png'>";
					str+="	</div>";
					str+="</li>";	
				}
			});
			//ul태그에 출력
			uploadUL.append(str);
		}
                
      //빈 제목 내용 감지
      // form 태그 onsubmit
      function validateForm(form) {
         if (form.title.value == "") {
            alert("제목을 입력하세요");
            form.title.focus();
            return false;
         }
         if (form.content.value == "") {
            alert("내용을 입력하세요");
            form.content.focus();
            return false;
         }
         if(document.getElementById('category-select').value==""){
            alert("카테고리를 선택해주세요");
            return false;
         }
         if($("#imgLists li").length==0){
       		alert("사진 하나는 반드시 업로드 해야합니다");
       		return false;
         }
         if($("#imgLists li").length>=2){
       		alert("사진은 하나만 업로드 가능합니다");
       		return false;
         }
      }
   
		$(document).ready(function(e){
			/* csrf토큰 처리 *****************************************************************/
			var csrfHeaderName ="${_csrf.headerName}"; 
		    var csrfTokenValue="${_csrf.token}";
			
			/* 첨부파일을 선택했을 때 이벤트 처리 ******************************************************************/
			$("input[type='file']").change(function(e){
				//form태그 역할하는 객체
				var formData=new FormData();
				var inputFile=$("input[name='uploadFile']"); // input type='file' 미리 찾아놓기.
				var files=inputFile[0].files; // 첨부파일목록
				for(var i=0;i<files.length;i++){
					//파일확장자,파일사이즈가 안맞으면 중지
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					//formData에 파일추가
					formData.append("uploadFile",files[i]);
				}
				$.ajax({
					url:'/uploadAjaxAction', //서버주소
					processData: false, // 파일업로드시 설정필요
					contentType: false, // 파일업로드시 설정필요
					beforeSend: function(xhr) { // csrf적용
				          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				      },
					data:formData, // 서버로 전송되는 데이터
					type: "post",  //전송방식
					dataType: 'json', //서버에서 넘어오는 데이터의 형식
					success:function(result){ //성공하면 호출되는 함수. result에 서버에서 넘어온 데이터가 저장됨.
						showUploadResult(result); //첨부파일목록 미리보기 출력
					}
				});
			});
         
         /* x버튼 클릭 이벤트처리. 파일삭제 **************************************************************************/
         //부모인 .uploadResult 에 click이벤트를 위임
         $(".uploadResult").on("click","button",function(e){
            var targetFile=$(this).data("file"); //data-file속성값 읽어오기
            var type=$(this).data("type");//data-type속성값 읽어오기
            var targetLi=$(this).closest("li"); //가장가까운 부모태그 li 찾아오기
            $.ajax({
               url:'/deleteFile', //서버주소
               data:{fileName:targetFile,type:type}, //서버로 전송되는 데이터
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
               dataType:'text', //서버에서 넘어오는 데이터 형식
               type: 'post',//전송방식
               success: function(result){//성공했을 때 호출되는 함수. 서버에서 넘어온 데이터는 result에 저장됨
                  if(result){
            	   alert("삭제되었습니다.");                	  
                  }
                  targetLi.remove(); // li태그 삭제.첨부파일목록에서 삭제                  
               }
            });
         });
         
         /* 등록버튼 이벤트처리 ***********************************************************************/
         var formObj=$("form[role='form']");// form태그 찾아놓기
         $("button[type='submit']").on("click",function(e){
            //전송방지
            e.preventDefault();
            var str="";
            $(".addTag").remove();
            //첨부파일목록에서 하나씩 처리
            $(".uploadResult ul li").each(function(i,obj){
               var jobj=$(obj);// li태그
               //hidden태그 생성
               str+="<input type='hidden' class='addTag' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
               str+="<input type='hidden' class='addTag' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
               str+="<input type='hidden' class='addTag' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
               str+="<input type='hidden' class='addTag' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
            });
            // formObj(form태그)에 hidden태그 추가. 전송
            //formObj.append(str);
            formObj.append(str).submit();
         });
         
         /* 파일드래그시 새탭으로 열리는 것 방지 *********************************************/
         $(".uploadResult").on("dragenter dragover",function(e){
            e.preventDefault();
         });
         /* 파일을 드롭시 새탭으로 열리는 것 방지. 파일업로드 **********************************/
         $(".uploadResult").on("drop",function(e){
            e.preventDefault();
            
            //form태그 역할하는 객체
            var formData=new FormData();
            //drop했을 때 파일목록 구하기
            var files=e.originalEvent.dataTransfer.files;
             
            for(var i=0;i<files.length;i++){
               //파일확장자,파일사이즈가 안맞으면 중지
               if(!checkExtension(files[i].name,files[i].size)){
                  return false;
               }
               //formData에 파일추가
               formData.append("uploadFile",files[i]);
            }
            $.ajax({
               url:'/uploadAjaxAction', //서버주소
               processData: false, // 파일업로드시 설정필요
               contentType: false, // 파일업로드시 설정필요
               beforeSend: function(xhr) { //csrf토큰적용
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
               data:formData, // 서버로 전송되는 데이터
               type: "post",  //전송방식
               dataType: 'json', //서버에서 넘어오는 데이터의 형식
               success:function(result){ //성공하면 호출되는 함수. result에 서버에서 넘어온 데이터가 저장됨.
                  showUploadResult(result); //첨부파일목록 미리보기 출력
               }
            });
         });
         
         // 글자수 세기
         updateCharCount();
         
         $('#content').on('input', function() {
             updateCharCount();
             checkCharLimit();
         });
         function updateCharCount() {
             var content = $('#content').val(); 
             var charCount = content.length; 
             $('#charCount').text(charCount); 
         }
         function checkCharLimit() {
             var content = $('#content').val(); 
             var charCount = content.length; 
             if (charCount > 1300) {
                 alert("내용이 1,300자를 초과하였습니다.");
                 $('#content').val(content.substring(0, 1300)); // 내용 잘라내기
                 updateCharCount();
             }
         }
         // 제목글자수 카운트
         updateTitleCount();
         $('#title').on('input', function() {
             updateTitleCount();
             checkTitleLimit();
         });
         function updateTitleCount() {
             var title = $('#title').val(); 
             $('#titleCount').text(title.length); 
         }
         function checkTitleLimit() {
             var title = $('#title').val(); 
             if (title.length > 60) {
                 alert("제목이 60자를 초과하였습니다.");
                 $('#title').val(title.substring(0, 60)); // 내용 잘라내기
                 updateTitleCount();
             }
         }
         /* 천유리 시작 */
         /* dropdown */   
        const selectTrigger = document.querySelector('.custom-select-trigger');
        const customOptions = document.querySelector('.custom-options');
        const hiddenSelect = document.getElementById('category-select');

        selectTrigger.addEventListener('click', function() {
            customOptions.style.display = customOptions.style.display === 'block' ? 'none' : 'block';
        });

        document.querySelectorAll('.custom-option').forEach(function(option) {
            option.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                selectTrigger.innerHTML = this.innerHTML + '<img src="/resources/img/dropdown_icon.png" alt="dropdown_icon" class="dropdown-icon" style="width:15px; height:15px;">';
                hiddenSelect.value = value;
                customOptions.style.display = 'none';
            });
        });

        document.addEventListener('click', function(e) {
            if (!e.target.closest('.custom-select')) {
                customOptions.style.display = 'none';
            }
        });
           
         
         
      });
      
      /* 천유리 시작 */
      /* dropdown */
     

      
      /* 천유리 끝 */
      
   </script>
                 </div>
        <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->             
<%@ include file="../includes/footer.jsp" %>            