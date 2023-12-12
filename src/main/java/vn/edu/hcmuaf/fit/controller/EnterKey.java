package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.DSAKeyService;
import vn.edu.hcmuaf.fit.uilt.DSA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Enterkey", value = "/Enterkey")
public class EnterKey extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");
        boolean isExistKey = DSAKeyService.checkKeyByisUser(idUser);
        if(!isExistKey){
            String ipPrivateKey = request.getParameter("ipprKey");
            String ipPublicKey =request.getParameter("ipplKey");
            DSA dsa = new DSA();
            try {
                if(dsa.checkKeyPairMatch(dsa.stringToPrivateKey(ipPrivateKey), dsa.stringToPublicKey(ipPublicKey))){
                   DSAKeyService.insertKey(idUser,ipPrivateKey, ipPublicKey);
                    request.setAttribute("title","Tình Trạng Khóa:Bạn đã có khóa");
                   request.getRequestDispatcher("user.jsp").forward(request,response);

                }else {
                    request.setAttribute("err","2 khóa không cùng một khóa");
                    request.getRequestDispatcher("Enterkey.jsp").forward(request,response);


                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }


        }else {
            request.setAttribute("err","Người dùng đã có khóa hãy vô hiệu khóa củ mới nhập khóa mới được");
            request.getRequestDispatcher("Enterkey.jsp").forward(request,response);

        }

    }

}
