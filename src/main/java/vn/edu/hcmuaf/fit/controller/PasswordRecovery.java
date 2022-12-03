package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PasswordRecovery", value = "/PasswordRecovery")
public class PasswordRecovery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        if(UserService.passwordRecovery(email)){
            request.getRequestDispatcher("sign_in.jsp").forward(request,response);
        }else {
            request.setAttribute("err","Nhập email không đúng");
            request.getRequestDispatcher("forgot_pw.jsp").forward(request,response);

        }
    }
}
