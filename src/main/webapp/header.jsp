<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CartService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02/12/2022
  Time: 11:05 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- HEADER -->
<header>
    <% String name = (String) request.getSession().getAttribute("fullName");%>
    <% String img = (String) request.getSession().getAttribute("imgUser");%>
    <% Integer id = (Integer)request.getSession().getAttribute("idUser") ;%>
     <% List< Category> categoryList =  CategoryService.getAllCatery(); %>
    <% List<Cart> cartList = new ArrayList<>(); %>
    <%if(id != null){ %>
    <% cartList = CartService.getAllCartByIDUser(id); %>
    <%}%>

    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i>0814734661</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i>20130436@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a></li>
            </ul>
            <ul class="header-links pull-right <%=name == null?"":" header-links-login"%>">
                <li><a href="sign_up.jsp">Đăng Ký</a></li>
                <li><a href="sign_in.jsp">Đăng Nhập</a></li>
            </ul>
            <ul class="header-links pull-right  <%=name != null?"":" header-links-login"%> ">
                <li><a href="user.jsp">
                    <div class="header-login-user">
                        <img class="header-login-user-img" src="<%=img%>">
                         <%=name%>
                    </div>
                </a></li>
                <li><a href="forgot_upPassword.jsp">Đặt Lại Mật Khẩu</a></li>
                <li><a href="/LogOut">Đăng Xuất</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="./assets/img/Logo-2.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">Sản Phẩm</option>
                                <option value="1">Giấy In</option>
                                <option value="1">Keo - Dao</option>
                            </select>
                            <input class="input" placeholder="Tìm sản phẩm">
                            <button class="search-btn">Tìm</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->



                        !-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Giỏ Hàng</span>
                                <div class="qty"><%=cartList.size()%></div>
                            </a>
                            <div class="cart-dropdown ">
                                <div class="cart-list">
                                   <%
                                       for (Cart item:cartList) { %>
                                     <%Product  product = ProductService.getProductById(item.getIdProduct()); %>
                                             <div class="product-widget">
                                        <div class="product-img">
                                            <img src="<%=product.getImg()%>" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="product.html"><%=product.getNameProduct()%>
                                                   </a></h3>
                                            <h4 class="product-price"><span class="qty"><%=item.getAmount()%></span>980.000đ</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>
                                      <% }%>

                                </div>
                                <div class="cart-summary">
                                    <small>Số lượng sản phẩm</small>
                                    <h5>Tổng tiền: 2940.000d</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="cart.html">Giỏ Hàng</a>
                                    <a href="cart.html">Thanh Toán <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="index.html">Trang Chủ</a></li>
                <li><a href="products.html">Sản Phẩm</a></li>
                <% for (Category item: categoryList) { %>
                <li><a href="products.html"><%=item.getNameCatogory()%></a></li>
               <% } %>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
