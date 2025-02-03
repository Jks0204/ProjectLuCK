<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
   
<%@ include file="./aHeader.jsp" %>    
<h2>${msg}</h2>
<style>
    .row a { color: black; font-size: 2vw; }
    a:hover { text-decoration: none; opacity: 0.5; }

    .animated-image {
        position: fixed;
        width: 30px; /* 이미지 크기 조정 */
        height: 30px; /* 이미지 크기 조정 */
        z-index: 9999;
        opacity: 0; /* 초기에는 보이지 않음 */
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-delay: 0s;
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        20% {
            opacity: 1;
        }
        100% {
            opacity: 1;
        }
    }

    @keyframes moveAndRotate {
        0% {
            top: var(--start-top);
            left: var(--start-left);
            transform: rotate(0deg);
        }
        100% {
            top: calc(var(--start-top) + 100vh);
            left: calc(var(--start-left) + 100vh);
            transform: rotate(720deg); /* 720도 회전 */
        }
    }

    /* 개별 이미지 설정 */
    .animated-image:nth-child(1) { 
        --start-top: -10%;
        --start-left: 0%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 0s;
    }
    .animated-image:nth-child(2) { 
        --start-top: 5%;
        --start-left: 15%;
        animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 1s;
    }
    .animated-image:nth-child(3) { 
        --start-top: 10%;
        --start-left: 30%;
        animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 2s;
    }
    .animated-image:nth-child(4) { 
        --start-top: 20%;
        --start-left: 45%;
        animation: moveAndRotate 8s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 3s;
    }
    .animated-image:nth-child(5) { 
        --start-top: 25%;
        --start-left: 60%;
        animation: moveAndRotate 6.5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 4s;
    }
    .animated-image:nth-child(6) { 
        --start-top: 40%;
        --start-left: 10%;
        animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 5s;
    }
    .animated-image:nth-child(7) { 
        --start-top: 45%;
        --start-left: 25%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 6s;
    }
    .animated-image:nth-child(8) { 
        --start-top: 55%;
        --start-left: 40%;
        animation: moveAndRotate 7.5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 7s;
    }
    .animated-image:nth-child(9) { 
        --start-top: 65%;
        --start-left: 55%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 8s;
    }
    .animated-image:nth-child(10) { 
        --start-top: 75%;
        --start-left: 70%;
        animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 9s;
    }
    .animated-image:nth-child(11) { 
        --start-top: 85%;
        --start-left: 85%;
        animation: moveAndRotate 8s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 10s;
    }
    .animated-image:nth-child(12) { 
        --start-top: 90%;
        --start-left: 95%;
        animation: moveAndRotate 7.5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 11s;
    }
    .animated-image:nth-child(13) { 
        --start-top: 90%;
        --start-left: 5%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 12s;
    }
    .animated-image:nth-child(14) { 
        --start-top: 80%;
        --start-left: 20%;
        animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 13s;
    }
    .animated-image:nth-child(15) { 
        --start-top: 70%;
        --start-left: 35%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 14s;
    }
    .animated-image:nth-child(16) { 
        --start-top: 60%;
        --start-left: 50%;
        animation: moveAndRotate 7.5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 15s;
    }
    .animated-image:nth-child(17) { 
        --start-top: 70%;
        --start-left: 80%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 16s;
    }
    .animated-image:nth-child(18) { 
        --start-top: 80%;
        --start-left: 75%;
        animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 17s;
    }
    .animated-image:nth-child(19) { 
        --start-top: 90%;
        --start-left: 60%;
        animation: moveAndRotate 6s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 18s;
    }
    .animated-image:nth-child(20) { 
        --start-top: 80%;
        --start-left: 40%;
        animation: moveAndRotate 7.5s linear infinite, fadeIn 6s linear infinite;
        animation-delay: 19s;
    }
    .animated-image:nth-child(21) { 
    --start-top: -20%;
    --start-left: 80%;
    animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
    animation-delay: 0s;
   }
   .animated-image:nth-child(22) { 
       --start-top: 0%;
       --start-left: 90%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 1s;
   }
   .animated-image:nth-child(23) { 
       --start-top: 10%;
       --start-left: 95%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 2s;
   }
   .animated-image:nth-child(24) { 
       --start-top: 20%;
       --start-left: 85%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 3s;
   }
   .animated-image:nth-child(25) { 
       --start-top: 30%;
       --start-left: 80%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 4s;
   }
   .animated-image:nth-child(26) { 
       --start-top: 40%;
       --start-left: 75%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 5s;
   }
   .animated-image:nth-child(27) { 
       --start-top: 50%;
       --start-left: 70%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 6s;
   }
   .animated-image:nth-child(28) { 
       --start-top: 60%;
       --start-left: 65%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 7s;
   }
   .animated-image:nth-child(29) { 
       --start-top: 70%;
       --start-left: 60%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 8s;
   }
   .animated-image:nth-child(30) { 
       --start-top: 80%;
       --start-left: 55%;
       animation: moveAndRotate 5s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 9s;
   }
   .animated-image:nth-child(31) { 
    --start-top: 90%;
    --start-left: 0%;
    animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
    animation-delay: 0s;
   }
   .animated-image:nth-child(32) { 
       --start-top: 85%;
       --start-left: 10%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 1s;
   }
   
   .animated-image:nth-child(33) { 
       --start-top: 80%;
       --start-left: 20%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 2s;
   }
   
   .animated-image:nth-child(34) { 
       --start-top: 75%;
       --start-left: 30%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 3s;
   }
   
   .animated-image:nth-child(35) { 
       --start-top: 70%;
       --start-left: 40%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 4s;
   }
   .animated-image:nth-child(36) { 
    --start-top: 80%;
    --start-left: 0%;
    animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
    animation-delay: 0s;
   }
   
   .animated-image:nth-child(37) { 
       --start-top: 75%;
       --start-left: 10%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 1s;
   }
   
   .animated-image:nth-child(38) { 
       --start-top: 70%;
       --start-left: 20%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 2s;
   }
   
   .animated-image:nth-child(39) { 
       --start-top: 65%;
       --start-left: 30%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 3s;
   }
   
   .animated-image:nth-child(40) { 
       --start-top: 60%;
       --start-left: 40%;
       animation: moveAndRotate 7s linear infinite, fadeIn 6s linear infinite;
       animation-delay: 4s;
   }
</style>   
<div class="row" style="width:60%; margin-left:20%; margin-right:20%; text-align:center;">
    <div class="col-sm-4"><a href="/admin/member">유저관리</a></div>
    <div class="col-sm-4"><a href="/admin/board">기사관리</a></div>
    <div class="col-sm-4"><a href="/admin/reply">댓글관리</a></div>
    <div style="margin-bottom:200px; padding-bottom:-50px;">
        <!-- 이미지 여러 개 생성 -->
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
        <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
       <img src="/resources/img/clover-empty-remove.png" class="animated-image" alt="animated image">
    </div>
</div>

<div style="height:200px"></div>
<%@ include file="./aFooter.jsp" %> 
