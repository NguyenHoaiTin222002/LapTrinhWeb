package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.service.DSAKeyService;
import vn.edu.hcmuaf.fit.uilt.DSA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "BlockKey", value = "/BlockKey")
public class BlockKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int idKey = Integer.valueOf(request.getParameter("idKey"));
//        Date endDate = Date.valueOf(request.getParameter("endDate"));
//
//        DSAKeyService.updateDSAKey(idKey, endDate);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");
        DSAKey dsaKey = DSAKeyService.getKeyidUser(idUser);
        if(dsaKey != null && dsaKey.getIdKey() > 0){
            DSAKeyService.updateDSAKey(dsaKey.getIdKey());
            response.setContentType("text/plain");
            response.getWriter().write("Đã vô hiệu khóa thành công!");
        }else {
            response.setContentType("text/plain");
            response.getWriter().write("Bạn không có khóa để chặn");
        }
    }
}
