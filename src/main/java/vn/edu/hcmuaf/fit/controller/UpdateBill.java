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

@WebServlet(name = "UpdateBill", value = "/UpdateBill")
public class UpdateBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Double price = Double.valueOf(request.getParameter("price"));
        Integer blockBill = Integer.valueOf(request.getParameter("blockBill"));
        Integer idBill = Integer.valueOf(request.getParameter("idbill"));
        BillService.updateBill(idBill,name,address,phone,price,blockBill);
        List<Bill> listBill = BillService.loadBill();
        request.setAttribute("listBill",listBill);
        request.getRequestDispatcher("table-data-bill.jsp").forward(request,response);

    }
}