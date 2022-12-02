package vn.edu.hcmuaf.fit.controller;

import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpPassword", value = "/UpPassword")
public class UpPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pass = (String) session.getAttribute("UserPassword");
        Integer idUser = (Integer) session.getAttribute("idUser");

        String passOld = request.getParameter("passOld");
        String passNew = request.getParameter("passNew");
        String passNewReset = request.getParameter("passNewReset");

        String md5Hex = DigestUtils.md5Hex(passOld).toUpperCase();
        String md5HexPass = DigestUtils.md5Hex(passNew).toUpperCase();

        if(!pass.trim().equals(md5Hex)){
            request.setAttribute("err","Nhập Mật khẩu sai");
            request.getRequestDispatcher("forgot_upPassword.jsp").forward(request,response);
        }
        if(!passNewReset.equals(passNew)){
            request.setAttribute("err","Nhập lại mật khẩu mới không đúng");
            request.getRequestDispatcher("forgot_upPassword.jsp").forward(request,response);
        }
        UserService.updatePassWord(idUser,md5HexPass);
        session.setAttribute("UserPassord",md5HexPass);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
