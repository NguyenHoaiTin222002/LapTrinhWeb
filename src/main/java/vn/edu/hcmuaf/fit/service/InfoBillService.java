package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class InfoBillService {
    public static  boolean inSertInfoBill(int idBill, int idProduct, int amount){
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "INSERT INTO `infobill`( `idBill`, `idProduct`, `amount`) VALUES (?,?,?)";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idBill);
                ps.setInt(2, idProduct);
                ps.setInt(3, amount);
                ps.executeUpdate();
                return true;
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return false;
    }
}
