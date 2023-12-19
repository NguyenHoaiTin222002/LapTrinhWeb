package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.uilt.DSA;
import vn.edu.hcmuaf.fit.uilt.Fomat;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BillService {
    public  static  boolean insertBill(int idUser, String fullName, String phone, String address,double price,String description,byte[] hash){
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "INSERT INTO `bill`( `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, `blockBill`, `description`,`hash`) VALUES (?,?,?,?,?,CURDATE(),1,?,?)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setString(2,fullName);
                ps.setString(3,address);
                ps.setString(4,phone);
                ps.setDouble(5,price);
                ps.setString(6,description);
                ps.setBytes(7,hash);

                ps.executeUpdate();
                return  true;


            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("Lỗi kết nối");
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
                String sql = "SELECT `idBIll`, `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, " +
                        "`dateDelivery`, `blockBill`, `description`,`hash` FROM `bill` WHERE idUser = ? and blockBill !=0 order by idBill DESC" ;
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
                    bill.setHash(rs.getBytes("hash"));
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
    public static List<Bill> loadBill(){
        List<Bill> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `idBIll`, `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, `dateDelivery`, " +
                        "`blockBill`, `description`,`hash` FROM `bill` WHERE blockBill !=0 order by idBill DESC " ;
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);

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
                    bill.setHash(rs.getBytes("hash"));
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
    public static Bill getBillidBill(int idBill){
        Bill bill = new Bill();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `idBIll`, `idUser`, `fullName`, `address`, `phone`, `price`, `dayBooking`, " +
                        "`dateDelivery`, `blockBill`, `description`,`hash` FROM `bill` WHERE idBIll = ? and blockBill !=0 " ;
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idBill);
                ResultSet rs = ps.executeQuery();
                if (rs.next()){

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
                    bill.setHash(rs.getBytes("hash"));

                }

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return bill;
    }

    public static void updateBill(int idBill, String fullName, String address, String phone,
                                  double price, int blockBill) {
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "UPDATE `bill` SET `fullName`=?,`address`=?,`phone`=?,`price`=?,`blockBill`=? WHERE `idBill`=?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1, fullName);
                ps.setString(2, address);
                ps.setString(3, phone);
                ps.setDouble(4, price);
                ps.setInt(5, blockBill);
                ps.setInt(6, idBill);

                ps.executeUpdate();

            }  catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public static void main(String[] args) throws  Exception {

    }
}
