package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateCart", value = "/UpdateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idCart = Integer.valueOf(request.getParameter("idCart"));
        Integer quatity = Integer.valueOf(request.getParameter("quatity"));
        Double price = Double.valueOf(request.getParameter("price"));

        CartService.UpdateCart(idCart,quatity);
        PrintWriter pr = response.getWriter();
        String total = Fomat.fomatCurrency((price*quatity));
        pr.print(total);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
