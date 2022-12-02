package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;

import vn.edu.hcmuaf.fit.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public static List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =
                        statement.executeQuery("SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                                ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct where i.idImg%4=0 ");
                while (rs.next()){
                Product product = new Product();
                product.setIdProduct(rs.getInt("idProduct"));
                product.setNameProduct(rs.getString("nameProduct"));
                product.setPrice(rs.getDouble("price"));
                product.setAmountProduct(rs.getInt("amountProduct"));
                product.setAmountSoldProduct(rs.getInt("amountSoldProduct"));
                product.setNewProduct(rs.getInt("new"));
                product.setSale(rs.getInt("sale"));
                product.setProducer(rs.getString("producer"));
                product.setBlockProduct(rs.getInt("blockProduct"));
                product.setDiscription(rs.getString("discription"));
                product.setImg(rs.getString("ImgLink"));
                list.add(product);

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
       List<Product> list = getAllProduct();

    }

}