package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.uilt.Email;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.uilt.EnCode;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    public static List<User> getAllUser(){
        List<User> list = new ArrayList<User>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
<<<<<<< HEAD
                ResultSet rs =   statement.executeQuery("SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` WHERE user.stutas !=0");
=======
                ResultSet rs =   statement.executeQuery("SELECT `IdUser`, `userName`, `password`, `fullName`, `gender`, `address`, `email`, `phone`, `stutas`, `img`, `birthday` FROM `user` WHERE stutas!=0");
>>>>>>> 6439d1d2043f1a04f9c99a73f3213d304edf10a7
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
            String md5Hex = EnCode.getDecryptString(user.getPassword());
            Email.sendMail(email,"Mật khẩu của bạn",md5Hex);
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

    public  static User updateUser(User user){

        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
//                String sql = "UPDATE `user` SET `fullName`= ? ,`address`= ?,`email`=?,`phone`=?,  `img`=?,`gender`=?,`birthday`=? WHERE `idUser`=?";
//                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
//                ps.setString(1,fullName);
//                ps.setString(2, address);
//                ps.setString(3 ,email);
//                ps.setString(4, phone);
//
//                ps.setString(5,img);
//
//                ps.setInt(6,gender);
//                ps.setString(7,birthday);
//                ps.setInt(8,idUser);
                String sql = "UPDATE user SET fullName= ? ,address= ?,email=?,phone=?,img=?,gender=?,birthday=? WHERE idUser=?";
                PreparedStatement ps = statement.getConnection().prepareStatement(sql);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getAddress());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getPhone());
                ps.setString(5, user.getImg());
                ps.setInt(6, user.getGender());
                ps.setDate(7, (Date) user.getBirthday());
                ps.setInt(8, user.getIdUser());


                ps.executeUpdate();

            }catch (SQLException e) {
               e.printStackTrace();
            }
        }else {
            System.out.println("lỗi kết nối");
        }

        return null;
    }
    public static void deleteUser(int idUser) {
        Statement statement = DBConnect.getInstance().get();
        if (statement != null) {
            try {
                String sql = "UPDATE user SET user.stutas = 0 WHERE user.idUser=?";
                PreparedStatement ps = statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idUser);
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("lỗi kết nối");
        }
    }
    public static byte[] getImgageData(int idUser){
        Statement statement = DBConnect.getInstance().get();
        try{
            String select = "select img from user where idUser=?";
            PreparedStatement ps = statement.getConnection().prepareStatement(select);
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return  rs.getBytes("img");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static boolean updateAvatar(InputStream inputStream, int idUser){
        Statement statement = DBConnect.getInstance().get();
        try {
            String update = "update user set img=? where idUser=?";
            PreparedStatement ps = statement.getConnection().prepareStatement(update);
            ps.setBlob(1, inputStream);
            ps.setInt(2, idUser);
            ps.executeUpdate();
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public static void deleteUser(int idUser) {
        Statement statement = DBConnect.getInstance().get();
        if (statement != null) {
            try {
                String sql = "UPDATE user SET user.stutas = 0 WHERE user.idUser=?";
                PreparedStatement ps = statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idUser);
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("lỗi kết nối");
        }
    }
    public static void main(String[] args) {
    }

}
