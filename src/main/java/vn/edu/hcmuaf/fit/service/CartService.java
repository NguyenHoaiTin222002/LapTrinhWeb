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

}
