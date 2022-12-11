package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Cart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    public static List<Cart> getAllCartByIDUser(int id){
        List<Cart> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =   statement.executeQuery("SELECT `IdCart`, `idUser`, `idProduct`, `amount` FROM `cart` where idUser = " +  id);
                while (rs.next()){
                    Cart cart = new Cart();
                    cart.setIdCart(rs.getInt("IdCart"));
                    cart.setIdUser(rs.getInt("idUser"));
                    cart.setIdProduct(rs.getInt("idProduct"));
                    cart.setAmount(rs.getInt("amount"));
                    list.add(cart);
                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return list;
    }
    public static Cart amountCartbyIdUserandidProduct(int idUser,int idProduct){
        Cart cart = new Cart();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =   statement.executeQuery("SELECT `IdCart`, `idUser`, `idProduct`, `amount` FROM `cart` where idUser = " +  idUser + " and idProduct =" + idProduct );
                while (rs.next()){

                    cart.setIdCart(rs.getInt("IdCart"));
                    cart.setIdUser(rs.getInt("idUser"));
                    cart.setIdProduct(rs.getInt("idProduct"));
                    cart.setAmount(rs.getInt("amount"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return cart;

    }

    public static void addCart(int idUser,int idProduct, int amount){
        Statement statement = DBConnect.getInstance().get();
        Cart cart = amountCartbyIdUserandidProduct(idUser,idProduct);
        if(statement != null ){
            try {

                if(cart.getIdProduct()!=0){

                    String sql = "UPDATE `cart` SET `amount`= ? WHERE idUser = ? and idProduct = ?";
                    PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                    ps.setInt(1,amount   +   cart.getAmount());
                    ps.setInt(2,idUser);
                    ps.setInt(3,idProduct);
                    ps.executeUpdate();

                }else {
                    String sql = "INSERT INTO `cart`(`IdCart`, `idUser`, `idProduct`, `amount`) VALUES (null,?,?,?)";
                    PreparedStatement ps = statement.getConnection().prepareStatement(sql);

                    ps.setInt(1, idUser);
                    ps.setInt(2, idProduct);
                    ps.setInt(3, amount);
                    ps.executeUpdate();
                }



            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }
    public static void DeleteCart(int idCart){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "DELETE FROM `cart` WHERE IdCart = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idCart);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }
    public static void UpdateCart(int idCart,int quatity){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "UPDATE `cart` set amount = ? WHERE IdCart = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,quatity);
                ps.setInt(2,idCart);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }

}
