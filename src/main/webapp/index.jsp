<%--<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>--%>
<%@ page import="java.util.List" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>--%>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.uilt.Fomat" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.model.User" %>--%>
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
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
<%--   <% request.getSession().removeAttribute("idInfoProduct");%>--%>
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="./assets/img/QuangCao1.jpg" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ Sựu Tập<br> Giấy In</h3>
                        <a href="#" class="cta-btn">Xem Ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="./assets/img/QuangCao2.jpg" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ Sựu Tập<br>Sổ - Tập</h3>
                        <a href="#" class="cta-btn">Xem Ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="./assets/img/QuangCao3.jpg" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ Sựu Tập<br> Bút - Bút Màu</h3>
                        <a href="#" class="cta-btn">Xem Ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Sản Phẩm Mới </h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">Giấy In - Photo</a></li>
                            <li><a data-toggle="tab" href="#tab2">Sổ - Tập</a></li>
                            <li><a data-toggle="tab" href="#tab3">Bút - Bút Màu</a></li>
                            <li><a data-toggle="tab" href="#tab4">Kéo - Dao</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <% List<Product> products = ProductService.getAllProductByIdCategory(10,1,"new");
                                    for (Product item: products
                                         ) { %>
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="<%=item.getImg()%>" alt="">
                                        <div class="product-label">
                                            <span class="sale <%=item.getSale() > 0 ?""  :"displayNone"%>">-<%= item.getSale() %>%</span>
                                            <span class="new <%=item.getNewProduct() != 1 ? "displayNone":""%>">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%></a></h3>
                                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                                        <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%>
                                            <del class="product-old-price <%=item.getSale() > 0 ? "":"displayNone"%> "><%=Fomat.fomatCurrency(item.getPrice())%> </del></h4>
                                        <h4 class="product-sold">đã bán: <%= item.getAmountProduct()%> <div class="product-old-remaining">còn lại:<%= item.getAmountSoldProduct()%> </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                         <a href="/InsetCart?idProductCart=<%=item.getIdProduct()%>"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button></a>
                                    </div>
                                </div>
                                <!-- /product -->
                                    <%}%>
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <div id="tab2" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap1.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Vĩnh Tiến </a></h3>


                                        <h4 class="product-price">15.000đ </h4>
                                        <h4 class="product-sold">đã bán:1800  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap2.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang dày 100gsm</a></h3>


                                        <h4 class="product-price">20.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap3.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập giáo án 200 trang - A4</a></h3>


                                        <h4 class="product-price">30.000đ </h4>
                                        <h4 class="product-sold">đã bán:1200  <div class="product-old-remaining">còn lại:200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap4.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Hiệp Phong - 100gsm</a></h3>


                                        <h4 class="product-price">25.000đ </h4>
                                        <h4 class="product-sold">đã bán:100  <div class="product-old-remaining">còn lại:700 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap5.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang 4 ô ly</a></h3>


                                        <h4 class="product-price">10.000đ </h4>
                                        <h4 class="product-sold">đã bán:1800  <div class="product-old-remaining">còn lại:200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap6.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập vẽ mỹ thuật A3 - 120gsm (20 tờ)</a></h3>


                                        <h4 class="product-price">215.000đ </h4>
                                        <h4 class="product-sold">đã bán:1800  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap7.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Hồng Hà (5 ô ly) - 0427</a></h3>


                                        <h4 class="product-price">25.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->


                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <div id="tab3" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-3">
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But1.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Ruột bút bi Heri - Ruột bút dùng cho bút có</a></h3>


                                        <h4 class="product-price">225.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But2.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút bi bấm Uni Jetstream Sport</a></h3>


                                        <h4 class="product-price">125.000đ </h4>
                                        <h4 class="product-sold">đã bán:100  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But3.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút Sáp Dầu Hình Cậu Heo Cho Bé Tô Trành</a></h3>


                                        <h4 class="product-price">225.000đ </h4>
                                        <h4 class="product-sold">đã bán:020  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But4.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút sơn TOYO</a></h3>


                                        <h4 class="product-price">25.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But5.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút bi Aihao 555</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But6.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút nước Aihao Đỏ</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But7.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút Gel Mini đỏ</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:500  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-3" class="products-slick-nav"></div>
                        </div>

                        <div id="tab4" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-4">
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao1.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Lưỡi dao rọc giấy nhỏ 30 độ Deli - 2015</a></h3>


                                        <h4 class="product-price">50.000đ </h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao2.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-5%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Kéo Thiên Long SC019 - 16cm</a></h3>


                                        <h4 class="product-price">30.000đ<del class="product-old-price">25.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao3.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Cắt băng keo No. 2002 - vòng lớn</a></h3>


                                        <h4 class="product-price"> 90.000đ </h4>
                                        <h4 class="product-sold">đã bán:180  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao4.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Băng keo dạ quang 2cm - 10m</a></h3>


                                        <h4 class="product-price">120.000đ </h4>
                                        <h4 class="product-sold">đã bán:184  <div class="product-old-remaining">còn lại:10 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao5.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Băng keo chống thấm siêu dính loại 10cm dài</a></h3>


                                        <h4 class="product-price">150.000đ </h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao6.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Cắt keo Cầm Tay 5F Deli - 823</a></h3>


                                        <h4 class="product-price">70.000đ </h4>
                                        <h4 class="product-sold">đã bán:138  <div class="product-old-remaining">còn lại:10 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao7.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Thước Dẻo Hình Deli 38015 - Xanh</a></h3>


                                        <h4 class="product-price">40.000đ </h4>
                                        <h4 class="product-sold">đã bán:118  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                            </div>
                            <div id="slick-nav-4" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">

                    <h2 class="text-uppercase">Tin Hot Trong Tuần</h2>
                    <p>Giảm Giá Sản Phẩm Từ 10% - 20%</p>

                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Sản Phẩm Giảm Giá</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab5">Giấy In - Photo</a></li>
                            <li><a data-toggle="tab" href="#tab6">Sổ - Tập</a></li>
                            <li><a data-toggle="tab" href="#tab7">Bút - Bút Màu</a></li>
                            <li><a data-toggle="tab" href="#tab8">Kéo - Dao</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab5" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-5">

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn8.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-5%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy A4 Double A 80 Gsm</a></h3>


                                        <h4 class="product-price">93.000đ <del class="product-old-price">120.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn9.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-10%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy in BILL tính tiền 5F - K57x38 (1 cuộn)</a></h3>


                                        <h4 class="product-price">123.000đ <del class="product-old-price">150.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:2114  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn10.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy Note Deli 3x3 A023 - Neon Vàng</a></h3>


                                        <h4 class="product-price">45.000đ <del class="product-old-price">60.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn11.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy Note Deli 3x3 A023 - Neon Cam</a></h3>


                                        <h4 class="product-price">45.000đ <del class="product-old-price">60.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn12.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy Note Deli 3x3 A023 - Neon Hồng</a></h3>


                                        <h4 class="product-price">45.000đ <del class="product-old-price">60.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:1214  <div class="product-old-remaining">còn lại:200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/GIayIn/GiayIn13.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-20%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Giấy Fort màu 80 A3 Gsm</a></h3>


                                        <h4 class="product-price">245.000đ <del class="product-old-price">310.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                            </div>
                            <div id="slick-nav-5" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab6" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-6">

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap8.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-5%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập tô màu</a></h3>


                                        <h4 class="product-price">93.000đ <del class="product-old-price">120.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:294  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap9.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-10%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Hồng Hà 0430</a></h3>


                                        <h4 class="product-price">23.000đ <del class="product-old-price">29.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:2114  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap10.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>

                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập tô màu colokit disney mickey</a></h3>


                                        <h4 class="product-price">145.000đ <del class="product-old-price">160.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap11.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập tô màu colokit disney cars</a></h3>


                                        <h4 class="product-price">145.000đ <del class="product-old-price">160.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:290  <div class="product-old-remaining">còn lại:800 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap12.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-15%</span>

                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Hồng Hà 0393</a></h3>


                                        <h4 class="product-price">145.000đ <del class="product-old-price">160.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:1214  <div class="product-old-remaining">còn lại:200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap13.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-5%</span>

                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập 96 trang Hồng Hà 0413 (4 ô ly) - 120gsm</a></h3>


                                        <h4 class="product-price">35.000đ <del class="product-old-price">20.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/Tap/Tap14.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-10%</span>

                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Tập Hồng Hà kẻ ngang 4552 - 420 trang</a></h3>


                                        <h4 class="product-price">235.000đ <del class="product-old-price">320.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:214  <div class="product-old-remaining">còn lại:1200 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                            </div>
                            <div id="slick-nav-6" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab7" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-7">

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But1.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Ruột bút bi Heri - Ruột bút dùng cho bút có</a></h3>


                                        <h4 class="product-price">225.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But2.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút bi bấm Uni Jetstream Sport</a></h3>


                                        <h4 class="product-price">125.000đ </h4>
                                        <h4 class="product-sold">đã bán:100  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But3.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút Sáp Dầu Hình Cậu Heo Cho Bé Tô Trành</a></h3>


                                        <h4 class="product-price">225.000đ </h4>
                                        <h4 class="product-sold">đã bán:020  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But4.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút sơn TOYO</a></h3>


                                        <h4 class="product-price">25.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But5.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút bi Aihao 555</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But6.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút nước Aihao Đỏ</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:800  <div class="product-old-remaining">còn lại:2300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/But/But7.jpg" alt="">
                                        <div class="product-label">

                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Bút Gel Mini đỏ</a></h3>


                                        <h4 class="product-price">5.000đ </h4>
                                        <h4 class="product-sold">đã bán:500  <div class="product-old-remaining">còn lại:300 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                            </div>
                            <div id="slick-nav-7" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab8" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-8">

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao8.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Lưỡi dao rọc giấy nhỏ 30 độ Deli - 2015</a></h3>


                                        <h4 class="product-price">50.000đ </h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao9.jpg" alt="">
                                        <div class="product-label">
                                            <span class="sale">-5%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Kéo Thiên Long SC019 - 16cm</a></h3>


                                        <h4 class="product-price">30.000đ<del class="product-old-price">25.000đ</del></h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao10.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Cắt băng keo No. 2002 - vòng lớn</a></h3>


                                        <h4 class="product-price"> 90.000đ </h4>
                                        <h4 class="product-sold">đã bán:180  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao11.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Băng keo dạ quang 2cm - 10m</a></h3>


                                        <h4 class="product-price">120.000đ </h4>
                                        <h4 class="product-sold">đã bán:184  <div class="product-old-remaining">còn lại:10 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao12.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Băng keo chống thấm siêu dính loại 10cm dài</a></h3>


                                        <h4 class="product-price">150.000đ </h4>
                                        <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao13.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Cắt keo Cầm Tay 5F Deli - 823</a></h3>


                                        <h4 class="product-price">70.000đ </h4>
                                        <h4 class="product-sold">đã bán:138  <div class="product-old-remaining">còn lại:10 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./assets/img/ImgProduct/KeoDao/KeoDao14.jpg" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.html">Thước Dẻo Hình Deli 38015 - Xanh</a></h3>


                                        <h4 class="product-price">40.000đ </h4>
                                        <h4 class="product-sold">đã bán:118  <div class="product-old-remaining">còn lại:100 </div></h4>

                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>

                            </div>
                            <div id="slick-nav-8" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Giấy In</h4>
                    <div class="section-nav">
                        <div id="slick-nav-9" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-9">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn1.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy A4 Double A 70 Gsm
                                </a></h3>
                                <h4 class="product-price">280.000đ <del class="product-old-price">390.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn2.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Decal A4 đế vàng giấy láng (xấp 100 tờ)
                                </a></h3>
                                <h4 class="product-price">80.000đ <del class="product-old-price">90.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn3.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy phân trang mũi tên 5 màu Pronoti
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn6.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Decal số thứ tự
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn7.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy Note trình ký Sign here Pronoti
                                </a></h3>
                                <h4 class="product-price">280.000đ <del class="product-old-price">320.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/GIayIn/GiayIn8.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy A4 Double A 80 Gsm
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Kéo Dao</h4>
                    <div class="section-nav">
                        <div id="slick-nav-10" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-10">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao1.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Lưỡi dao rọc giấy nhỏ 30 độ Deli - 2015
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">390.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao2.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Kéo Thiên Long SC019 - 16cm
                                </a></h3>
                                <h4 class="product-price">280.000đ <del class="product-old-price">390.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao3.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Cắt băng keo No. 2002 - vòng lớn
                                </a></h3>
                                <h4 class="product-price">120.000đ <del class="product-old-price">290.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao4.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Băng keo dạ quang 2cm - 10m
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">390.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao5.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Băng keo chống thấm siêu dính loại 10cm dài
                                </a></h3>
                                <h4 class="product-price">280.000đ <del class="product-old-price">390.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/KeoDao/KeoDao6.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Cắt keo Cầm Tay 5F Deli - 823
                                </a></h3>
                                <h4 class="product-price">120.000đ <del class="product-old-price">290.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Bút - Bút Màu</h4>
                    <div class="section-nav">
                        <div id="slick-nav-11" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-11">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But1.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Ruột bút bi Heri - Ruột bút dùng cho bút có
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But2.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Bút bi bấm Uni Jetstream Sport
                                </a></h3>
                                <h4 class="product-price">280.000đ <del class="product-old-price">320.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But3.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Bút Sáp Dầu Hình Cậu Heo Cho Bé Tô Trành
                                </a></h3>
                                <h4 class="product-price">120.000đ <del class="product-old-price">170.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But4.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Bút sơn TOYO
                                </a></h3>
                                <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But5.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Bút bi Aihao 555
                                </a></h3>
                                <h4 class="product-price">10.000đ <del class="product-old-price">5.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./assets/img/ImgProduct/But/But6.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Bút bi Aihao 555h đỏ
                                </a></h3>
                                <h4 class="product-price">12.000đ <del class="product-old-price">17.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<jsp:include page="footer.jsp"></jsp:include>





<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>