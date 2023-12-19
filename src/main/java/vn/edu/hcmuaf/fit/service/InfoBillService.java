package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.InfoBill;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    public static InfoBill getInfoBillbyidUser(int idUser){
        InfoBill ifBill = new InfoBill();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT i.idInfoBill i.idProduct, i.amount from bill as b join infobill as i on b.idBill = i.idBill where idUser=?" ;

                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idUser);
                ResultSet rs =   ps.executeQuery();


                while (rs.next()){

                    ifBill.setIdBill(rs.getInt("idBill"));
                    ifBill.setIdInfoBill(rs.getInt("idInfoBill"));
                    ifBill.setAmount(rs.getInt("amount"));
                    ifBill.setIdProduct(rs.getInt("idProduct"));

                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return ifBill;
    }
    public static List<InfoBill> getInfoBillbyidBill(int idBill){
        List<InfoBill> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `idBill`, `idInfoBill`, `idProduct`,  `amount` from infobill where idBill=?" ;

                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1, idBill);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    InfoBill ifBill = new InfoBill();
                    ifBill.setIdBill(rs.getInt("idBill"));
                    ifBill.setIdInfoBill(rs.getInt("idInfoBill"));
                    ifBill.setIdProduct(rs.getInt("idProduct"));
                    ifBill.setAmount(rs.getInt("amount"));
                    list.add(ifBill);
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
      ArrayList<InfoBill> list= (ArrayList<InfoBill>) InfoBillService.getInfoBillbyidBill(1);
        for (InfoBill info: list
             ) {
            System.out.println(info.toString());

        }
    }

}
