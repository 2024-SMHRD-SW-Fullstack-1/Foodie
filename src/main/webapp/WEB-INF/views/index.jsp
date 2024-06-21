<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Foodie</title>

    <!-- Google Font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="/"><img src="resources/img/banner/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
               <!-- 찜 -->
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <!-- 장바구니 -->
                <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <!-- 장바구니 총 금액 -->
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__contact">
            <ul>
               <!-- 이메일 -->
                <li><i class="fa fa-envelope"></i> hello@smhrd.com</li>
                <li>하루 안에 도착하는 푸디 배송 ~ 🚚🚚</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@ include file="./header.jsp"%>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                        
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">주부 레시피</a></li>
                            <li><a href="#">키즈 레시피</a></li>
                            <li><a href="#">자취생 레시피</a></li>
                            <li><a href="#">다이어트 레시피</a></li>
                            <li><a href="#">캠핑 레시피</a></li>
                            <li><a href="#">파티 레시피</a></li>
                            <li><a href="recipe">야식 레시피</a></li>
                            <li><a href="shopgrid">재료 사러가기</a></li>
                        </ul>
                    </div>
                </div>
               <!-- Header Section Begin -->
    <%@ include file="./search.jsp"%>
    <!-- Header Section End -->
                    <div class="hero__item set-bg" data-setbg="resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>쉽고 빠르게 따라 할 수있는!</span>
                            <h2>새내기 요리사 <br />파티 레시피</h2>
                            <p></p>
                            <a href="#" class="primary-btn">파티 레시피 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
<section class="categories">
        <div class="container">
            <div class="section-title">
                <h2>인기 레시피👍</h2>
            </div>
            <div class="featured__controls">
                <ul>
                    <li>푸디에서 많은 분들이 찾아본 인기 레시피를 소개합니다.</li>
                </ul>
            </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <c:forEach var="recipe" items="${popularList}">
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="<c:url value='resources/img${recipe.recipe_title_img}'/>">
                                
                            </div>
                            <h5><a href="#">${recipe.recipe_name}</a></h5>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <section class="categories">
        <div class="container">
            <div class="section-title">
                <h2>추천 레시피💕</h2>
            </div>
            <div class="featured__controls">
                <ul>
                    <li>푸디가 제안하는 레시피로 최고의 요리를 만들어보세요.</li>
                </ul>
            </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <c:forEach var="recipe" items="${recommendedList}">
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="<c:url value= 'resources/img${recipe.recipe_title_img}'/>">
                      
                            </div>
                             <h5><a href="#">${recipe.recipe_name}</a></h5>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
   <!-- Blog Section Begin -->
<section class="from-blog spad">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="section-title from-blog__title">
               <h2>✨new 레시피✨</h2>
            </div>
         </div>
      </div>
      <div class="row">
         <!-- JSTL을 사용하여 newList를 동적으로 렌더링합니다. -->
         <c:forEach var="recipe" items="${newList}">
            <div class="col-lg-4 col-md-4 col-sm-6">
               <div class="blog__item">
                  <div class="blog__item__pic">
                     <!-- 이미지 URL을 동적으로 설정 -->
                     <img src="<c:url value='/resources/img/${recipe.recipe_title_img}' />" alt="">
                  </div>
                  <div class="blog__item__text">
                    <ul>
                        <!-- 날짜를 동적으로 설정 -->
                        <li><i class="fa fa-calendar-o"></i></li>
                     </ul>
                     <h5>
                        <!-- 레시피 이름을 동적으로 설정 -->
                        <a href="#">${recipe.recipe_name}</a>
                     </h5>
                     <p>${recipe.recipe_content} </p>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>
</section>
<!-- Blog Section End -->



    <!-- Footer Section Begin -->
   <%@ include file="./footer.jsp"%>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script>
        function openChatbot() {
            window.open("/personalrecipe/chatbot", "PersonalTalk", "width=400,height=600");
        }
        </script>
   
</body>
</html>