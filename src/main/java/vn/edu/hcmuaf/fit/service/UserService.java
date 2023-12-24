package vn.edu.hcmuaf.fit.service;

import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.uilt.Email;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.uilt.EnCode;

import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

public class UserService {

    public static List<User> getAllUser(){
        List<User> list = new ArrayList<User>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =   statement.executeQuery("SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` ");
               while (rs.next()){
                  User user = new User();
                  user.setIdUser(rs.getInt("IdUser"));
                  user.setUserName(rs.getString("userName"));
                  user.setPassword(rs.getString("password"));
                   user.setFullName(rs.getString("fullName"));
                   user.setGender(rs.getInt("gender"));
                   user.setAddress(rs.getString("address"));
                   user.setEmail(rs.getString("email"));
                   user.setPhone(rs.getString("phone"));
                   user.setStutas(rs.getInt("stutas"));
                   user.setImg(rs.getString("img"));
                   user.setBirthday(rs.getDate("birthday"));
                   list.add(user);
               }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return list;
    }
    public static User getUserLogin(String userName){
        User user = new User();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` where userName = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,userName);
                ResultSet rs =   ps.executeQuery();

                while (rs.next()){

                    user.setIdUser(rs.getInt("IdUser"));
                    user.setUserName(rs.getString("userName"));
                    user.setPassword(rs.getString("password"));
                    user.setFullName(rs.getString("fullName"));
                    user.setGender(rs.getInt("gender"));
                    user.setAddress(rs.getString("address"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setStutas(rs.getInt("stutas"));
                    user.setImg(rs.getString("img"));
                    user.setBirthday(rs.getDate("birthday"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return user;
    }
    public static User getUserByEmail(String email){
        User user = new User();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` where email = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,email);
                ResultSet rs =   ps.executeQuery();

                while (rs.next()){

                    user.setIdUser(rs.getInt("IdUser"));
                    user.setUserName(rs.getString("userName"));
                    user.setPassword(rs.getString("password"));
                    user.setFullName(rs.getString("fullName"));
                    user.setGender(rs.getInt("gender"));
                    user.setAddress(rs.getString("address"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setStutas(rs.getInt("stutas"));
                    user.setImg(rs.getString("img"));
                    user.setBirthday(rs.getDate("birthday"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return user;
    }
    public  static void updatePassWord(int idUser,String pass){
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "UPDATE `user` SET `password`=?  WHERE idUser = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,pass);
                ps.setInt(2,idUser);
                ps.executeUpdate();


            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
    }
    public  static  boolean passwordRecovery( String email){
        User user  = UserService.getUserByEmail(email);

        if(user != null){

//            Email.sendMail(email,"Mật khẩu của bạn",user.getPassword());
            return true;
        }else {
            System.out.println("no account");
        }
        return false;
    }

    public  static  boolean insertUser(String userName, String passWord, String fullname, String email, String phone, String address, int gender, String birthday){
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "INSERT INTO `user`( `userName`, `password`, `fullName`, `address`, `email`, `phone`, `stutas`, `img`, `gender`, `birthday`) VALUES (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,userName);
                ps.setString(2,passWord);
                ps.setString(3,fullname);
                ps.setString(4,address);
                ps.setString(5,email);
                ps.setString(6,phone);
                ps.setInt(7,1);
                ps.setString(8,"../assets/img/AnhKhachHang.jpg");
                ps.setInt(9,gender);
                ps.setString(10,birthday);
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

    public  static  void updateUser(int idUser,String fullName, String address, String email, String phone, String img, int gender, String birthday){

        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "UPDATE `user` SET `fullName`= ? ,`address`= ?,`email`=?,`phone`=?,`img`=?,`gender`=?,`birthday`=? WHERE `idUser`=?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,fullName);
                ps.setString(2, address);
                ps.setString(3 ,email);
                ps.setString(4, phone);
                ps.setString(5,img);
                ps.setInt(6,gender);
                ps.setString(7,birthday);
                ps.setInt(8,idUser);
                ps.executeUpdate();


            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }

    public static User getEmailByIdUser(int idUser){
        User user = new User();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` where idUser = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ResultSet rs =   ps.executeQuery();

                while (rs.next()){

                    user.setIdUser(rs.getInt("IdUser"));
                    user.setUserName(rs.getString("userName"));
                    user.setPassword(rs.getString("password"));
                    user.setFullName(rs.getString("fullName"));
                    user.setGender(rs.getInt("gender"));
                    user.setAddress(rs.getString("address"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setStutas(rs.getInt("stutas"));
                    user.setImg(rs.getString("img"));
                    user.setBirthday(rs.getDate("birthday"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return user;
    }
    public static void main(String[] args) {
        for (User user: UserService.getAllUser()
             ) {
            System.out.println(user.toString());

        }
    }

}
