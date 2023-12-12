<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset= UTF-8 " language="java" pageEncoding="utf-8" %>
<head>

    <title>Hồ Sơ</title>
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
<!-- Navbar-->
<%User user = (User) request.getSession().getAttribute("User");%>
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="/"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="menu-left.jsp"></jsp:include>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Hồ Sơ</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="content-form">
                <div class="content-form-top">
                    <h4 class="content-form-title">Thông Tin Của Tôi</h4>
                    <span>Quản lý thông tin hồ sơ để bảo mật tài khoản</span>

                </div>
                <div class="content-form-bot">
                    <form>
                        <div class="form-group">
                            <div class="profile">
                                <img src="<%=user.getImg()%>" alt="" class="img-fluid rounded-circle">
                                <button type="button" class="btn btn-user-img " >Chọn Ảnh</button>
                            </div>
                        </div>
                        <div class="user-form-layout">
                            <div class="form-group   ">
                                <label >Họ Tên</label>
                                <input type="text" value="<%=user.getFullName()%>" class="form-control" id="userFormInputName1" aria-describedby="NameHelp" placeholder="Nhập Họ Tên">

                            </div>
                            <div class="form-group ">
                                <label >SĐT</label>
                                <input type="text" value="<%=user.getPhone()%>" class="form-control" id="userFormInputPhone1" aria-describedby="PhoneHelp" placeholder="Nhập Số Điện Thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Email</label>
                            <input type="email"  value="<%=user.getEmail()%>" class="form-control" id="userFormInputEmail1" aria-describedby="emailHelp" placeholder="Nhập Email">

                        </div>
                        <div class="form-group">
                            <label >Địa Chỉ</label>
                            <input type="email" value="<%=user.getAddress()%>" class="form-control" id="userFormInputAddress1" aria-describedby="emailHelp" placeholder="Nhập Địa Chỉ">

                        </div>
                        <div class="user-form-layout">
                            <label >Giới tính:</label>
                            <div class="form-check user-form-check">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="option1" <%=user.getGender()==0? "checked":" "%>>
                                <label class="form-check-label" for="exampleRadios1">
                                    Nam
                                </label>
                            </div>
                            <div class="form-check user-form-check">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="option2" <%=user.getGender()==0? "checked":" "%>>
                                <label class="form-check-label" for="exampleRadios2">
                                    Nữ
                                </label>
                            </div>


                        </div>
                        <div class="user-form-layout">
                            <label class="form-label-day" >Ngày Sinh:</label>
                            <select class="form-control form-control-sm  form-control-day" >
                                   <% for (int i = 1; i <=30 ; i++)
                                   { %>
                                          <option><%=i%></option>
                                   <% } %>
                            </select>
                            <select class="form-control form-control-sm form-control-day">
                                <% for (int i = 1; i <=12 ; i++)
                                { %>
                                    <option><%=i%></option>
                                <% } %>
                            </select>
                            <select class="form-control form-control-sm form-control-day">
                                <% for (int i = 1900; i <=2024 ; i++)
                                { %>
                                    <option><%=i%></option>
                                <% } %>
                            </select>


                        </div>



                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-form-user">Sửa Hồ Sơ</button>

                        </div>
                    </form>

                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-btn-key">
                <div class="list-btn-key">
                    <a href="/Enterkey.jsp" style="text-align:center;padding: 8px; width: 100px; height: 40px; color: white; background: #cc0c2c; border-radius: 5px; font-weight: bold; "  >Thêm Khóa</a>
                    <button type="button" class="btn btn-primary  btn-form-use btn-create-key">Tạo Khóa</button>
                    <button type="button" class="btn btn-primary  btn-form-use btn-block-key"
                           >Vô Hiệu Khóa</button>
                </div>
                <%String title = (String) request.getAttribute("title");%>
                <div class="title-key">
                    <%=title%>
                </div>
            </div>

        </div>
    </div>
</main>

<!--
MODAL
-->
<div class="modal fade form-show" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>


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
        var titleHtml = $(".title-key");

        jQuery(".btn-create-key").click(function () {

            swal({
                title: "Cảnh báo",

                text: "Bạn có muôn tạo khóa không?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            url: '/createKey',
                            type: 'post',
                            cache: false,

                            success: function (data) {
                                titleHtml.html("Tình Trạng Khóa:Bạn đã có khóa")
                                swal(data, {

                                });

                            },
                            error: function () {
                                alert("error");
                            }
                        });


                    }
                });
        });
    });

    jQuery(function () {
        jQuery(".btn-block-key").click(function () {
            swal({
                title: "Thông báo",

                text: "Bạn có chắc chắn là muốn vô hiệu khóa này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {


                        $.ajax({
                            url: '/BlockKey',
                            type: 'post',
                            cache: false,


                            success: function (data) {
                                titleHtml.html("Tình Trạng Khóa:Bạn chưa có khóa")
                                swal(data, {

                                });
                            },
                            error: function () {
                                alert("error");
                            }

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