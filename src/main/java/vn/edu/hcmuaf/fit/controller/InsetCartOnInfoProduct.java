package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsetCartOnInfoProduct", value = "/InsetCartOnInfoProduct")
public class InsetCartOnInfoProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");

        Integer idProduct = Integer.valueOf(request.getParameter("idProductCart"));
        Integer quatity = Integer.valueOf(request.getParameter("quatity"));

        Integer idInfoProduct = (Integer) session.getAttribute("idInfoProduct");
        System.out.println(Integer.parseInt(request.getParameter("quatity")));
        if(idUser == null){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
        }else {
            CartService.addCart(idUser,idProduct,quatity);

            request.getRequestDispatcher("product.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
