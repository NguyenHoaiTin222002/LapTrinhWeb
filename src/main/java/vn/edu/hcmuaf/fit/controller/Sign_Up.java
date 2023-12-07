package vn.edu.hcmuaf.fit.controller;

import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.model.Img;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.*;
import vn.edu.hcmuaf.fit.uilt.Check;
import vn.edu.hcmuaf.fit.uilt.EnCode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Sign_Up", value = "/Sign_Up")
public class Sign_Up extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer gender = Integer.valueOf(request.getParameter("gender")) ;
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String address  = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");

        Map<String,String> checkSignUp = Check.checkSignUpMap(fullname,userName,password,email,phone,address);

        HttpSession  session = request.getSession();
        Integer idInfoProduct = (Integer) session.getAttribute("idInfoProduct");
        String md5Hex =  EnCode.checkksum(password.trim());
        birthday = Check.UpDate(birthday);
        if(checkSignUp.size()==0&&UserService.insertUser(userName,md5Hex,fullname,email,phone,address,gender,birthday)){
            // câu insert

                User user = UserService.getUserLogin(userName);
                Role role = RoleService.getRoleByName("Khách Hàng");
                InfoRoleService.insertInfoRoleKH(user.getIdUser(),role.getIdRole());

                session.setAttribute("idUser",user.getIdUser());
                session.setAttribute("UserPassword",user.getPassword());
                session.setAttribute("imgUser",user.getImg());
                session.setAttribute("fullName",user.getFullName());

                request.getRequestDispatcher("index.jsp").forward(request,response);

        }else {
            request.setAttribute("gender",gender);
            request.setAttribute("userName",userName);
            request.setAttribute("password",password);
            request.setAttribute("email",email);
            request.setAttribute("fullname",fullname);
            request.setAttribute("phone",phone);
            request.setAttribute("birthday",request.getParameter("birthday"));
            request.setAttribute("address",address);

            request.setAttribute("isErr",true);
            request.setAttribute("err",checkSignUp);
            request.getRequestDispatcher("sign_up.jsp").forward(request,response);
        }


    }
}
