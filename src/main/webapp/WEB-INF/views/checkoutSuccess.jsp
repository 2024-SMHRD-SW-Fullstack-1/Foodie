<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Foodie</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/elegant-icons.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/nice-select.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/slicknav.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" type="text/css">
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul>
							<li><a href="#">주부 레시피</a></li>
							<li><a href="#">키즈 레시피</a></li>
							<li><a href="#">자취생 레시피</a></li>
							<li><a href="#">다이어트 레시피</a></li>
							<li><a href="#">캠핑 레시피</a></li>
							<li><a href="recipe">파티 레시피</a></li>
							<li><a href="#">야식 레시피</a></li>
							<li><a href="shopgrid">재료 사러가기</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<input type="text" placeholder="검색어를 입력하세요">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-comments"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>재료 추천받기</h5>
								<span>24시간 챗봇 상담</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주문/결제</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
                        <div class="section-title">
                        <h2>주문이 정상적으로 완료되었습니다!</h2>						
						</div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>${member.order_idx}</th>
                                </tr>
                            </thead>
							<tbody>
								<tr>
								<th>배송지정보</th>
								<td>${member.mem_addr}</td>
								</tr>
								<tr>
								<th>주문일시</th>
								<td>${member.ordered_at}</td>
								</tr>
								<tr>
								<th>결제금액</th>
								<td>${member.total_amount}원</td>
								</tr>
								
								
										<c:forEach items="${cartList}" var="list">
											<tr>
												<td class="shoping__cart__item"><img
													src="<c:url value='./resources/img${list.ingre_img }'/>"
													alt="${list.ingre_name}"
													style="max-width: 30%; height: auto;">
													<h5>${list.ingre_name}</h5></td>
												<td class="shoping__cart__quantity">
													<div class="quantity">
														<div class="pro-qty">
															<input type="text" value="${list.ingre_cnt}" name="cntValue">
														</div><br>
														<input type="hidden" value="${list.basket_idx}" name="idxValue">
													</div>
												</td>
												<td class="shoping__cart__total">${list.ingre_price*list.ingre_cnt}원</td>
												<!-- 해당항목삭제 -->
												<td class="shoping__cart__item__close"><a
													href="delete.do/${list.ingre_idx}/${list.mem_id}"><span
														class="icon_close"></span></a></td>
											</tr>
										</c:forEach>
										<!-- 반복문 끝 -->							
							</tbody>
						</table>
                    </div>
                </div>
            </div>
						<div class="col-lg-12">
						<span style="display: block; text-align: center;">
						<a href="mypage" class="primary-btn">주문내역확인하기</a>
						</span>
						</div>
            
            <c:choose>
            	<c:when test="${empty member}"></c:when>
            	<c:otherwise>
            		<div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:continueShopping()" class="primary-btn cart-btn">쇼핑 계속하기</a>
                      	<a href="javascript:updateCart()" class="primary-btn cart-btn cart-btn-right">장바구니 수정</a>
                    </div>
                </div>
                <div class="col-lg-6"></div>
               
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>총 결제금액</h5>
                        <ul>
                            <c:choose>
                            	<c:when test="${sum>=50000}">
                            		<li>상품금액 <span>${sum}원</span></li>
                            		<li>배송비 <span>무료배송</span></li>
                            		<li>결제예정금액 <span>${sum}원</span></li>
                            	</c:when>
                            	<c:when test="${sum<50000}">
                            		<li>상품금액 <span>${sum}원</span></li>
                            		<li>배송비 <span>3000원</span></li>
                            		<li>결제예정금액 <span>${sum+3000}원</span></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li>상품금액 <span>0원</span></li>
                            		<li>배송비 <span>0원</span></li>
                            		<li>결제예정금액 <span>0원</span></li>
                            	</c:otherwise>                           	
                            </c:choose>
                        </ul>
                        <a href="checkout" class="primary-btn">구매하기</a>
                    </div>
                </div>
            </div>
            	</c:otherwise>
            </c:choose>
            
        </div>
    </section>
    <!-- Shoping Cart Section End -->


	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
	
</body>
</html>