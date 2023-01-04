package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UploadImgAvatar", value = "/UploadImgAvatar")
public class ProcessImg extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        byte[] content = UserService.getImgageData(idUser);
        response.setContentType("image/jpeg");
        response.setContentLength(content.length);
        response.getOutputStream().write(content);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}

