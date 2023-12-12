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
                ResultSet rs =   statement.executeQuery("SELECT `IdCart`, `idUser`, `idProduct`, `amount`,`isCheck` FROM `cart` where idUser = " +  id);
                while (rs.next()){
                    Cart cart = new Cart();
                    cart.setIdCart(rs.getInt("IdCart"));
                    cart.setIdUser(rs.getInt("idUser"));
                    cart.setIdProduct(rs.getInt("idProduct"));
                    cart.setAmount(rs.getInt("amount"));
                    cart.setCheck(rs.getBoolean("isCheck"));
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
    public static Cart amountCartByIdUserAndIdProduct(int idUser,int idProduct){
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
        Cart cart = amountCartByIdUserAndIdProduct(idUser,idProduct);
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
                    String sql = "INSERT INTO `cart`(`IdCart`, `idUser`, `idProduct`, `amount`,`isCheck`) VALUES (null,?,?,?,?)";
                    PreparedStatement ps = statement.getConnection().prepareStatement(sql);

                    ps.setInt(1, idUser);
                    ps.setInt(2, idProduct);
                    ps.setInt(3, amount);
                    ps.setInt(4, 0);
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
    public static void UpdateCartIsCheckByIDCart(int idCart,boolean isCheck){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "UPDATE `cart` set isCheck = ? WHERE IdCart = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setBoolean(1,isCheck);
                ps.setInt(2,idCart);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public static void UpdateCartIsCheckByIDCart(int idProduct,int idUser,boolean isCheck){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "UPDATE `cart` set isCheck = ? WHERE idUser = ? and idProduct = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setBoolean(1,isCheck);
                ps.setInt(2,idUser);
                ps.setInt(3,idProduct);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public static void deleteAllByidUserAndIsCheck(int idUser,boolean isCheck){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "DELETE FROM `cart` WHERE idUser = ? and isCheck = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setBoolean(2,isCheck);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public static void UpdateCartIsCheckAllByIdUser(int idUser,boolean isCheck){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "UPDATE `cart` set isCheck = ? WHERE idUser = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setBoolean(1,isCheck);
                ps.setInt(2,idUser);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public static double totalBill(int idUser){
        Statement statement = DBConnect.getInstance().get();
         double total = 0;
        if(statement != null ){
            try {

                String sql = "SELECT sum((product.price - product.price*0.01*product.sale)*cart.amount) as total from cart JOIN product on product.idProduct = cart.idProduct WHERE cart.idUser = ? and cart.isCheck = true";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);

                ps.setInt(1,idUser);
                ResultSet rs = ps.executeQuery();

                while (rs.next()){
                    total = rs.getDouble("total");

                }

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return  total;
    }
    public static List<Cart> GetAllCartByidUserAndIsCheck(int idUser, boolean isCheck){
        List<Cart> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `IdCart`, `idUser`, `idProduct`, `amount`,`isCheck` FROM `cart` where idUser = ? and isCheck = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setBoolean(2,isCheck);
                ResultSet rs =   ps.executeQuery();
                while (rs.next()){
                    Cart cart = new Cart();
                    cart.setIdCart(rs.getInt("IdCart"));
                    cart.setIdUser(rs.getInt("idUser"));
                    cart.setIdProduct(rs.getInt("idProduct"));
                    cart.setAmount(rs.getInt("amount"));
                    cart.setCheck(rs.getBoolean("isCheck"));
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
    public static String getStringBill(int idUser){
        Statement statement = DBConnect.getInstance().get();
        StringBuffer sb = new StringBuffer();
        sb.append("        <ul style=\"list-style: none; padding: 0;\">\n" +
                "            <li style=\"display: flex; justify-content: space-between; font-weight: bold; margin: 10px 0;\">\n" +
                "                <div style=\"width: 200px;\">Tên sản phẩm</div>\n" +
                "                <div style=\"width: 200px; text-align: center;\">Số lượng</div>\n" +
                "                <div style=\"width: 200px; text-align: center;\">Giá</div>\n" +
                "            </li>\n");
        if(statement != null ){
            try {

                String sql = "SELECT product.nameProduct,cart.amount," +
                        "cart.amount*(product.price -product.price*product.sale/100) " +
                        "as total from cart JOIN product on product.idProduct = cart.idProduct " +
                        "WHERE cart.isCheck = true and cart.idUser = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);

                ps.setInt(1,idUser);
                ResultSet rs = ps.executeQuery();

                while (rs.next()){
                    sb.append(String.format("<li style=\"display: flex; justify-content: space-between; margin: 10px 0;\">\n" +
                            "    <div style=\"width: 200px;\">%s</div>\n" +
                            "    <div style=\"width: 200px; text-align: center;\">%d</div>\n" + // Corrected %i to %d
                            "    <div style=\"width: 200px; text-align: center;\">%.2f đ</div>\n" + // Adjusted to "%.2f" for two decimal places
                            "</li>\n", rs.getString("nameProduct"), rs.getInt("amount"), rs.getDouble("total")));

                }
                sb.append(    "        </ul>\n");

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
     return String.valueOf(sb);
    }

    public static void main(String[] args) {
    String text = CartService.getStringBill(4);
        System.out.println(text);
    }


}
