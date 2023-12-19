<%@ page import="vn.edu.hcmuaf.fit.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 05/12/2022
  Time: 9:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) request.getSession().getAttribute("User");%>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%=user.getImg()%>" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b><%=user.getFullName()%></b></p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item active" href="/Profile"><i style="font-size: 18px;" class='app-menu__icon  fas fa-user-tie'></i><span
                class="app-menu__label ">Hồ sơ</span></a></li>
        <li><a class="app-menu__item " href="/LoadBillUser"><i style="font-size: 18px;" class='app-menu__icon  fas fa-file-invoice-dollar'></i>
            <span class="app-menu__label">Hóa đơn</span></a></li>
        <li><a class="app-menu__item" href="table-data-table.jsp"><i class='app-menu__icon bx bx-id-card'></i>
            <span class="app-menu__label">Quản lý nhân viên</span></a></li>
        <li><a class="app-menu__item" href="table-data-kh.jsp"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item" href="table-data-product.jsp"><i class='app-menu__icon bx bx-purchase-tag-alt'></i>
            <span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="/LoadBillAdmin"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>

    </ul>
</aside>
