<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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
  <link rel="stylesheet" type="text/css" href="./assets/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/daterangepicker.css">
  <link href="./assets/css/signup.css" rel="stylesheet" media="all">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%Integer gender = (Integer) request.getAttribute("gender"); %>
<%String userName = (String) request.getAttribute("userName");%>
<%String password = (String)request.getAttribute("password");%>
<%String email = (String)request.getAttribute("email");%>
<%String fullname = (String)request.getAttribute("fullname");%>
<%String address  = (String)request.getAttribute("address");%>
<%String phone = (String)request.getAttribute("phone");%>
<% String birthday = (String)request.getAttribute("birthday");%>

<%Map<String,String> err = null;%>
<% Boolean isErr = (Boolean) request.getAttribute("isErr");%>
 <% if(isErr!=null&&isErr==true)
 { %>
    <% err = (Map<String, String>) request.getAttribute("err"); %>
 <%}%>
<div class="limiter">
  <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins" >
    <div class="wrapper wrapper--w680">
      <div class="card card-4">
        <div class="card-body">
          <h2 class="title">ĐĂNG KÍ</h2>


          <form method="post" action="Sign_Up">
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">TÊN TÀI KHOẢN</label> <label style="color: red">*</label>
                  <input class="input--style-4" type="text"  value="<%=userName!=null?userName:""%>" name="userName" placeholder="Nhập tên tài khoản" >
                  <p class="label_err" style="color: red"><%= err != null &&err.containsKey("userName") ?err.get("userName"):""%></p>
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">MẬT KHẨU</label><label style="color: red">*</label>
                  <input class="input--style-4" type="password" value="<%=password!=null?password:""%>" name="password" placeholder="Nhập mật khẩu">
                  <p class="label_err" style="color: red"><%= err != null&&err.containsKey("password") ?err.get("password"):""%></p>
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">HỌ VÀ TÊN</label><label style="color: red">*</label>
                  <input class="input--style-4" type="text" value="<%=fullname!=null?fullname:""%>" name="fullname" placeholder="Nhập đầy đủ tên và Họ" >
                  <p class="label_err" style="color: red"><%= err != null &&err.containsKey("fullName") ?err.get("fullName"):""%></p>
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">Địa Chỉ</label><label style="color: red">*</label>
                  <input class="input--style-4" type="text" value="<%=address!=null?address:""%>" name="address" placeholder="Nhập địa chỉ của bạn" >
                  <p class="label_err" style="color: red"><%= err != null&&err.containsKey("address") ?err.get("address"):""%></p>
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">NGÀY SINH</label><label style="color: red">*</label>

                  <input class="input--style-4 " value="<%=birthday!=null?birthday:""%>" type="date" name="birthday" placeholder="Nhập Ngày Sinh" >


                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">GIỚI TÍNH </label>
                  <div class="p-t-10">
                    <label class="radio-container m-r-45">NAM
                      <input type="radio" checked="<%=gender!=null&&gender==0?"checked":""%>" name="gender" value="0">
                      <span class="checkmark"></span>
                    </label>
                    <label class="radio-container">NỮ
                      <input type="radio"checked="<%=gender!=null&&gender==1?"checked":""%>" name="gender" value="1">
                      <span class="checkmark"></span>
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="row row-space">
              <div class="col-2">
                <div class="input-group">
                  <label class="la">Email</label><label style="color: red">*</label>
                  <input class="input--style-4" type="email" name="email" value="<%=email!=null?email:""%>" placeholder="Nhập email vd: Nam@gmail.com" >
                  <p class="label_err" style="color: red"><%= err != null&&err.containsKey("email") ?err.get("email"):""%></p>
                </div>
              </div>
              <div class="col-2">
                <div class="input-group">
                  <label class="la">SỐ ĐIỆN THOẠI</label><label style="color: red">*</label>
                  <input class="input--style-4" type="text"  value="<%=phone!=null?phone:""%>"name="phone"placeholder="Nhập số điên vd: 0714734661"  >
                  <p class="label_err" style="color: red"><%= err != null&&err.containsKey("phone") ?err.get("phone"):""%></p>
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
<script src="./assets/js/jquery.min.js"></script>
<!-- Vendor JS-->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
<script src="./assets/js/main.js"></script>
<script src="./assets/js/moment.min.js"></script>
<script src="./assets/js/daterangepicker.js"></script>
<!-- Main JS-->
<script src="./assets/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->