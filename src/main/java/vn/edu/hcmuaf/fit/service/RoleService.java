package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Role;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RoleService {
    public static List<Role> getAllRole(){
        List<Role> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                ResultSet rs =
                        statement.executeQuery( "SELECT `IdRole`, `nameRole` FROM `role`");
                while (rs.next()){
                 Role role = new Role(rs.getInt("IdRole"),rs.getString("nameRole"));
                 list.add(role);
                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return list;
    }
    public static Role getRoleByName(String nameRole){
        Role role = null;
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `IdRole`, `nameRole` FROM `role` where nameRole = ?";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setString(1,nameRole);
                ResultSet rs =  ps.executeQuery();

                while (rs.next()){

                     role = new Role(rs.getInt("IdRole"),rs.getString("nameRole"));
                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return role;
    }

}
