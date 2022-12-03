<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CartService" %>--%>
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>

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
    <link rel="stylesheet" href="../assets/css/cart.css">
</head>
<body>
<% Integer idUser = 0;
    idUser = (Integer) request.getSession().getAttribute("idUser"); %>
<% List<Cart> listCart = new ArrayList<>();
    if(idUser !=null){
        listCart = CartService.getAllCartByIDUser((int)idUser);
    }
%>
<% Double money = 0.0;%>
<jsp:include page="header.jsp"></jsp:include>
<!-- /BREADCRUMB -->
<div class="cart_table">
    <div class="container">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Sản Phẩm</th>

                <th scope="col">Đơn Giá</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Tổng Tiền</th>
                <th scope="col">Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <% for (Cart cart : listCart)
            { %>
            <% Product product = ProductService.getProductById(cart.getIdProduct()); %>
            <% money += Math.floor(product.getPrice() - product.getPrice()*0.01*product.getSale())*cart.getAmount(); %>
            <tr class="cart-set-row">
                <th scope="row" ><div class="cart-table-check"><input type="checkbox" name="" ></div></th>
                <td >
                    <div class="cart-table-product">
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=product.getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href=""><%=product.getNameProduct()%>
                                </a></h3>

                            </div>
                        </div>
                    </div>
                </td>
                <td> <div class="cart-table-price"> <%= Math.floor(product.getPrice() - product.getPrice()*0.01*product.getSale()) %></div> </td>
                <td><div class="qty-label">
                    <div class="cart-table-input-number">

                        <input type="number" value="<%=cart.getAmount()%>">
                        <span class="qty-up">+</span>
                        <span class="qty-down">-</span>
                    </div>
                </div>

                </td>
                <td> <div class="cart-table-tatol"><%= Math.floor(product.getPrice() - product.getPrice()*0.01*product.getSale())* cart.getAmount() %>đ</div></td>
                <td><button class=" btn cart-table-delete"><i class="fa fa-trash"></i></button></td>
            </tr>

            <% } %>



            </tbody>
        </table>
    </div>
</div>
<div class="cart_buy">
    <div class="container">
        <div class="cart_buy-content">
            <div class="cart_buy-total">Tổng Tiền: <%=money%>đ</div>
            <div class="cart_buy-btn">
                <button  type="button" class="cart_buy-btn-buy btn" data-toggle="modal" data-target="#PurchaseModal">Mua Hàng</button>

            </div>
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