package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateFileUser", value = "/UpdateFileUser")
public class UpdateFileUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = UserService.getAllUser();
        request.setAttribute("User", users);
        RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action != null && action.equals("update-profile")) {
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String birthday = request.getParameter("birthday");

            int idUser = ((User) session.getAttribute("User")).getIdUser();
            String imgs = ((User) session.getAttribute("User")).getImg();
            int status = ((User) session.getAttribute("User")).getStutas();
            User user = new User(fullName, address, email, phone, imgs, gender, birthday, idUser);
            session.setAttribute("User", UserService.updateUser(user));

        }
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }
}