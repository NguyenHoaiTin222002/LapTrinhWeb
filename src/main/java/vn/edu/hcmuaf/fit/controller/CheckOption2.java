package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.BillService;
import vn.edu.hcmuaf.fit.service.DSAKeyService;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.uilt.DSA;
import vn.edu.hcmuaf.fit.uilt.Email;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

@WebServlet(name = "CheckOption2", value = "/CheckOption2")
public class CheckOption2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBill =  Integer.valueOf(request.getParameter("idBill"));
        Bill bill = BillService.getBillidBill(idBill);
        int idUser = bill.getIdUser();
        User user = UserService.getEmailByIdUser(idUser);
        String option = Fomat.getStringOption(bill.getFullName(), bill.getPhone(), bill.getAddress(), bill.getPrice(), "" + bill.getDayBooking(), "Đơn hàng của bạn sẽ được hủy! ");
        try {
            Email.sendMailHTML(user.getEmail(), " Hủy đơn hàng! ", option );
            BillService.deleteBill(idBill);
            response.setContentType("text/plain");
            response.getWriter().write(String.valueOf(" Hủy đơn hàng thành công."));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
