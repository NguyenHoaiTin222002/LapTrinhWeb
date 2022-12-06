<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>

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

  <!-- Font Awesome Icon -->


  <link rel="stylesheet" type="text/css" href="./assets/css/material-design-iconic-font.min.css">

  <!-- Custom stlylesheet -->


  <link rel="stylesheet" type="text/css" href="./assets/css/signin.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
  <div class="limiter">
    <div class="container-login100" >
      <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
        <form class="login100-form validate-form" action="Login" method="post">
					<span class="login100-form-title p-b-49">
						ĐĂNG NHẬP
					</span>
           <%String err = (String) request.getAttribute("err");%>
            <p style="color: red"><%= err != null?err:""%></p>
          <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
            <span class="label-input100">HỌ VÀ TÊN</span>
            <input class="input100" type="text" name="username" placeholder="Nhập tên người dùng">
            <span class="focus-input100" data-symbol="&#xf206;"></span>
          </div>

          <div class="wrap-input100 validate-input" data-validate="Password is required">
            <span class="label-input100">MẬT KHẨU</span>
            <input class="input100" type="password" name="pass" placeholder="Nhập mật khẩu người dùng">

            <span class="focus-input100" data-symbol="&#xf190;"></span>
          </div>

          <div class="text-right p-t-8 p-b-31">
            <a href="forgot_pw.jsp">
              Quên mật khẩu?
            </a>
          </div>

          <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
              <div class="login100-form-bgbtn"></div>
              <button type="submit" class="login100-form-btn">
                Đăng nhập
              </button>
            </div>
          </div>

<p> Hoặc đăng kí <a href="sign_up.html" class="mot">tại đây!</a></p>

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