package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.service.DSAKeyService;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Profile", value = "/Profile")
public class Profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");
        boolean isExistKey = DSAKeyService.checkKeyByisUser(idUser);
        String text = "";
        if(isExistKey){
            text = "Tình Trạng Khóa:Bạn đã có khóa";
        }else {
            text = "Tình Trạng Khóa:Bạn chưa có khóa";
        }

        request.setAttribute("title",text);
        request.getRequestDispatcher("user.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
