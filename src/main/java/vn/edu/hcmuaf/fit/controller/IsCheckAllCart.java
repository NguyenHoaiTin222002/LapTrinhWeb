package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "IsCheckAllCart", value = "/IsCheckAllCart")
public class IsCheckAllCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idUser = (Integer) request.getSession().getAttribute("idUser");
        Boolean isCheck = Boolean.valueOf(request.getParameter("isCheck"));
        CartService.UpdateCartIsCheckAllByIdUser(idUser,isCheck);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
