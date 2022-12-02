package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Img;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ImgService {

    public static List<Img> getListImgByIdProduct(int id){
        List<Img> list = new ArrayList<>();
        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "SELECT `idImg`, `IdProduct`, `ImgLink` FROM `img` WHERE IdProduct = " + id;
                ResultSet rs =   statement.executeQuery(sql);
               while (rs.next()){
                     Img img = new Img();
                     img.setIdImg(rs.getInt("idImg"));
                     img.setIdProduct(rs.getInt("IdProduct"));
                     img.setImgLink(rs.getString("ImgLink"));
                     list.add(img);
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
        List<Img> users =  getListImgByIdProduct(1);
        System.out.println(users.size());
    }
}
