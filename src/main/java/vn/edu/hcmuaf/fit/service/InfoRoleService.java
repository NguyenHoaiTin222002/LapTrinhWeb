package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InfoRoleService {
    public static void insertInfoRoleKH(int idUser,int idRole){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "INSERT INTO `inforole`(`idInfoRole`, `idUser`, `idRole`) VALUES (null,?,?)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setInt(2,idRole);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }

    public static String getRole(int idUser){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = "SELECT role.nameRole FROM `inforole` JOIN role on role.idRole = inforole.idRole WHERE inforole.idUser = ? ";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);

                ResultSet rs =   ps.executeQuery();


                while (rs.next()){

                  return rs.getString("nameRole");

                }

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return "";

    }


}
