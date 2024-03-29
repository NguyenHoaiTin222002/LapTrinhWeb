

<%--<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>--%>
<%@ page import="java.util.List" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>--%>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.uilt.Fomat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.model.User" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Sản Phẩm</title>

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

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<% List<Product> listP = (List<Product>) request.getAttribute("listp"); %>
<%List<Category> listC= (List<Category>) request.getAttribute("listc");%>
<% Integer num = (Integer) request.getAttribute("num");%>
<% Integer numberPage = (Integer) request.getAttribute("page");%>
<% Integer id = (Integer) request.getAttribute("id");%>
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

                    <div class="checkbox-filter">
                        <ul class="list-group  category-block"><h3 class="dm"><i class="fa fa-bars" aria-hidden="true"></i> Danh Mục</h3>
                            <% for (Category c: listC
                            ) {%>
                            <li class="list-group-item text-white "><a   href="cate-control?id=<%= c.getIdCategory()%>"><%= c.getNameCategory()%></a></li>
                            <%}%>
                        </ul>



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
                            <select id="sort" class="input-select input-sort ">
                                <option value="">Sắp xếp</option>
                                <option value="?sort_by=tangdan">Giá nhỏ đến lớn</option>
                                <option value="?sort_by=giamdan">Giá từ lớn đến nhỏ</option>
                                <option value="?sort_by=kytu-az">Xếp từ A - Z</option>
                                <option value="?sort_by=kytu-za">Xếp từ Z - A</option>
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

                    <% List<Product> products = ProductService.getAllProductByIdCategory(5,1,"new");
                        for (Product item: products
                        ) { %>
                    <div class="product-widget">
                        <div class="product-img">
                            <img src="<%=item.getImg()%>" alt="">
                            <div class="product-label">
                                <span class="sale <%=item.getSale() > 0 ?""  :"displayNone"%>">-<%= item.getSale() %>%</span>
                                <span class="new <%=item.getNewProduct() != 1 ? "displayNone":""%>">NEW</span>
                            </div>
                        </div>
                        <div class="product-body">
                            <h3 class="product-name"><a href="Product?id=<%=item.getIdProduct()%>"><%=item.getNameProduct()%></a></h3>
                            <%double moneyNew = Math.floor(item.getPrice() - item.getPrice()*0.01*item.getSale());%>
                            <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%>
                                <del class="product-old-price <%=item.getSale() > 0 ? "":"displayNone"%> "><%=Fomat.fomatCurrency(item.getPrice())%> </del></h4>
                            <h4 class="product-sold">đã bán: <%= item.getAmountProduct()%> <div class="product-old-remaining">còn lại:<%= item.getAmountSoldProduct()%> </div></h4>

                        </div>

                    </div>
                    <!-- product widget -->
                    <%}%>


                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">


                <!-- store products -->
                <div class="row">
                    <!-- product -->
                    <%
                        for (Product p: listP
                        ) { %>
                    <div class="col-md-3 col-xs-6">


                        <!-- product -->

                        <div class="product">
                            <div class="product-img">
                                <img src="<%=p.getImg()%>" alt="">
                                <div class="product-label">
                                    <span class="sale <%=p.getSale() > 0 ?""  :"displayNone"%>">-<%= p.getSale() %>%</span>
                                    <span class="new <%=p.getNewProduct() != 1 ? "displayNone":""%>">NEW</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="Product?id=<%=p.getIdProduct()%>"><%= p.getNameProduct()%></a></h3>
                                <%double moneyNew = Math.floor(p.getPrice() - p.getPrice()*0.01*p.getSale());%>

                                <h4 class="product-price"><%=Fomat.fomatCurrency(moneyNew)%>
                                    <del class="product-old-price <%=p.getSale() > 0 ? "":"displayNone"%> "><%=Fomat.fomatCurrency(p.getPrice())%> </del></h4>
                                <h4 class="product-sold">đã bán:<%= p.getAmountSoldProduct()%>  <div class="product-old-remaining">còn lại:<%=p.getAmountProduct()%></div></h4>

                            </div>
                            <div class="add-to-cart">
                                <a href="/InsetCart?idProductCart=<%=p.getIdProduct()%>"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button></a>                            </div>
                        </div>



                    </div>
                    <%}%>

                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">

                        <ul class="store-pagination">
                            <% if (numberPage >1){ %>

                            <li><a href="list-product?page=<%= numberPage -1%>"><i class="fa fa-angle-left"></i></a></li>
                            <%}%>

                            <%
                                for (int i = 1; i <num ; i++)
                                {  %>
                                  <li class="<%=numberPage==i?"active":""%>" ><a href="list-product?page=<%=i%>"><%=i%></a></li>
                                <%}%>

                            <% if (numberPage <num){ %>

                            <li><a href="list-product?page=<%= numberPage +1%>"><i class="fa fa-angle-right"></i></a></li>
                            <%}%>
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



<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/nouislider.min.js"></script>
<script src="./assets/js/jquery.zoom.min.js"></script>
 <script src="./assets/js/main.js"></script>
<script type="text/javascript">
    $(document).ready(function (){
        $('#sort').on('change',function (){
            var  url = $ (this).val();
            if (url){
                window.location= url ;
            }
            return false;
        });
    });

</script>
</body>
</html>