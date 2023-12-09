package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.service.BillService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadBillAdmin", value = "/LoadBillAdmin")
public class LoadBillAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Bill> listBill = BillService.loadBill();
        request.setAttribute("listBill",listBill);
        request.getRequestDispatcher("table-data-bill.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
