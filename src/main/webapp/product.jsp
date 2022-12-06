<%@ page import="vn.edu.hcmuaf.fit.model.Img" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ImgService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="./assets/css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="./assets/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="./assets/css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="./assets/css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="./assets/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="./assets/css/style.css"/>
    <link rel="stylesheet" href="./assets/css/basic.css">
    <link rel="stylesheet" href="./assets/css/product.css">
    <link rel="stylesheet" href="./assets/css/ProductDetails.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<% List<Img> listImg = (List<Img>) request.getAttribute("listImg"); %>
<% Product product = (Product) request.getAttribute("product"); %>
<% request.getSession().setAttribute("idInfoProduct",product.getIdProduct()); %>

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">

                    <%
                        for (Img item: listImg
                        ) { %>
                    <div class="product-preview">
                        <img src="<%= item.getImgLink()%>" alt="">
                    </div>
                    <% }%>



                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <%
                        for (Img item: listImg
                        ) { %>
                    <div class="product-preview">
                        <img src="<%= item.getImgLink()%>" alt="">
                    </div>
                    <% }%>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">

                <div class="product-details">

                    <h2 class="product-name"><%= product.getNameProduct()%> </h2>
                    <div>
                        <div class="product-sale <%= product.getSale() == 0 ? "displayNone":""%>">
                            Sale: <%= product.getSale()%>%
                        </div>
                        <a class="review-link" href="#">đã bán: <%= product.getAmountSoldProduct()%> | còn lại: <%= product.getAmountProduct()%></a>
                    </div>
                    <div>
                        <h3 class="product-price"><%= Math.floor(product.getPrice() - product.getPrice()*0.01*product.getSale()) %>đ
                            <del class="product-old-price <%=product.getSale() == 0 ? "displayNone":""%>  "><%= product.getPrice() %> đ</del></h3>

                    </div>
                    <p class="product-details-description"><%= product.getDiscription() %></p>



                    <div class="add-to-cart">
                        <div class="qty-label">
                            Số lượng
                            <div class="input-number">
                                <input type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>

                    </div>
                    <ul class="product-links">
                        <li>Nhà sản xuất:</li>
                        <li><%= product.getProducer() %></li>

                    </ul>
                    <ul class="product-btns">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm Giỏ Hàng</button>
                        <button class="add-to-card-btn"><i class="fa fa-credit-card"></i> Mua Ngay</button>
                    </ul>





                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Mô Tả</a></li>

                        <li><a data-toggle="tab" href="#tab2">Đánh Giá</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="product-details-description">Nhà Sản Xuất:<%= product.getProducer()%></p>
                                    <p class="product-details-description"><%= product.getDiscription()%></p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->

                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>4.5</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">3</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">2</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Nam An</h5>
                                                    <p class="date">12/1/2002, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Sản Phẩm rất tốt và chất lượng</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Mạnh Hùng</h5>
                                                    <p class="date">12/12/2001, 7:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Sản phẩm rất tốt hàng, vận chuyện hàng có tâm</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">John Hùng</h5>
                                                    <p class="date">27/12/2018, 18:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Sản phẩm giống trong hình, đẹp và sạch</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <form class="review-form">

                                            <textarea class="input" placeholder="Nêu Đánh giá"></textarea>
                                            <div class="input-rating">
                                                <span>Đánh giá </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                </div>
                                            </div>
                                            <button class="primary-btn">Gởi tinh</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Sản Phẩm Liên Quan</h3>
                </div>
            </div>

            <!-- product -->
            <div class="col-md-12 ">
                <div class="products-slick" data-nav="#slick-nav-2">
                    <% List<Product> products = ProductService.getAllProduct();
                        for (Product item: products
                        ) { %>
                    <!-- product -->
                    <div class="product">
                        <div class="product-img">
                            <img src="<%=item.getImg()%>" alt="">
                            <div class="product-label">
                                <span class="sale <%=item.getSale() == 0 ? "displayNone":""%>">-<%= item.getSale() %>%</span>
                                <span class="new <%=item.getNewProduct() != 1 ? "displayNone":""%>">NEW</span>
                            </div>
                        </div>
                        <div class="product-body">
                            <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%></a></h3>
                            <h4 class="product-price"><%= Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale()) %>đ
                                <del class="product-old-price <%=item.getSale() == 0 ? "displayNone":""%> "><%= item.getPrice() %> đ</del></h4>
                            <h4 class="product-sold">đã bán: <%= item.getAmountProduct()%> <div class="product-old-remaining">còn lại:<%= item.getAmountSoldProduct()%> </div></h4>

                        </div>
                        <div class="add-to-cart">
                            <a href="/ServletInsetCart?idProductCart=<%=item.getIdProduct()%>"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button></a>
                        </div>
                    </div>
                    <!-- /product -->
                    <%}%>


                </div>
                <div id="slick-nav-2" class="products-slick-nav"></div>
            </div>
            <!-- /product -->



        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->





<jsp:include page="footer.jsp"></jsp:include>



<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>