<%--
  Created by IntelliJ IDEA.
  User: Ngô Chí Thông
  Date: 12/14/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Hóa đơn | Quản trị Admin</title>
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
      <li class="breadcrumb-item active"><a href="#"><b>Danh sách Hóa Đơn</b></a></li>
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
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <th>ID hóa đơn</th>
              <th>Tên khách hàng</th>
              <th>SĐT</th>
              <th>Địa chỉ</th>
              <th>Tổng tiền</th>
              <th>Tình trạng</th>
              <th>Thời Gian Đặt</th>
              <th>Tính năng</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>312.000 đ</td>
              <td><span  class="badge bg-warning">Đang giao hàng</span></td>
              <td>02/11/2022</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <a href="infoBill.html">   <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></a>
              </td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>61.000 đ</td>
              <td><span class="badge bg-danger">Đã hủy</span></td>
              <td>20/10/2022</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>435.000 đ</td>
              <td><span class="badge bg-success">Hoàn thành</span></td>
              <td>15/07/2021</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>37.000 đ</td>
              <td><span class="badge bg-info">Chờ thanh toán</span></td>
              <td>05/01/2021</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>19.770.000 đ</td>
              <td><span class="badge bg-success">Hoàn thành</span></td>
              <td>20/11/2020</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></td>
            </tr>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td>MD0837</td>
              <td>Nguyễn Hoài Tín</td>
              <td>0354925338</td>
              <td>KP Đông Hòa, Tx. Dĩ An, Bình Dương</td>
              <td>180.000 đ</td>
              <td><span class="badge bg-danger">Đã hủy</span></td>
              <td>27/12/2019</td>

              <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                <button class="btn btn-primary btn-sm edit" type="button" title="Xem"><i class="fas fa-eye"></i></button></td>
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
<script src="./assets/js/jquery-3.2.1.min.js"></script>
<script src="./assets/js/bootstrap1.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="./assets/js/main1.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

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

        text: "Bạn có chắc chắn là muốn xóa hóa đơn này?",
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
