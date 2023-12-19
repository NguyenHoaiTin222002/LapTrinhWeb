package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.service.BillService;
import vn.edu.hcmuaf.fit.service.DSAKeyService;
import vn.edu.hcmuaf.fit.uilt.DSA;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CheckTheBillAdmin", value = "/CheckTheBillAdmin")
public class CheckTheBillAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBill =  Integer.valueOf(request.getParameter("idBill"));
        int idUser =  Integer.valueOf(request.getParameter("idUser"));
        Bill bill = BillService.getBillidBill(idBill);
        DSAKey dsaKey =  DSAKeyService.getKeycheckBill(bill.getIdUser(), String.valueOf(bill.getDayBooking()));
        DSA dsa = new DSA();
        String text = Fomat.getStringBil(bill.getFullName(),bill.getPhone(),bill.getAddress(),bill.getDescription(), String.valueOf(bill.getPrice()));
        try {
            dsa.setPublicKey(dsa.stringToPublicKey(dsaKey.getPublicKey()));
            boolean result =dsa.decrypt(bill.getHash(),text);
            response.setContentType("text/plain");
            response.getWriter().write(String.valueOf(result));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
