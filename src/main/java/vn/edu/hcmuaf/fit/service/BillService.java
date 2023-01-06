package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    public static List<Bill> loadBillByIdUser(int idUser){
        List<Bill> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `idBIll`, `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, `dateDelivery`, `blockBill`, `description` FROM `bill` WHERE idUser = ? and blockBill !=0" ;
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idUser);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    Bill bill = new Bill();
                    bill.setIdBill(rs.getInt("idBIll"));
                    bill.setIdUser(rs.getInt("idUser"));
                    bill.setFullName(rs.getString("fullName"));
                    bill.setAddress(rs.getString("address"));
                    bill.setPhone(rs.getString("phone"));
                    bill.setPrice(rs.getDouble("price"));
                    bill.setDayBooking(rs.getDate("dayBooking"));
                    bill.setDateDelivery(rs.getDate("dateDelivery"));
                    bill.setBlockBill(rs.getInt("blockBill"));
                    bill.setDescription(rs.getString("description"));
                    list.add(bill);
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
