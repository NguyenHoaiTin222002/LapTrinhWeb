package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Category;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "cateControl", value = "/cate-control")
public class cateControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateID = request.getParameter("id");
        int id;
        if(cateID == null){
            id=0;
        }else{
            id = Integer.parseInt(cateID);
        }

        List<Product> list1 =ProductService.getByCateId(id);
        int page , numberPage=20;
        int size = list1.size();
        int num=(size%20==0 ?(size/20):((size/20)+1));
        String xPage=request.getParameter("page");

        if(xPage==null){
            page=1;
        }else{
            page=Integer.parseInt(xPage);
        }

        int start, end;
        start= (page-1)*numberPage;
        end = Math.min(page*numberPage, size);
        List<Product> list= ProductService.getListByPage(list1,start,end);
        CategoryService cates= new CategoryService();
        List<Category> listC = cates.getAllCatery();


        request.setAttribute("listc",listC);
        request.setAttribute("listp",list);
        request.setAttribute("page",page);
        request.setAttribute("num",num);
        request.setAttribute("id",id);
        request.getRequestDispatcher("products.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
