package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DSAKey;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DSAKeyService {
//    INSERT INTO `dsakey`( `idUser`, `publicKey`, `privateKey`, `createDate`,  `status`) VALUES ('[value-2]','[value-3]','[value-4]','[value-5]','[value-6]',)

    public static void insertKey(int idUser,String publicKey,String privateKey){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = " INSERT INTO `dsakey`( `idUser`, `publicKey`, `privateKey`, `createDate` ,`status`) VALUES (?,?,?,CURDATE(),1)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ps.setString(2,publicKey);
                ps.setString(3,privateKey);
                ps.executeUpdate();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }

    }
    public static boolean checkKeyByisUser(int idUser){
        boolean result = false;
        Statement statement = DBConnect.getInstance().get();
//        SELECT `idKey`, `idUser`, `publicKey`, `privateKey`, `createDate`, `endDate`, `status` FROM `dsakey` WHERE 1
        if(statement != null ){
            try {

                String sql = "SELECT `idKey`, `idUser`, `publicKey`, `privateKey`, `createDate`, `endDate`, `status` FROM `dsakey` WHERE idUser = ? and endDate IS NULL and status = 1";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ResultSet rs =  ps.executeQuery();
                 return  rs.next();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
      return   result;
    }

    public static void main(String[] args) {
        insertKey(1,"a","a");
    }


}
