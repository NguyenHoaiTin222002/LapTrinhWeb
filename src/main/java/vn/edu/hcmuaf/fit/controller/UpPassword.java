package vn.edu.hcmuaf.fit.controller;

import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.uilt.Check;
import vn.edu.hcmuaf.fit.uilt.EnCode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

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

//        String md5Hex = EnCode.getEncryptString(passOld);
        String md5HexPass = EnCode.getEncryptString(passNew);
        Map<String,String> checkUpPassWord = Check.checkUpPassWord(pass,passOld,passNew,passNewReset);
        if(checkUpPassWord.size()>0){
            request.setAttribute("passOld",passOld);
            request.setAttribute("passNew",passNew);
            request.setAttribute("passNewReset",passNewReset);

            request.setAttribute("isErr",true);
            request.setAttribute("err",checkUpPassWord);
            request.getRequestDispatcher("forgot_upPassword.jsp").forward(request,response);
        }else {
            UserService.updatePassWord(idUser,md5HexPass);
            session.setAttribute("UserPassord",md5HexPass);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }


    }
}
