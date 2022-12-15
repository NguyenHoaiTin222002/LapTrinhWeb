package vn.edu.hcmuaf.fit.controller;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UploadImgAvatar", value = "/UploadImgAvatar")
public class UploadImgAvatar extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        InputStream inputStream = null;
        Part filePart = request.getPart("userCoverPhoto");
        if(filePart != null){
            inputStream = filePart.getInputStream();
        }
        User user = (User)session.getAttribute("User");
        boolean result = UserService.updateAvatar(inputStream, user.getIdUser());
        if(!result){
            session.setAttribute("err","Invalid file type");
        } else{
            session.setAttribute("err","");
        }
        response.sendRedirect("UpdateFileUser");
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
