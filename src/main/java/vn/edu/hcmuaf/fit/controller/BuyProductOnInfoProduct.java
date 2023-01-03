package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyProductOnInfoProduct", value = "/BuyProductOnInfoProduct")
public class BuyProductOnInfoProduct extends HttpServlet {
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
            List<Cart> listCart = CartService.getAllCartByIDUser((int)idUser);
            request.setAttribute("listCart",listCart);
            CartService.addCart(idUser,idProduct,quatity);
            CartService.UpdateCartIsCheckByIDCart(idProduct,idUser,true);
            response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT );
            response.setHeader("Location","http://localhost:8080/LoadCart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
