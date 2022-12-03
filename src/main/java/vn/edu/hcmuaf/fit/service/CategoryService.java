package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Category;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {

    public static List<Category> getAllCatery(){
        List<Category> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =   statement.executeQuery("SELECT idCategory, nameCategory FROM category");
                while (rs.next()){

                     Category category = new Category(rs.getInt("idCategory"),rs.getString("nameCategory"));
                     list.add(category);
                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return list;
    }

    public static void main(String[] args) {

    }
}
