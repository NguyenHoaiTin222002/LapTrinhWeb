package vn.edu.hcmuaf.fit.controller;

//import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.model.Img;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.ImgService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             String userName = request.getParameter("username");
             String pass = request.getParameter("pass");
             HttpSession  session = request.getSession();
             Integer idInfoProduct = (Integer) session.getAttribute("idInfoProduct");

             User user = UserService.getUserLogin(userName);
             if(user.getPassword().trim().equals("HoaiTin")){

                 session.setAttribute("user",user);

                 request.getRequestDispatcher("index.jsp").forward(request,response);
             }else {
                 request.setAttribute("err","Tài khoản hoặc Mật khẩu bị sai");
                 request.getRequestDispatcher("sign_in.jsp").forward(request,response);

             }



    }
}
