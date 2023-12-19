package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.*;
import vn.edu.hcmuaf.fit.uilt.DSA;
import vn.edu.hcmuaf.fit.uilt.Email;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckOutBill", value = "/CheckOutBill")
public class CheckOutBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession  session = request.getSession();
        String priKey = request.getParameter("priKey");
        Integer idUser = (Integer) session.getAttribute("idUser");
        String[] contentBill = (String[]) session.getAttribute("contentBill");

        if(idUser == null){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
        }else {
         DSAKey dsaKey =  DSAKeyService.getKeyidUser(idUser);
         if(priKey.trim().equals(dsaKey.getPrivateKey())){

             try {
                 DSA dsa = new DSA();
                 dsa.setPrivateKey(dsa.stringToPrivateKey(priKey.trim()));
                 String textPlan =  Fomat.getStringBil(contentBill[0],contentBill[1],contentBill[2],contentBill[4],contentBill[3]);
                 byte[] hash = dsa.encrypt(textPlan);

                 boolean  status =
                         BillService.insertBill(idUser,contentBill[0],contentBill[1],contentBill[2],
                                 Double.parseDouble(contentBill[3]),contentBill[4],hash) ;
                 if(status){
                     int idBill = BillService.getIdBillByIdUser(idUser);
                     List<Cart> listCartIsCheck = CartService.GetAllCartByidUserAndIsCheck(idUser,true);
                     boolean isErr = false;
                     for (Cart item: listCartIsCheck
                     ) {

                         if(ProductService.UpdateAmountProductByidProduct(item.getIdProduct(),item.getAmount())){
                             InfoBillService.inSertInfoBill(idBill,item.getIdProduct(),item.getAmount());

                         }else {
                             isErr = true;
                         }
                     }
                     if(!isErr){
                         CartService.deleteAllByidUserAndIsCheck(idUser,true);
                         List<Bill> listBill = BillService.loadBillByIdUser(idUser);
                         request.setAttribute("listBill",listBill);
                         request.getRequestDispatcher("table-data-bill.jsp").forward(request,response);
                     }

                 }else {
                     request.setAttribute("err","Quá trình thanh toán thật bại hãy thử lại");
                     request.getRequestDispatcher("checkOutByPritaveKey.jsp").forward(request,response);
                 }
             } catch (Exception e) {
                 throw new RuntimeException(e);
             }



         }else{
             request.setAttribute("err","Nhập khóa không đúng hoặc khóa hết hạn");
             request.getRequestDispatcher("checkOutByPritaveKey.jsp").forward(request,response);
         }
        }
    }
}
