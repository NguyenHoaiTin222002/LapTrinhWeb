<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sản Phẩm</title>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="../assets/css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="../assets/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="../assets/css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="../assets/css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="../assets/css/style.css"/>
    <link rel="stylesheet" href="../assets/css/basic.css">
    <link rel="stylesheet" href="../assets/css/product.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Danh Mục</h3>
                    <div class="checkbox-filter">

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-1">
                            <label for="category-1">
                                <span>	</span>
                                Giấy In - Photo

                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-2">
                            <label for="category-2">
                                <span></span>
                                Sổ - Tập

                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-3">
                            <label for="category-3">
                                <span></span>
                                Bút - Bút Màu

                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-4">
                            <label for="category-4">
                                <span></span>
                                Kéo - Dao


                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-5">
                            <label for="category-5">
                                <span></span>
                                Vật Dụng Văn Phòng

                            </label>
                        </div>


                    </div>
                </div>
                <!-- /aside Widget -->
                <div class="aside">
                    <button class="store-filter_btn btn">
                        Lọc Sản Phẩm
                    </button>
                </div>
                <!-- aside Widget -->

                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title"> Sắp xếp</h3>
                    <div class="store-sort">
                        <label>
                            Sắp xếp theo:
                            <select class="input-select input-sort ">
                                <option value="0">giá nhỏ đó lớn</option>
                                <option value="1">giá từ lớn đền nhỏ</option>
                                <option value="2">xếp từ A - Z</option>
                                <option value="3">cếp từ Z - A</option>
                            </select>
                        </label>


                    </div>

                </div>
                <div class="aside">
                    <button class="store-filter_btn btn">
                        Sắp Xếp Sản Phẩm
                    </button>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">

                    <h3 class="aside-title">Sản Phẩm</h3>
                    <div class="product-widget">
                        <div class="product-img">
                            <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn3.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-name"><a href="product.html">Giấy phân trang mũi tên 5 màu Pronoti
                            </a></h3>
                            <h4 class="product-price">180.000đ <del class="product-old-price">220.000đ</del></h4>
                        </div>
                    </div>
                    <!-- product widget -->
                    <div class="product-widget">
                        <div class="product-img">
                            <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao1.jpg" alt="">
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
                            <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao2.jpg" alt="">
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
                            <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn6.jpg" alt="">
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
                            <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn7.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-name"><a href="product.html">Giấy Note trình ký Sign here Pronoti
                            </a></h3>
                            <h4 class="product-price">280.000đ <del class="product-old-price">320.000đ</del></h4>
                        </div>
                    </div>
                    <!-- /product widget -->


                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">


                <!-- store products -->
                <div class="row">
                    <!-- product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn1.jpg" alt="">
                                <div class="product-label">
                                    <span class="new">NEW</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy A4 Double A 70 Gsm</a></h3>


                                <h4 class="product-price">100.000đ </h4>
                                <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                            </div>
                            <div class="add-to-cart">
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/But/But1.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/But/But3.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao1.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao6.jpg" alt="">
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
                        <!-- /product -->
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/But/But2.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">

                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao8.jpg" alt="">
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

                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao9.jpg" alt="">
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
                    </div>
                    <!-- /product -->
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/But/But7.jpg" alt="">
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
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn13.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">

                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/Tap/Tap12.jpg" alt="">
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

                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao14.jpg" alt="">
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
                        <!-- /product -->
                    </div>


                    <!-- /product -->
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/Tap/Tap6.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn12.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">

                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn5.jpg" alt="">
                                <div class="product-label">
                                    <span class="new">NEW</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Decal số thứ tự</a></h3>


                                <h4 class="product-price">120.000đ </h4>
                                <h4 class="product-sold">đã bán:189  <div class="product-old-remaining">còn lại:70 </div></h4>

                            </div>
                            <div class="add-to-cart">
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/GIayIn/GiayIn3.jpg" alt="">
                                <div class="product-label">
                                    <span class="new">NEW</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.html">Giấy phân trang mũi tên 5 màu Pronoti</a></h3>


                                <h4 class="product-price">90.000đ </h4>
                                <h4 class="product-sold">đã bán:18  <div class="product-old-remaining">còn lại:100 </div></h4>

                            </div>
                            <div class="add-to-cart">
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                        <!-- /product -->
                    </div>
                    <!-- /product -->
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao14.jpg" alt="">
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
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/KeoDao/KeoDao12.jpg" alt="">
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
                    </div>
                    <div class="col-md-3 col-xs-6">

                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/Tap/Tap13.jpg" alt="">
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

                    </div>
                    <div class="col-md-3 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="../main/webapp/assets/img/ImgProduct/Tap/Tap11.jpg" alt="">
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
                    </div>


                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">

                        <ul class="store-pagination">
                            <li class="active">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div>
                    <!-- /store bottom filter -->
                </div>
                <!-- /STORE -->
              </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
</div>
    <!-- /SECTION -->


<jsp:include page="footer.jsp"></jsp:include>



<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/slick.min.js"></script>
<script src="../assets/js/nouislider.min.js"></script>
<script src="../assets/js/jquery.zoom.min.js"></script>
 <script src="../assets/js/main.js"></script>
</body>
</html>