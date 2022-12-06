<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>



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
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="limiter">
  <div class="container-login100" >
    <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
      <form class="login100-form validate-form" method="post" action="PasswordRecovery">
					<span class="login100-form-title p-b-49">
						ĐẶT LẠI MẬT KHẨU
					</span>
        <%String err = (String) request.getAttribute("err");%>
        <p style="color: red"><%= err != null?err:""%></p>
        <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
          <i class="fa fa-envelope" style="font-size: 16px;position: absolute;
  top: 26px;"   aria-hidden="true" ></i>
          <input class="input100" type="text" name="email" placeholder="Nhập mật Khẩu" autocomplete="off" >

        </div>


        <div class="container-login100-form-btn">
          <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn">
              Tiếp theo
            </button>
          </div>
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

</nav>
</body>
</html>