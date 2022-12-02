package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Img;
import vn.edu.hcmuaf.fit.service.ImgService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product", value = "/Product")
public class Product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Integer id = Integer.valueOf(request.getParameter("id"));
       HttpSession session = request.getSession();
       List<Img> listImg = ImgService.getListImgByIdProduct(id);
        vn.edu.hcmuaf.fit.model.Product product = ProductService.getProductById(id);
        request.setAttribute("listImg",listImg);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
