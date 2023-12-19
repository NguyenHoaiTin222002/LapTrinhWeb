<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CartService" %>
<%@ page import="vn.edu.hcmuaf.fit.uilt.Fomat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.service.InfoBillService" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CartService" %>--%>
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill</title>

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
    <link rel="stylesheet" href="./assets/css/cart.css">
</head>
<body>
<% Integer idUser = 0;%>
<%    idUser = (Integer) request.getSession().getAttribute("idUser"); %>
<% User user = (User)request.getSession().getAttribute("User"); %>

<% String idBilll = request.getParameter("idBill");%>
   <%int idBill = Integer.parseInt(idBilll);%>
<% List<InfoBill> listif= InfoBillService.getInfoBillbyidBill(idBill);%>
<%String mess = (String) request.getAttribute("mess");%>
<jsp:include page="header.jsp"></jsp:include>
<!-- /BREADCRUMB -->

<div class="cart_table">
    <div class="container">

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Sản Phẩm</th>
                <th scope="col">Đơn Giá</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Tổng Tiền</th>

            </tr>
            </thead>
            <tbody>
            <% for (InfoBill infoBill: listif
            ) {%>
            <%double totalMoney=0;%>
            <% Product product = ProductService.getProductById(infoBill.getIdProduct()); %>
            <%double moneyNew = Math.floor(product.getPrice() - product.getPrice()*0.01*product.getSale());%>

                <%totalMoney += moneyNew*infoBill.getAmount();%>


            <tr class="cart-set-row">
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
                <td> <div class="cart-table-price"> <%= Fomat.fomatCurrency(moneyNew) %></div> </td>
                <td><div class="qty-label">
                    <div style="width: 80px;" class="input-number">
                        <input id="valueNumber" type="number" value="<%=infoBill.getAmount()%>">
                    </div>
                </div>

                </td>
                <td>
                    <input id="price_<%=infoBill.getIdInfoBill()%>" type="number" value="<%=moneyNew%>" hidden >
                    <p id="tatol_<%=infoBill.getIdInfoBill()%>" class="cart-table-tatol"><%= Fomat.fomatCurrency(moneyNew*infoBill.getAmount()) %></p></td>
                <td>
                    <a href="DeleteCart?idDeleteCart=<%=infoBill.getIdInfoBill()%>">  <button class=" btn cart-table-delete"><i class="fa fa-trash"></i>
                    </button> </a>
                </td>

            </tr>



            </tbody>
        </table>
    </div>
</div>
<div class="cart_buy">
    <div class="container">
        <div class="cart_buy-content">

            <div  class="cart_buy-total"> <label>Tổng Tiền:</label> <label id="buy-total"><%=Fomat.fomatCurrency(totalMoney)%></label></div>

        </div>
    </div>
</div>
<%}%>
<div class="modal fade" id="PurchaseModal" tabindex="-1" role="dialog" aria-labelledby="PurchaseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="PurchaseModalLabel">Địa chỉ Thanh Toán</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="OutCheck" >
                    <div class="cart-form-layout">
                        <div class="form-group ">
                            <label>Họ Tên</label>
                            <input type="text" value="<%=user.getFullName()%>" name="fullName" class="form-control" id="cartFormInputName1" aria-describedby="NameHelp" placeholder="Nhập Họ Tên">

                        </div>
                        <div class="form-group ">
                            <label >SĐT</label>
                            <input type="text" value="<%=user.getPhone()%>" name="phone" class="form-control" id="cartFormInputPhone1" aria-describedby="PhoneHelp" placeholder="Nhập Số Điện Thoại">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label>Địa Chỉ</label>
                        <input type="text"  value="<%=user.getAddress()%>" name="address" class="form-control" id="cartFormInputAddress1" aria-describedby="AddressHelp" placeholder="Nhập Địa Chỉ">
                    </div>
                    <div class="form-group">
                        <label >Ghi chú</label>
                        <textarea class="form-control" id="cartFormInputDecription1" name="decription" rows="3" ></textarea>
                    </div>
                    <div class="cart-form-btn">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Trở lại</button>
                        <button type="submit" class="btn btn-primary cart-form-btn-submit">Thanh Toán</button>
                    </div>

                </form>
            </div>


        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>





<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./assets/js/cart.js"></script>
<script>


</script>
</body>
</html>
