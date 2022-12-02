<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<head>
  <!-- Required meta tags-->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Colorlib Templates">
  <meta name="author" content="Colorlib">
  <meta name="keywords" content="Colorlib Templates">

  <!-- Title Page-->
  <title>Đăng kí</title>
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
  <link rel="stylesheet" type="text/css" href="../assets/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/daterangepicker.css">
  <link href="../assets/css/signup.css" rel="stylesheet" media="all">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="limiter">
  <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins" >
    <div class="wrapper wrapper--w680">
      <div class="card card-4">
        <div class="card-body">
          <h2 class="title">ĐĂNG KÍ</h2>
          <%String err = (String) request.getAttribute("err");%>
          <p class="label_err" style="color: red"><%= err != null?err:""%></p>
          <form method="post" action="Sign_Up">
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">TÊN TÀI KHOẢN</label>
                  <input class="input--style-4" type="text" name="userName" >
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">MẬT KHẨU</label>
                  <input class="input--style-4" type="password" name="password" >
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">HỌ VÀ TÊN</label>
                  <input class="input--style-4" type="text" name="fullname" >
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">Địa Chỉ</label>
                  <input class="input--style-4" type="text" name="address" >
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">NGÀY SINH</label>
                  <div class="input-group-icon">
                    <input class="input--style-4 js-datepicker" type="text" name="birthday" >
                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                  </div>
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">GIỚI TÍNH </label>
                  <div class="p-t-10">
                    <label class="radio-container m-r-45">NAM
                      <input type="radio" checked="checked" name="gender" value="0">
                      <span class="checkmark"></span>
                    </label>
                    <label class="radio-container">NỮ
                      <input type="radio" name="gender" value="1">
                      <span class="checkmark"></span>
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">Email</label>
                  <input class="input--style-4" type="email" name="email" >
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">SỐ ĐIỆN THOẠI</label>
                  <input class="input--style-4" type="text" name="phone" >
                </div>
              </div>
            </div>

            <div class="p-t-15">
              <button class="btn btn--radius-2 btn--blue" type="submit">ĐĂNG KÍ</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



<jsp:include page="footer.jsp"></jsp:include>

<!-- Jquery JS-->
<script src="../assets/js/jquery.min.js"></script>
<!-- Vendor JS-->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/slick.min.js"></script>
<script src="../assets/js/nouislider.min.js"></script>
<script src="../assets/js/jquery.zoom.min.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/moment.min.js"></script>
<script src="../assets/js/daterangepicker.js"></script>
<!-- Main JS-->
<script src="../assets/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->