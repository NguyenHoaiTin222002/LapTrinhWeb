<%--<%@ page import="vn.edu.hcmuaf.fit.model.Category" %>--%>
<%@ page import="java.util.List" %>
<%--<%@ page import="vn.edu.hcmuaf.fit.service.CategoryService" %>--%>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %>
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Danh sách khách hàng | Quản trị Admin</title>
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
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="index.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="menu-left.jsp"></jsp:include>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách khách hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>

                    </div>
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID khách hàng</th>
                            <th width="150">Họ và tên</th>
                            <th width="20">Ảnh thẻ</th>
                            <th width="300">Địa chỉ</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>SĐT</th>
                            <th width="100">Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% List<User> users = UserService.getAllUser();
                            for (User item: users
                            ) { %>
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td><%=item.getIdUser()%></td>
                            <td><%=item.getFullName()%></td>
                            <td><img class="<%=item.getImg()%>" alt=""></td>
                            <td><%=item.getAddress()%></td>
                            <td><%=item.getBirthday()%></td>
                            <td><%=item.getGender()%></td>
                            <td><%=item.getPhone()%></td>

<<<<<<< HEAD
                            <td>
                                <button class="btn btn-primary btn-sm trash" type="button"  title="Xóa" data-id="<%=item.getIdUser()%>"
=======
                            <td class="table-td-center">
                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" data-id="<%=item.getIdUser()%>"
>>>>>>> 6439d1d2043f1a04f9c99a73f3213d304edf10a7
                                        onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
                                </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                        data-target="#ModalUP"><i class="fas fa-edit"></i></button>

                            </td>
                        </tr>
                        <%}%>
                        <tr>
                            <td width="10"><input type="checkbox" name="check2" value="2"></td>
                            <td>#DH0241</td>
                            <td>Đỗ Tiến Phát</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/8.jpg" alt=""></td>
                            <td>Đức Huệ, Đức Hòa, Long An</td>
                            <td>29/02/1995</td>
                            <td>Nam</td>
                            <td>0931342432</td>

                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                        onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="10"><input type="checkbox" name="check3" value="3"></td>
                            <td>#NH2871</td>
                            <td>Lâm Ngọc Hoa</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/14.jpg" alt=""></td>
                            <td>Số 3 Hòa Bình, Phường 3, Quận 11, Hồ Chí Minh </td>
                            <td>29/12/2000</td>
                            <td>Nữ</td>
                            <td>0931491997</td>

                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction()"><i
                                    class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="10"><input type="checkbox"></td>
                            <td>#ST2746</td>
                            <td>Huỳnh Nhật Trung</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/16.jpg" alt=""></td>
                            <td>Cá Rô, Hòa Bình, Bạc Liêu</td>
                            <td>25/07/2002</td>
                            <td>Nam</td>
                            <td>0916706633</td>

                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction()"><i
                                    class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="10"><input type="checkbox"></td>
                            <td>#KH3276</td>
                            <td>Nguyễn Thành Khắc Huy</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/12.jpg" alt=""></td>
                            <td>Điện Biên Phủ, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh</td>
                            <td>03/05/1999</td>
                            <td>Nam</td>
                            <td>0971038066</td>

                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction()"><i
                                    class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit"
                                        type="button" title="Sửa" id="show-emp"

                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"

                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="10"><input type="checkbox"></td>
                            <td>#BS7228</td>
                            <td>Lưu Thị Ngọc Nhi</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/15.jpg" alt=""></td>
                            <td>126 Nguyễn Thiện Thành, Phường 5, Trà Vinh</td>
                            <td>25/04/2000</td>
                            <td>Nữ</td>
                            <td>0846881155</td>

                            <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction()"><i
                                    class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="10"><input type="checkbox"></td>
                            <td>#YU1376</td>
                            <td>Lê Hoài Ân</td>
                            <td><img class="img-card-person" src="./assets/img/img-anhthe/11.jpg" alt=""></td>
                            <td>Sơn Hải, Kiên Lương, Kiên Giang</td>
                            <td>29/12/2002</td>
                            <td>Nam</td>
                            <td>0836333037</td>

                            <td><button class="btn btn-primary btn-sm trash" title="Xóa" onclick="myFunction()"><i
                                    class="fas fa-trash-alt"></i>
                            </button>
                                <button class="btn btn-primary btn-sm edit" title="Sửa" id="show-emp" data-toggle="modal"
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
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa thông tin nhân viên cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID nhân viên</label>
                        <input class="form-control" type="text" required value="#CD2187" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Họ và tên</label>
                        <input class="form-control" type="text" required value="Võ Trường">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số điện thoại</label>
                        <input class="form-control" type="number" required value="09267312388">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Địa chỉ email</label>
                        <input class="form-control" type="text" required value="truong.vd2000@gmail.com">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Ngày sinh</label>
                        <input class="form-control" type="date" value="15/03/2000">
                    </div>
                    <div class="form-group  col-md-6">
                        <label for="exampleSelect1" class="control-label">Chức vụ</label>
                        <select class="form-control" id="exampleSelect1">
                            <option>Bán hàng</option>
                            <option>Tư vấn</option>
                            <option>Dịch vụ</option>
                            <option>Thu Ngân</option>
                            <option>Quản kho</option>
                            <option>Bảo trì</option>
                            <option>Kiểm hàng</option>
                            <option>Bảo vệ</option>
                            <option>Tạp vụ</option>
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
MODAL
-->

<!-- Essential javascripts for application to work-->
<script src="./assets/js/bootstrap1.min.js"></script>
<script src="./assets/js/jquery-3.2.1.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<<<<<<< HEAD
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

=======
>>>>>>> 6439d1d2043f1a04f9c99a73f3213d304edf10a7
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
        console.log( document.getElementById("sampleTable"));
        document.getElementById("sampleTable").deleteRow(i);
    }
    jQuery(function () {
        jQuery(".trash").click(function () {
<<<<<<< HEAD
            var idProduct = $(this).data("id");
            swal({
                title: "Cảnh báo",

                text: "Bạn có chắc chắn là muốn xóa khách hàng này?" ,
=======
            var idUser = $(this).data("id");
            swal({
                title: "Cảnh báo",

                text: "Bạn có chắc chắn là muốn xóa khách hàng này?",
>>>>>>> 6439d1d2043f1a04f9c99a73f3213d304edf10a7
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {
                        deleteRow(this);

                        $.ajax({
                            url: 'DeleteKHAdmin',
                            type: 'get',
                            cache: false,
<<<<<<< HEAD
                            data: { idProduct:idProduct} ,
=======
                            data: { idUser:idUser} ,
>>>>>>> 6439d1d2043f1a04f9c99a73f3213d304edf10a7

                            success: function (data) {
                                alert("Đã xóa thành công.!")
                            },
                            error: function () {
                                alert("error");
                            }
                        });
                    }

                });
        });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });



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

    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
</script>

</body>
</html>
