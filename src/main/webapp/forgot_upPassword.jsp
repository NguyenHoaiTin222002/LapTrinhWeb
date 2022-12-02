<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 21/11/2022
  Time: 9:57 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đổi Mật Khẩu</title>

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


    <link rel="stylesheet" type="text/css" href="../assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fgpw.css">
    <link type="text/css" rel="stylesheet" href="../assets/css/style.css"/>
    <link rel="stylesheet" href="../assets/css/basic.css">
    <link rel="stylesheet" href="../assets/css/product.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100" >
        <div class="wrap-login100 wrap-login200 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" action="UpPassword" method="post">
					<span class="login100-form-title p-b-49">
					     Đặt Lại Mặt Khẩu
					</span>
                <%String err = (String) request.getAttribute("err");%>
                <p style="color: red"><%= err != null?err:""%></p>
                <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                    <input class="input100 input200" type="text" name="passOld" placeholder="Mật  khẩu  cũ" autocomplete="off" >
                </div>
                <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">

                    <input class="input100 input200" type="password" name="passNew" placeholder="Mật khẩu mới" autocomplete="off" >
                </div>
                <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                    <input class="input100 input200 " type="text" name="passNewReset" placeholder="Nhập lại mật khẩu" autocomplete="off" >
                </div>


                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button type="submit" class="login100-form-btn">
                            Cập Nhật
                        </button>
                    </div>
                </div>




            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>





<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/slick.min.js"></script>
<script src="../assets/js/nouislider.min.js"></script>
<script src="../assets/js/jquery.zoom.min.js"></script>
<script src="../assets/js/main.js"></script>
</body>
</html>
