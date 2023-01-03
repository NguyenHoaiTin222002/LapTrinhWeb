package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.service.BillService;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.InfoBillService;
import vn.edu.hcmuaf.fit.service.ProductService;

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
        Integer idUser = (Integer) request.getSession().getAttribute("idUser");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String description = request.getParameter("decription");

        if(idUser == null){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
        }else {
            double price = CartService.totalBill(idUser);
             boolean isErr =  BillService.insertBill(idUser,fullName,phone,address,price,description) ;
            if(isErr){

                int idBill = BillService.getIdBillByIdUser(idUser);
                List<Cart> listCartIsCheck = CartService.GetAllCartByidUserAndIsCheck(idUser,true);
                for (Cart item: listCartIsCheck
                ) {

                    if(ProductService.UpdateAmountProductByidProduct(item.getIdProduct(),item.getAmount())){
                        InfoBillService.inSertInfoBill(idBill,item.getIdProduct(),item.getAmount());
                    }else {
                        isErr = false;
                    }
                }
                String mess = "";
                if(isErr){
                    mess = "Mua Hàng Thành Công";
                    CartService.deleteAllByidUserAndIsCheck(idUser,true);
                }else {
                    mess = "Mua Hàng Thất Bại Xin Hãy Thử Lại";
                }

                List<Cart> listCart = CartService.getAllCartByIDUser((int)idUser);
                request.setAttribute("listCart",listCart);
                request.setAttribute("mess",mess);
                request.getRequestDispatcher("cart.jsp").forward(request,response);
            }

        }
    }
}
