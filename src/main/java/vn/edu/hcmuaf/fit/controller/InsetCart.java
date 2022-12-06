package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsetCart", value = "/InsetCart")
public class InsetCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session = request.getSession();
           Integer idUser = (Integer) session.getAttribute("idUser");

           Integer idProduct = Integer.valueOf(request.getParameter("idProductCart"));


           Integer idInfoProduct = (Integer) session.getAttribute("idInfoProduct");

           if(idUser == null){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
           }else {

               CartService.addCart(idUser,idProduct,1);
               if(idInfoProduct !=null){

                   response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT );
                   response.setHeader("Location","http://localhost:8080/Product?id="+ idInfoProduct);

               }
               request.getRequestDispatcher("index.jsp").forward(request,response);
           }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
