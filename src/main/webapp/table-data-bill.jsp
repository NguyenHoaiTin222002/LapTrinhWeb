<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Bill" %>
<%@ page import="vn.edu.hcmuaf.fit.uilt.Fomat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>Đơn hàng</title>
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
<% List<Bill> listBill = (List<Bill>) request.getAttribute("listBill");%>
<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
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
  <!-- Sidebar menu-->
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
              <tbody
              <%for (Bill item: listBill) { %>

              <tr>
                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                <td><%=item.getIdBill()%></td>
                <td><%=item.getFullName()%></td>
                <td><%=item.getPhone()%></td>
                <td><%=item.getAddress()%></td>
                <td><%=Fomat.fomatCurrency(item.getPrice())%></td>
                <td><span class="badge <%=item.getBlockBill()==1?"bg-warning":"bg-success"%> "><%=item.getBlockBill()==0?"Đang giao hàng":"Hoàn thành"%></span></td>
                <td><%=item.getDayBooking()%></td>

                <td>
                  <button class="btn btn-primary btn-sm trash" data-id="" type="button" title="Xóa"><i class="fas fa-trash-alt"></i> </button>
                  <a href="ifbill?idBill=<%=item.getIdBill()%>">   <button class="btn btn-primary btn-sm edit" type="button" title="Xem" ><i class="fas fa-eye"></i></button></a>
                  <button class="btn btn-primary btn-sm edit btn-edit" type="button" title="Sửa"
                          data-toggle="modal" data-target="#ModalUP" data-name="<%=item.getFullName()%>" data-phone="<%=item.getPhone()%>"
                          data-idbill="<%=item.getIdBill()%>" data-address="<%=item.getAddress()%>"
                          data-price="<%=item.getPrice()%>" data-status="<%=item.getBlockBill()%>"><i class="fas fa-edit"></i>
                  </button>
                  <button   data-idbill="<%=item.getIdBill()%>"  data-status="<%=item.getBlockBill()%>" data-iduser="<%=item.getIdUser()%>" class="btn btn-primary btn-sm btn-check" type="button" title="Kiểm tra"><i class="fas fa-check"></i></button>
                </td>
              </tr>
               <%}%>

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
                <h5>Chỉnh sửa thông tin đơn hàng</h5>
              </span>
            </div>
          </div>
          <form action="/UpdateBill" method="post">
            <div class="row">
              <div class="user-form-layout">
                <div class="form-group col-md-6">
                  <label class="control-label">ID hóa đơn</label>
                  <input style="width: 200px" class="form-control" type="text" name="idbill" id="idbill" readonly >
                </div>
                <div class="form-group col-md-6">
                  <label class="control-label">Tên khách hàng</label>
                  <input style="width: 210px" class="form-control" type="text" name="name" id="name" >
                </div>
              </div>

              <div class="form-group  col-md-6">
                <label class="control-label">Số điện thoại</label>
                <input style="width: 450px" class="form-control" type="text" name="phone" id="phone">
              </div>

              <div class="user-form-layout">
                <div class="form-group col-md-6">
                  <label class="control-label">Tổng tiền</label>
                  <input style="width: 200px" class="form-control" type="text" name="price" id="price">
                </div>
                <div class="form-group  col-md-6">
                  <label for="exampleSelect1" class="control-label">Tình trạng</label>
                  <select style="width: 210px" class="form-control" id="exampleSelect1" name="blockBill">
                    <option value="0">Huỷ đơn</option>
                    <option value="1">Đang xử lý</option>
                    <option value="2">Đang giao hàng</option>
                    <option value="3">Đã hoàn thành</option>
                  </select>
                </div>
              </div>

              <div class="form-group col-md-5">
                <label class="control-label">Địa chỉ</label>
                <input style="width: 450px" class="form-control" type="text" name="address" id="address">
              </div>
            </div>
            <BR>
            <button class="btn btn-save" type="submit">Lưu lại</button>
            <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
            <BR>
          </form>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>

  <script src="./assets/js/bootstrap1.min.js"></script>
  <script src="./assets/js/jquery-3.2.1.min.js"></script>
  <script src="./assets/js/popper.min.js"></script>
  <script src="./assets/js/bootstrap.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

  <script src="./assets/js/main1.js"></script>

  <!-- Page specific javascripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <!-- Data table plugin-->
  <script type="text/javascript" src="./assets/js/plugins/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="./assets/js/plugins/dataTables.bootstrap.min.js"></script>
  <script type="text/javascript" src="./assets/js/plugins/chart.js"></script>
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <script>
    function deleteRow(r) {
      var i = r.parentNode.parentNode.rowIndex;
      console.log( document.getElementById("sampleTable"));
      document.getElementById("sampleTable").deleteRow(i);
    }
    jQuery(function () {
      jQuery(".trash").click(function () {
        swal({
          title: "Cảnh báo",
         
          text: "Bạn có muốn hủy đơn hàng này?",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
          .then((willDelete) => {
            if (willDelete) {

              swal("Đã xóa thành công.!", {
              });
            }
          });
      });
      jQuery(".btn-check").click(function () {
        let idBill =    $(this).data("idbill");
        let idUser =  $(this).data("iduser");
        let status =  $(this).data("status");


        swal({
          title: "Cảnh báo",

          text: "Bạn có muốn kiểm tra lại hóa đơn",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
                .then((check) => {
                  if (check) {
                    $.ajax({
                      url: '/CheckTheBillAdmin',
                      type: 'post',
                      cache: false,
                      data: { idBill:idBill , idUser:idUser} ,
                      success: function (data) {
                        if(data == "true") {
                          swal("Đơn hàng không bị chỉnh sửa", {
                          });
                        } else {
                          if(status === 3){
                            swal({
                              title: "Cảnh báo",

                              text: "Đơn hàng đã bị chỉnh sửa!/ Bạn có muốn hoàn tiền lại không?",
                              buttons: ["Hủy bỏ", "Đồng ý"],
                            })
                                  .then((option) => {
                                    if(option) {
                                      $.ajax({
                                        url: '/CheckOption1',
                                        type: 'post',
                                        cache: false,
                                        data: {idBill: idBill},
                                        success: function (data) {
                                          swal(data, {

                                          });
                                        }
                                      });
                                    }
                                  });

                          } else {
                            swal({
                              title: "Cảnh báo",

                              text: "Đơn hàng đã bị chỉnh sửa!" + " " +
                                      "Bạn có muốn hủy không?",
                              buttons: ["Hủy bỏ", "Đồng ý"],
                            })
                                    .then((option) => {
                                      if(option) {
                                        $.ajax({
                                          url: '/CheckOption2',
                                          type: 'post',
                                          cache: false,
                                          data: {idBill: idBill},
                                          success: function (data) {
                                            swal(data, {

                                            });
                                          }
                                        });
                                      }
                                    });
                          }

                        }
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
  <script>
    $(document).ready(function () {
      $('.btn-edit').on('click', function () {
        var buttonTextID = $(this).data("idbill");
        var inputID = $('#idbill');
        inputID.val(buttonTextID);

        var buttonTextPrice = $(this).data("price");
        var inputPrice = $('#price');
        inputPrice.val(buttonTextPrice);

        var buttonText = $(this).data("name");
        var inputName = $('#name');
        inputName.val(buttonText);

        var buttonTextPhone = $(this).data("phone");
        var inputPhone = $('#phone');
        inputPhone.val(buttonTextPhone);

        var buttonTextAddress = $(this).data("address");
        var inputAddress = $('#address');
        inputAddress.val(buttonTextAddress);

        var status = $(this).data("status");
        var selectValue = $('#exampleSelect1');
        selectValue.val(status);


      });
    });
  </script>
</body>

</html>