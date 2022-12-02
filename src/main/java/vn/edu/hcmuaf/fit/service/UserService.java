package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.*;
import java.util.ArrayList;
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

    public static void main(String[] args) {
     List<User> userList = UserService.getAllUser();
        System.out.println(userList.size());


    }
}
