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
                                ",p.discription,p.idCategory,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct where i.idImg%4=0 ");
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
                product.setIdCategory(rs.getInt("idCategory"));
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

    public static Product getProductById(int id){
        Product product = new Product();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =
                        statement.executeQuery("SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                                ",p.discription,p.idCategory,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0 and p.idProduct = " + id);
                while (rs.next()){

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
                    product.setIdCategory(rs.getInt("idCategory"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return product;
    }

    public static List<Product> getAllProductByIdCategory(int size, int idCaterogy,String status){
        List<Product> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "";
                int sta = 0;
                if(status == "new"){
                    sta =1;
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,p.idCategory,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0 and p.idCategory = ? and p.new = ? ORDER BY p.idProduct DESC LIMIT 0, ?" ;
                }else {
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,p.idCategory,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0 and p.idCategory = ? and p.sale != ? ORDER BY p.idProduct DESC LIMIT 0, ?" ;
                }
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idCaterogy);
                ps.setInt(2,sta);
                ps.setInt(3,size);
                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
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
                    product.setIdCategory(rs.getInt("idCategory"));
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
    public static List<Product>  getListByPage(List<Product> list, int start, int end){
        ArrayList<Product> arr= new ArrayList<>();
        for(int  i=start; i<end;i++){
            arr.add(list.get(i));
        }
        return arr;
    }

    //;
    public static boolean UpdateAmountProductByidProduct(int idProduct,int amount) {
        Statement statement = DBConnect.getInstance().get();
        if (statement != null) {
            try {
                String sql = "UPDATE `product` SET `amountProduct`= (amountProduct - ?) WHERE idProduct = ?";
                PreparedStatement ps = statement.getConnection().prepareStatement(sql);
                ps.setInt(1, amount);
                ps.setInt(2, idProduct);
                ps.executeUpdate();
                return true;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("lỗi kết nối");
        }
        return false;
    }


    public static List<Product> getByCateId(int id){
        List<Product> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql="SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                        ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct where i.idImg%4=0 and p.idCategory = ?";

                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,id);

                ResultSet rs = ps.executeQuery();
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
    public static List<Product> getAllProduct_sort(int id, String sort){
        List<Product> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "";
                int sta = 0;
                if(sort == "Giam dan"){
                    sta =0;
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0  ORDER BY p.price DESC " ;
                }else if (sort=="Tang dan"){
                    sta =1;
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0  ORDER BY p.price ASC " ;
                }else if (sort=="kytu-za") {
                    sta =2;
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0  ORDER BY p.nameProduct DESC " ;
                } else if (sort== "kytu-az") {
                    sta =3;
                    sql = "SELECT p.idProduct,p.nameProduct,p.price,p.amountProduct,p.amountSoldProduct,p.sale,p.new,p.producer,p.blockProduct" +
                            ",p.discription,i.ImgLink from product as p JOIN img as i on p.idProduct = i.IdProduct  where i.idImg%4=0  ORDER BY p.nameProduct ASC " ;

                }
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,id);
                ps.setInt(2,sta);

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
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





}
