package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "IsCheckCart", value = "/IsCheckCart")
public class IsCheckCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Boolean isCheck = Boolean.valueOf(request.getParameter("isCheck"));
        Integer idCart = Integer.valueOf(request.getParameter("idCart"));

            CartService.UpdateCartIsCheckByIDCart(idCart,isCheck);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
