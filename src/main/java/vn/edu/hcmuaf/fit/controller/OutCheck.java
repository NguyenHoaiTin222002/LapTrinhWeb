package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.BillService;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.InfoBillService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.uilt.Email;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OutCheck", value = "/OutCheck")
public class OutCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession  session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String description = request.getParameter("decription");
        String[] contentBill =  {fullName,phone,address,description};

        if(idUser == null){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
        }else {
            User user = (User) session.getAttribute("User");


            double price = CartService.totalBill(idUser);
            String textHtml = Fomat.getStringHTML(fullName,phone,address,description,price,idUser);
            Email.sendMailHTML(user.getEmail(),"Hóa đơn",textHtml);
            session.setAttribute("contentBill",contentBill);
            List<Cart> listCart = CartService.getAllCartByIDUser((int)idUser);
            request.setAttribute("listCart",listCart);
            request.setAttribute("mess","hóa đơn gởi đến email của bạn xin hãy xác nhận");
            request.getRequestDispatcher("cart.jsp").forward(request,response);


        }
    }
}
