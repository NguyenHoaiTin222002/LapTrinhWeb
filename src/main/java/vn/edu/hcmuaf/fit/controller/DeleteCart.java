package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCart", value = "/DeleteCart")
public class DeleteCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Integer idUser = (Integer) session.getAttribute("idUser");
        Integer idCart = Integer.valueOf(request.getParameter("idDeleteCart"));

        //Chuyển Trang
        Integer idInfoProduct = (Integer) session.getAttribute("idInfoProduct");


        CartService.DeleteCart(idCart);
        if(idInfoProduct !=null){
            response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT );
            response.setHeader("Location","http://localhost:8080/Product?id="+ idInfoProduct);
        }
        request.getRequestDispatcher("index.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
