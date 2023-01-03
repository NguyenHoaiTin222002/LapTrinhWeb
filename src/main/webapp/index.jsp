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
                                <% List<Product> productsNewBook = ProductService.getAllProductByIdCategory(10,2,"new");
                                    for (Product item: productsNewBook
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
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <div id="tab3" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-3">
                                <% List<Product> productsNewPen = ProductService.getAllProductByIdCategory(10,3,"new");
                                    for (Product item: productsNewPen
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
                            <div id="slick-nav-3" class="products-slick-nav"></div>
                        </div>

                        <div id="tab4" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-4">
                                <% List<Product> productsNewDao = ProductService.getAllProductByIdCategory(10,4,"new");
                                    for (Product item: productsNewDao
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

                                <% List<Product> productsSalePage = ProductService.getAllProductByIdCategory(10,1,"sale");
                                    for (Product item: productsSalePage
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
                            <div id="slick-nav-5" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab6" class="tab-pane ">
                            <div class="products-slick" data-nav="#slick-nav-6">
                                <% List<Product> productsSaleBook = ProductService.getAllProductByIdCategory(8,2,"sale");
                                    for (Product item: productsSaleBook
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
                            <div id="slick-nav-6" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab7" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-7">
                                <% List<Product> productsSalePen = ProductService.getAllProductByIdCategory(8,3,"sale");
                                    for (Product item: productsSalePen
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
                            <div id="slick-nav-7" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab8" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-8">
                                <% List<Product> productsSaleKeo = ProductService.getAllProductByIdCategory(8,4,"sale");
                                    for (Product item: productsSaleKeo
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
                        <% List<Product> GIayIn1 = ProductService.getAllProductByIdCategory(3,1,"new");
                            for (Product item: GIayIn1
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price  <%=item.getSale() > 0 ? "":"displayNone"%>"><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
                    </div>

                    <div>
                        <% List<Product> GIayIn2 = ProductService.getAllProductByIdCategory(3,1,"sale");
                            for (Product item: GIayIn2
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price  <%=item.getSale() > 0 ? "":"displayNone"%>" ><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
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
                        <% List<Product> Keo1 = ProductService.getAllProductByIdCategory(3,4,"new");
                            for (Product item: Keo1
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price  <%=item.getSale() > 0 ? "":"displayNone"%>"><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
                    </div>

                    <div>
                        <% List<Product> Keo2 = ProductService.getAllProductByIdCategory(3,4,"sale");
                            for (Product item: Keo2
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price  <%=item.getSale() > 0 ? "":"displayNone"%>"><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
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
                        <% List<Product> but1 = ProductService.getAllProductByIdCategory(3,3,"new");
                            for (Product item: but1
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price<%=item.getSale() > 0 ? "":"displayNone"%>"><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
                    </div>

                    <div>
                        <% List<Product> but2 = ProductService.getAllProductByIdCategory(3,3,"sale");
                            for (Product item: but2
                            ) { %>
                        <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=item.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%>
                                </a></h3>
                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%> <del class="product-old-price  <%=item.getSale() > 0 ? "":"displayNone"%>"><%=Fomat.fomatCurrency(item.getPrice())%></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <%}%>
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