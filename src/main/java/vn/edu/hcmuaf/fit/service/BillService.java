package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BillService {
    public  static  boolean insertBill(int idUser, String fullName, String phone, String address,double price,String description){
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "INSERT INTO `bill`( `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, `blockBill`, `description`) VALUES (?,?,?,?,?,CURDATE(),1,?)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setString(2,fullName);
                ps.setString(3,address);
                ps.setString(4,phone);
                ps.setDouble(5,price);
                ps.setString(6,description);

                ps.executeUpdate();
                return  true;


            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return  false;

    }
    public  static int  getIdBillByIdUser(int idUser){
        int idBill = 0;
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT max(idBIll) as maxIdBill FROM `bill` WHERE idUser = ?" ;
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idUser);
                ResultSet rs =   ps.executeQuery();
                rs.next();
                idBill = rs.getInt("maxIdBill");
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return idBill;
    }

    public static void main(String[] args) {

    }
}
