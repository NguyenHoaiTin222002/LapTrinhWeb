package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Category;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.DSAKeyService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.uilt.DSA;
import vn.edu.hcmuaf.fit.uilt.Email;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "createKey", value = "/createKey")
public class createKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("idUser");
        User user = (User) session.getAttribute("User");
        boolean isExistKey = DSAKeyService.checkKeyByisUser(idUser);
        if(!isExistKey){
            try {
                DSA dsa = new DSA();
                dsa.genkey();
                String publicKey = dsa.publicKeyToString(dsa.getPublicKey());
                String privateKey = dsa.privateKeyToString(dsa.getPrivateKey());
                DSAKeyService.insertKey(idUser,publicKey,privateKey);
                Email.sendMail(user.getEmail(), "Khóa của bạn ",privateKey);

                response.setContentType("text/plain");
                response.getWriter().write("Tạo khóa thành công");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }else {
            response.setContentType("text/plain");
            response.getWriter().write("Người dùng đã có khóa xin vô hiệu khóa cửu mới tạo khóa mới");

        }



    }
}
