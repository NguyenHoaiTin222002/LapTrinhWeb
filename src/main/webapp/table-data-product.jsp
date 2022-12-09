<%--<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>--%>
<%@ page import="java.util.List" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>--%>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Danh sách sản phẩm | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" href="./assets/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" href="./assets/css/navBarUser.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
</head>
<body onload="time()" class="app sidebar-mini rtl">
<%Product product = (Product) request.getSession().getAttribute("Product");%>
<header class="app-header">
  <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                  aria-label="Hide Sidebar"></a>
  <!-- Navbar Right Menu-->
  <ul class="app-nav">


    <!-- User Menu-->
    <li><a class="app-nav__item" href="index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

    </li>
  </ul>
</header>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<jsp:include page="menu-left.jsp"></jsp:include>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
    </ul>
    <div id="clock"></div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="row element-button">
            <div class="col-sm-2">

              <a class="btn btn-add btn-sm" href="form-add-san-pham.html" title="Thêm"><i class="fas fa-plus"></i>
                Tạo mới sản phẩm</a>
            </div>

            <div class="col-sm-2">
              <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myAppprintTable()"><i
                      class="fas fa-print"></i> In dữ liệu</a>
            </div>

          </div>
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
            <tr>
              <th width="10"><input type="checkbox" id="all"></th>
              <th>Mã sản phẩm</th>
              <th>Tên sản phẩm</th>
              <th>Ảnh</th>
              <th>Số lượng</th>
              <th>Tình trạng</th>
              <th>Giá tiền</th>
              <th>Danh mục</th>
              <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>

            <% List<Product> products = ProductService.getAllProduct();
              for (Product item: products
              ) { %>

            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td><%=item.getIdProduct()%></td>
              <td><%=item.getNameProduct()%></td>
              <td><img src="<%=item.getImg()%>" alt="" width="100px;"></td>
              <td><%=item.getSale()%></td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td><%=item.getPrice()%> đ</td>
              <td>Tập</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <%}%>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613020</td>
              <td>Tập Học Sinh B5 4 Ô Ly 120 Trang Pokemon</td>
              <td><img src="./assets/img/Tap/tap2.jpg" alt="" width="100px;"></td>
              <td>70</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>18000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613021</td>
              <td>Tập Sinh Viên 4 Ô Ly Ngang 200 Trang City - Hải Tiến</td>
              <td><img src="./assets/img/Tap/tap3.jpg" alt="" width="100px;"></td>
              <td>30</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>17000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>


              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613022</td>
              <td>Tập 5 Ô Ly 96 Trang Class Foody - Hồng Hà</td>
              <td><img src="./assets/img/Tap/tap4jpg" alt="" width="100px;"></td>
              <td>50</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>7000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>
              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613023</td>
              <td>Vở Kẻ Ngang 80 Trang Cosmo - Haplus</td>
              <td><img src="./assets/img/Tap/tap5jpg" alt="" width="100px;"></td>
              <td>50</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>9000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613024</td>
              <td>Tập Kẻ Ngang 80 Trang Sao Mai Emotion - Hồng Hà</td>
              <td><img src="./assets/img/Tap/tap6jpg" alt="" width="100px;"></td>
              <td>55</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>11000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613025</td>
              <td>Tập Kẻ Ngang 200 Trang Pupil Paper Color - Hồng Hà</td>
              <td><img src="./assets/img/Tap/tap7jpg" alt="" width="100px;"></td>
              <td>38</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>14000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i> </button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>613025</td>
              <td>Tập Sinh Viên 4 Ô Ly Ngang 200 Trang Truewrite White</td>
              <td><img src="./assets/img/Tap/tap8jpg" alt="" width="100px;"></td>
              <td>80</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>17000 đ</td>
              <td>Tập</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713710</td>
              <td>Bút Bi 06mm - Stacom BP2026-B - Mực Đỏ</td>
              <td><img src="./assets/img/But/but1jpg" alt="" width="100px;"></td>
              <td>80</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>3000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713711</td>
              <td>Bút Bi Bấm Xóa Được 07mm Pliot Frixion Clicker - Mực Xanh</td>
              <td><img src="./assets/img/But/but2jpg" alt="" width="100px;"></td>
              <td>46</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>58000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713712</td>
              <td>Bút Bi Điểm 10 Sweetme Thiên Long TP - 08 - Mực Xanh</td>
              <td><img src="./assets/img/But/but3jpg" alt="" width="100px;"></td>
              <td>66</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>3000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713713</td>
              <td>Bút Bi K15 Schneider 3080 - Mực Xanh</td>
              <td><img src="./assets/img/But/but4jpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-danger">Hết hàng</span></td>
              <td>10000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713714</td>
              <td>Bút Bi Khúc Điểm 10 Thiên Long TP - PC005</td>
              <td><img src="./assets/img/But/but5jpg" alt="" width="100px;"></td>
              <td>73</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>3000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713715</td>
              <td>Bút Bi Oficetex OT - BP020BU - Mực Xanh</td>
              <td><img src="./assets/img/But/but6jpg" alt="" width="100px;"></td>
              <td>60</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>2000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713716</td>
              <td>Bút Chì Gỗ 2B Smart Kids Exam Standard SK - 092 - Thân Đỏ</td>
              <td><img src="./assets/img/But/but7jpg" alt="" width="100px;"></td>
              <td>65</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>20000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713717</td>
              <td>Bút Chì Gỗ 2B Smart Kids Soft Series SK - 091 - Thân Xanh Lá</td>
              <td><img src="./assets/img/But/but8jpg" alt="" width="100px;"></td>
              <td>20</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>20000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713718</td>
              <td>Bút Dạ Quang Pastel - Bitex HL05 - Mild Pink</td>
              <td><img src="./assets/img/But/but9jpg" alt="" width="100px;"></td>
              <td>30</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>7600 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713719</td>
              <td>Bút Dạ Quang Pastel - Bitex HL05 - Mild Blue</td>
              <td><img src="./assets/img/But/but10jpg" alt="" width="100px;"></td>
              <td>40</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>7600 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713720</td>
              <td>Bút Gel Mực Đỏ OT - GP004RE</td>
              <td><img src="./assets/img/But/but11jpg" alt="" width="100px;"></td>
              <td>50</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>4800 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713721</td>
              <td>Bút Gel Xóa Được TP - GELE01</td>
              <td><img src="./assets/img/But/but12jpg" alt="" width="100px;"></td>
              <td>55</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>12000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713722</td>
              <td>Bút Kim Tuyến WMZ GA108900 - Nhũ Đông</td>
              <td><img src="./assets/img/But/but13jpg" alt="" width="100px;"></td>
              <td>70</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>8000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713723</td>
              <td>Bút Lông Bảng Thiên Long WB - 02 - Mực Xanh</td>
              <td><img src="./assets/img/But/but14jpg" alt="" width="100px;"></td>
              <td>65</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>7000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713724</td>
              <td>Bút Lông Dầu PM - 04</td>
              <td><img src="./assets/img/But/but15jpg" alt="" width="100px;"></td>
              <td>60</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>11000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713725</td>
              <td>Bút Lông Kim Tuyến Staedtler 334 - 3 - Mực Xanh</td>
              <td><img src="./assets/img/But/but16jpg" alt="" width="100px;"></td>
              <td>40</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>26000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713726</td>
              <td>Bút Lông Màu Thiên Long FP - C03 - Túi 20 Màu</td>
              <td><img src="./assets/img/But/but17jpg" alt="" width="100px;"></td>
              <td>60</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>64000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713727</td>
              <td>Bút Máy Hero 329 - Màu Nâu Đỏ</td>
              <td><img src="./assets/img/But/but18jpg" alt="" width="100px;"></td>
              <td>60</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>56000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713728</td>
              <td>Combo Bút SK - CFP001 Và 6 Ống Mực Màu Tím Rời (Con Ong)</td>
              <td><img src="./assets/img/But/but19jpg" alt="" width="100px;"></td>
              <td>60</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>18600 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713729</td>
              <td>Combo Bút SK - CFP004 Và 6 Ống Mực Màu Tím Rời (Con Ong)</td>
              <td><img src="./assets/img/But/but20jpg" alt="" width="100px;"></td>
              <td>80</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>19600 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713730</td>
              <td>Hộp 10 Bút Lông Bảng Thiên Long - Mực Xanh</td>
              <td><img src="./assets/img/But/but21jpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>99000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713731</td>
              <td>Hộp 12 Viết Bi TriTouch DBP - Mực Xanh</td>
              <td><img src="./assets/img/But/but22jpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>68000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713732</td>
              <td>Hộp 20 Bút Bi 05mm Thiên Long TL - 027 - Mực Xanh</td>
              <td><img src="/main/assets/img/But/but23jpg" alt="" width="100px;"></td>
              <td>100</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>69000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713733</td>
              <td>Hộp 20 Bút Bi 05mm Treenden - Thiên Long TL - 079 - Mực Xanh</td>
              <td><img src="/main/assets/img/But/but24jpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>80000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>713734</td>
              <td>Ruột Chì 2B 05mm Gold XQ 502</td>
              <td><img src="/main/assets/img/But/but25jpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Nhập hàng</span></td>
              <td>11000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>833196</td>
              <td>Vỉ 2 Bút Lông Bảng WB - 02</td>
              <td><img src="/main/assets/img/But/but26jpg" alt="" width="100px;"></td>
              <td>30</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>15600 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>852739</td>
              <td>Viết Nước My - Gel Đông A - Mực Đỏ</td>
              <td><img src="/main/assets/img/But/but29jpg" alt="" width="100px;"></td>

              <td>80</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>11000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921549</td>
              <td>Bóp Viết Eva Spider - Man Red - HooHooHaHa</td>
              <td><img src="/main/assets/img/DungCu/DungCu1-minjpg" alt="" width="100px;"></td>
              <td>50</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921550</td>
              <td>Bóp Viết Eva Spider - Man Black - HooHooHaHa</td>
              <td><img src="/main/assets/img/DungCu/DungCu2-minjpg" alt="" width="100px;"></td>
              <td>40</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921551</td>
              <td>Bóp Viết Eva Avengers Red - HooHooHaHa</td>
              <td><img src="/main/assets/img/DungCu/DungCu3-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921552</td>
              <td>Bóp Viết Eva Frozen Elsa - HooHooHaHa
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu4-minjpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921553</td>
              <td>Bóp Viết Eva Frozen Anna - HooHooHaHa
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu5-minjpg" alt="" width="100px;"></td>
              <td>140</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921554</td>
              <td>Hộp Bút Hít - XiaoLingJing 3508 - Màu Xanh Dương - Mẫu 14
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu6-minjpg" alt="" width="100px;"></td>
              <td>40</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>84000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921555</td>
              <td>Hộp Bút Hít - XiaoLingJing 3508 - Màu Hồng - Mẫu 12
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu7-minjpg" alt="" width="100px;"></td>
              <td>50</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>84000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921556</td>
              <td>Túi Lưới A6 1 Ngăn - Stacom ZC101A6 - Màu Vàng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu8-minjpg" alt="" width="100px;"></td>
              <td>55</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>19000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921557</td>
              <td>Hộp Bút Nhựa Eva Ballerinas - Stacom PB-104E - Màu Xanh Biển
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu9-minjpg" alt="" width="100px;"></td>
              <td>5</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921558</td>
              <td>Bóp Viết Clever Hippo Classic HL0111- LOL Present Surprise - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu10-minjpg" alt="" width="100px;"></td>
              <td>80</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>189000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921559</td>
              <td>Bóp Viết Clever Hippo Classic HV0116 - Siêu Robo Vectobot - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu11-minjpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Nhập hàng</span></td>
              <td>189000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921560</td>
              <td>Bóp Viết Clever Hippo Classic HU0113 - Kỳ Lân Ngân Hà - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu12-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>184000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921561</td>
              <td>Bóp Viết Clever Hippo Classic HA0112-Alpaca Tinh Nghịch - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu13-minjpg" alt="" width="100px;"></td>
              <td>100</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>189000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921562</td>
              <td>Hộp Bút Doraemon - Thiên Long PCA-011/DO - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu14-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>58000 đ</td>
              <td>Bút</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921563</td>
              <td>Bóp Viết 3D Anime - GuangBo H00249 - Funny Lion

              </td>
              <td><img src="/main/assets/img/DungCu/DungCu15-minjpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>168000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921564</td>
              <td>Bóp Viết 3D Anime - GuangBo H00249 - Little Chich
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu16-minjpg" alt="" width="100px;"></td>
              <td>25</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>145000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921565</td>
              <td>Bóp Viết Eva Avengers Red - HooHooHaHa</td>
              <td><img src="/main/assets/img/DungCu/DungCu17-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>168000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921566</td>
              <td>Bóp Viết Nhựa FA2005048G - Màu Xanh Ngọc
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu18-minjpg" alt="" width="100px;"></td>
              <td>15</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>80000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921567</td>
              <td>Bóp Viết Vải Kawaii - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu19-minjpg" alt="" width="100px;"></td>
              <td>55</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>75000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921568</td>
              <td>Bóp Viết Nhựa FA2005048B - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu20-minjpg" alt="" width="100px;"></td>
              <td>35</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>80000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921569</td>
              <td>Bóp Viết Nhựa Trong FA2004014Y - Màu Vàng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu21-minjpg" alt="" width="100px;"></td>
              <td>95</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>71000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921570</td>
              <td>Bóp Viết Nhựa Trong FA2004014G - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu22-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>71000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921571</td>
              <td>Bóp Viết Khủng Long Stegos-JY-2022
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu23-minjpg" alt="" width="100px;"></td>
              <td>53</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>122000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921572</td>
              <td>Bóp Viết Vải Kawaii - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu24-minjpg" alt="" width="100px;"></td>
              <td>22</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>75000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921573</td>
              <td>Bóp Viết Vải - Languo LG - 12410 - Màu Xanh Mint
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu25-minjpg" alt="" width="100px;"></td>
              <td>57</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>168000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921574</td>
              <td>Hộp Bút Nhựa - iiGEN YZ5819
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu26-minjpg" alt="" width="100px;"></td>
              <td>82</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>186000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921575</td>
              <td>Hộp Bút Nhựa - iiGEN YZ5821
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu27-minjpg" alt="" width="100px;"></td>
              <td>95</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>186000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921576</td>
              <td>Bóp Viết Sumikko Gurashi Half Moon Ver2 - Magic Channel - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu28-minjpg" alt="" width="100px;"></td>
              <td>28</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>173000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921577</td>
              <td>Bóp Viết Sumikko Gurashi Half Moon 1 - Magic Channel
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu29-minjpg" alt="" width="100px;"></td>
              <td>15</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>173000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921578</td>
              <td>Bóp Viết Vải LG - 11889 - Màu Xanh Mint
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu30-minjpg" alt="" width="100px;"></td>
              <td>59</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>109000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921579</td>
              <td>Túi Lưới Stacom Có Khóa Kéo A5 ZC101A5 - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu31-minjpg" alt="" width="100px;"></td>
              <td>62</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>21000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921580</td>
              <td>Bóp Viết Bird - Morning Glory 36010-88026 - Màu Xanh Lá
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu32-minjpg" alt="" width="100px;"></td>
              <td>74</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>69000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921581</td>
              <td>Bóp Viết Combi Slider - Morning Glory 36010-87999 - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu33-minjpg" alt="" width="100px;"></td>
              <td>38</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>127000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921582</td>
              <td>Túi Vải Stacom Có Khóa Kéo 2 Ngăn A5 ZD101A5 - Màu Xanh Dương
              </td>
              <td><img src="/assets/img/DungCu/DungCu34-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>28000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921583</td>
              <td>Hộp Bút Hít - XiaoLingJing 3513 - Màu Hồng - Beautiful Scenery
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu35-minjpg" alt="" width="100px;"></td>
              <td>12</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>107000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921584</td>
              <td>Bóp Viết Weaving - Morning Glory 36010-88000- Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu36-minjpg" alt="" width="100px;"></td>
              <td>27</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>115000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921585</td>
              <td>Hộp Bút Sắt - XiaoLingJing B - 672 - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu37-minjpg" alt="" width="100px;"></td>
              <td>53</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>61000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921586</td>
              <td>Hộp Bút Hít - XiaoLingJing 3515-15 - Dream Big Little One - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu38-minjpg" alt="" width="100px;"></td>
              <td>91</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>70000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921587</td>
              <td>Hộp Bút Hít - XiaoLingJing 35222 - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu39-minjpg" alt="" width="100px;"></td>
              <td>27</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>119000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921588</td>
              <td>Túi Lưới HongXing HX-8344 - Hình Cá Voi
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu40-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>24000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921589</td>
              <td>Hộp Bút Hít Máy Tính XiaoLingJing 3547-07 - Màu Hồng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu41-minjpg" alt="" width="100px;"></td>
              <td>52</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>109000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921590</td>
              <td>Hộp Bút Bebé SP TP - PCA006/MI - BB06MIC - 004DB
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu42-minjpg" alt="" width="100px;"></td>
              <td>10</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>80000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921591</td>
              <td>Hộp Bút Nhựa Eva Rabbit - Stacom PB-102E - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu43-minjpg" alt="" width="100px;"></td>
              <td>19</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>140000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921592</td>
              <td>Bóp Viết Eva Lớp Học Mật Ngữ - HooHooHaHa VPH03-0100 - Magic Violet
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu44-minjpg" alt="" width="100px;"></td>
              <td>150</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>114000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921593</td>
              <td>Bóp Viết Vải Classmate CL-19501 2PP0017 - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu45-minjpg" alt="" width="100px;"></td>
              <td>84</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>52000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921594</td>
              <td>Bóp Viết Hình Cà Tím B1716N - Màu Vàng
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu46-minjpg" alt="" width="100px;"></td>
              <td>86</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>47000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921595</td>
              <td>Hộp Bút Hít - XiaoLingJing 3517 - Màu Xanh Da Trời
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu47-minjpg" alt="" width="100px;"></td>
              <td>47</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>74000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921596</td>
              <td>Túi Vải 1 Ngăn B5 8823 - Màu Hồng
              </td>
              <td><img src="/assets/img/DungCu/DungCu48-minjpg" alt="" width="100px;"></td>
              <td>98</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>20000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921597</td>
              <td>Bóp Viết Vải 5985 - Màu Tím
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu49-minjpg" alt="" width="100px;"></td>
              <td>14</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>91000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>921598</td>
              <td>Bóp Viết Vải - BoShiTu HR-7382 - Known - Màu Nâu
              </td>
              <td><img src="/main/assets/img/DungCu/DungCu50-minjpg" alt="" width="100px;"></td>
              <td>75</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>96000 đ</td>
              <td>Bóp viết</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>

            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>1021501</td>
              <td>Gôm Đất Sét Kneadable Art Eraser - Faber-Castell 127321 - Màu Xanh Dương
              </td>
              <td><img src="/main/assets/img/Gom/Gom1-minjpg" alt="" width="100px;"></td>
              <td>48</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>37000 đ</td>
              <td>Gôm - tẩy</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i>
                </button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>1021502</td>
              <td>Gôm Đất Sét Kneadable Art- Faber-Castell 127321 - Màu Vàng
              </td>
              <td><img src="/main/assets/img/Gom/Gom2-minjpg" alt="" width="100px;"></td>
              <td>94</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>37000 đ</td>
              <td>Gôm - tẩy</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>1021503</td>
              <td>Gôm Đen Dust Free - Faber-Castell
              </td>
              <td><img src="/main/assets/img/Gom/Gom3-minjpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>18500 đ</td>
              <td>Gôm - tẩy</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>1021504</td>
              <td>Gôm Trắng Dust Free - Faber-Castell

              </td>
              <td><img src="/main/assets/img/Gom/Gom4-minjpg" alt="" width="100px;"></td>
              <td>58</td>
              <td><span class="badge bg-success">Còn hàng</span></td>
              <td>18000 đ</td>
              <td>Gôm - tẩy</td>
              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
              </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>1021505</td>
              <td>Gôm Không Bụi Lớn Extra Long Dust
              </td>
              <td><img src="/main/assets/img/Gom/Gom5-minjpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-success">Hết hàng</span></td>
              <td>5000 đ</td>
              <td>Gôm - tẩy </td>
              <td>
                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                        onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
                </button>
                <button id="show-emp" class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                        data-toggle="modal"
                        data-target="#ModalUP"><i class="fas fa-edit"></i>
                </button>

              </td>
            </tr>



            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>

<!--
  MODAL
-->
<div id="ModalUP" class="modal fade"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">

      <div class="modal-body">
        <div class="row">
          <div class="form-group  col-md-12">
          <span class="thong-tin-thanh-toan">
            <h5>Chỉnh sửa thông tin sản phẩm</h5>
          </span>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-md-6">
            <label class="control-label">Mã sản phẩm </label>
            <input class="form-control" type="number" value="613020">
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">Tên sản phẩm</label>
            <input class="form-control" type="text" required value="Combo Nhãn Vở Campus + 2 Cuốn Bao Tập">
          </div>
          <div class="form-group  col-md-6">
            <label class="control-label">Số lượng</label>
            <input class="form-control" type="number" required value="50">
          </div>
          <div class="form-group col-md-6 ">
            <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>
            <select class="form-control" id="exampleSelect1">
              <option>Còn hàng</option>
              <option>Hết hàng</option>
              <option>Nhập hàng</option>
              <option>Khóa</option>
            </select>
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">Giá vốn</label>
            <input class="form-control" type="text" value="215000">
          </div><div class="form-group col-md-6">
          <label class="control-label">Giảm giá (%)</label>
          <input class="form-control" type="text" value="20">
        </div>
          <div class="form-group col-md-6 ">
            <label for="exampleSelect1" class="control-label">Loại sản phẩm</label>
            <select class="form-control" id="exampleSelect1">
              <option>Sản phẩm mới</option>
              <option>Sản phẩm yêu thích</option>
            </select>
          </div>
          <div class="form-group col-md-6">
            <label for="exampleSelect1" class="control-label">Danh mục</label>
            <select class="form-control" id="exampleSelect1">
              <option>Tập</option>
              <option>Bút</option>
              <option>Bóp viết</option>
              <option>Gôm - tẩy</option>

            </select>
          </div>
        </div>
        <BR>
        <button class="btn btn-save" type="button">Lưu lại</button>
        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
        <BR>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!--
<!-- Essential javascripts for application to work-->
<script src="./assets/js/bootstrap1.min.js"></script>
<script src="./assets/js/jquery-3.2.1.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="./assets/js/main1.js"></script>

<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="./assets/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./assets/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
  function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
  }
  jQuery(function () {
    jQuery(".trash").click(function () {
      swal({
        title: "Cảnh báo",

        text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
        buttons: ["Hủy bỏ", "Đồng ý"],
      })
              .then((willDelete) => {
                if (willDelete) {
                  swal("Đã xóa thành công.!", {

                  });
                }
              });
    });
  });
  oTable = $('#sampleTable').dataTable();
  $('#all').click(function (e) {
    $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
    e.stopImmediatePropagation();
  });

  //EXCEL
  // $(document).ready(function () {
  //   $('#').DataTable({

  //     dom: 'Bfrtip',
  //     "buttons": [
  //       'excel'
  //     ]
  //   });
  // });


  //Thời Gian
  function time() {
    var today = new Date();
    var weekday = new Array(7);
    weekday[0] = "Chủ Nhật";
    weekday[1] = "Thứ Hai";
    weekday[2] = "Thứ Ba";
    weekday[3] = "Thứ Tư";
    weekday[4] = "Thứ Năm";
    weekday[5] = "Thứ Sáu";
    weekday[6] = "Thứ Bảy";
    var day = weekday[today.getDay()];
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    nowTime = h + " giờ " + m + " phút " + s + " giây";
    if (dd < 10) {
      dd = '0' + dd
    }
    if (mm < 10) {
      mm = '0' + mm
    }
    today = day + ', ' + dd + '/' + mm + '/' + yyyy;
    tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
    document.getElementById("clock").innerHTML = tmp;
    clocktime = setTimeout("time()", "1000", "Javascript");

    function checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  }
  //In dữ liệu
  var myApp = new function () {
    this.printTable = function () {
      var tab = document.getElementById('sampleTable');
      var win = window.open('', '', 'height=700,width=700');
      win.document.write(tab.outerHTML);
      win.document.close();
      win.print();
    }
  }
  //     //Sao chép dữ liệu
  //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

  // copyTextareaBtn.addEventListener('click', function(event) {
  //   var copyTextarea = document.querySelector('.js-copytextarea');
  //   copyTextarea.focus();
  //   copyTextarea.select();

  //   try {
  //     var successful = document.execCommand('copy');
  //     var msg = successful ? 'successful' : 'unsuccessful';
  //     console.log('Copying text command was ' + msg);
  //   } catch (err) {
  //     console.log('Oops, unable to copy');
  //   }
  // });


  //Modal
  $("#show-emp").on("click", function () {
    $("#ModalUP").modal({ backdrop: false, keyboard: false })
  });
</script>

</body>
</html>
