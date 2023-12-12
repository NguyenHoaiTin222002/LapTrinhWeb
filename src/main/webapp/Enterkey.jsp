<%@ page import="java.util.Map" %><%--
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
    <title>Thêm khóa</title>

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


    <link rel="stylesheet" type="text/css" href="./assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/fgpw.css">
    <link type="text/css" rel="stylesheet" href="./assets/css/style.css"/>
    <link rel="stylesheet" href="./assets/css/basic.css">
    <link rel="stylesheet" href="./assets/css/product.css">
</head>
<body style="font-family: Tahoma, 'Calibri Light'">
<jsp:include page="header.jsp"></jsp:include>

<div class="limiter">
    <div class="container-login100" >
        <div style="height: 550px !important;" class="wrap-login100  p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" action="Enterkey" method="post">
					<span class="login100-form-title p-b-49">
					     NHẬP KEY
					</span>
                <%String err = (String) request.getAttribute("err");%>
                <p style="color: red"><%= err != null?err:""%></p>
                <div class="wrap-input100 m-b-23">
                    <label class="la">Nhập private key</label> <label style="color: red">*</label>
                    <textarea rows="3" style="height: 100px" class="input100 input200"   type="text" name="ipprKey" placeholder="Nhập Private Key" autocomplete="off" ></textarea>
                    <p class="label_err" style="color: red"></p>
                </div>
                <div class="iwrap-input100  m-b-23">
                    <label class="la">Nhập public key</label> <label style="color: red">*</label>
                    <textarea rows="3" style="height: 100px" class="input100 input200 "  type="text" name="ipplKey" placeholder="Nhập Public Key" autocomplete="off" ></textarea>
                    <p class="label_err" style="color: red"></p>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button type="submit" class="login100-form-btn" style="font-family: Tahoma">
                            Cập Nhật Key
                        </button>
                    </div>
                </div>
                <div class="ha" style="text-align: center">
                <a href="/user.jsp">Bạn chưa có khóa? Tạo khóa ngay!</a>
                </div>




            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>





<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>
