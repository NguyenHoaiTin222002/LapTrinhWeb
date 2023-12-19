package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.DSAKey;
import vn.edu.hcmuaf.fit.uilt.DSA;

import java.security.PrivateKey;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import static java.time.LocalDateTime.*;

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
    public  static DSAKey getKeyidUser(int idUser){
        DSAKey dsaKey = new DSAKey();
        Statement statement = DBConnect.getInstance().get();
//        SELECT `idKey`, `idUser`, `publicKey`, `privateKey`, `createDate`, `endDate`, `status` FROM `dsakey` WHERE 1
        if(statement != null ){
            try {

                String sql = "SELECT `idKey`, `idUser`, `publicKey`, `privateKey`, `createDate`, `endDate`, `status` FROM `dsakey` WHERE idUser = ? and endDate IS NULL and status = 1";
                PreparedStatement ps =   statement.getConnection().prepareStatement(sql);
                ps.setInt(1,idUser);
                ResultSet rs =  ps.executeQuery();
                if(rs.next()){

                    dsaKey.setIdKey(rs.getInt("idKey"));
                    dsaKey.setIdUser(rs.getInt("idUser"));
                    dsaKey.setPublicKey(rs.getString("publicKey"));
                    dsaKey.setPrivateKey(rs.getString("privateKey"));
                    dsaKey.setCreateDate(rs.getDate("createDate"));
                    dsaKey.setStatus(rs.getInt("status"));

                }
                return dsaKey;

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            System.out.println("lỗi kết nối");
        }
        return dsaKey;
    }
    public static void updateDSAKey(int idKey){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
        LocalDate localDate = LocalDate.now();

        Statement statement = DBConnect.getInstance().get();
        if(statement != null ){
            try {
                String sql = "UPDATE `dsakey` SET `endDate` = ?, `status` = 0 WHERE `idKey`=?";
                PreparedStatement ps = statement.getConnection().prepareStatement(sql);
                ps.setDate(1, Date.valueOf(dtf.format(localDate)));
                ps.setInt(2, idKey);


                ps.executeUpdate();

            }catch (SQLException e) {
                e.printStackTrace();
            }
        }else {
            System.out.println("Lỗi kết nối");
        }


    }
    public static void updateKey(int idUser,String publicKey,String privateKey){
        Statement statement = DBConnect.getInstance().get();

        if(statement != null ){
            try {

                String sql = " UPDATE `dsakey`( `idUser`, `publicKey`, `privateKey`, `createDate` ,`status`) VALUES (?,?,?,CURDATE(),1)";
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

    public static void main(String[] args) throws Exception {
//        String text = "Đoạn văn trên sau đó đã được cô giáo cho 4 điểm kèm lời phê \"lạc đề\". Dân mạng thì ôm bụng cười vì đoạn mở bài quá bá đạo của nam sinh này. Trong khi cô giáo ra đề viết 1 đoạn văn nhưng con trai chị Xinh viết dài đến 6 dòng vẫn chưa hết đoạn mở bài. Đặc biệt, nhiều người đọc đi đọc lại vẫn không tìm ra mối liên quan giữa quyền học tập trẻ em với \"trái đất được hình thành\" và \"sự sống được nhen nhóm\".\n" +
//                "\n" +
//                "Tuy nhiên, cũng có người thừa nhận: \"Cá nhân mình thấy bạn ấy viết được như thế chứng tỏ kiến thức không hề ít. Nếu có thời gian sẽ có 1 bài văn mang tầm vĩ mô. Mình sẽ lưu đoạn văn này cho con mình tham khảo\".";
//
        DSAKey dsaKey = DSAKeyService.getKeyidUser(4);
        DSA dsa = new DSA();
        dsa.genkey();
        System.out.println(dsa.publicKeyToString(dsa.getPublicKey()));
        System.out.println(dsa.privateKeyToString(dsa.getPrivateKey()));

//        PrivateKey privateKey = dsa.stringToPrivateKey(dsaKey.getPrivateKey());
//          dsa.setPrivateKey(dsa.stringToPrivateKey(dsaKey.getPrivateKey()));
//        dsa.setPublicKey(dsa.stringToPublicKey(dsaKey.getPublicKey()));
//
//          byte[] hash1 = dsa.encrypt(text);
//        BillService.insertBill(4,"Nguyễn hoài tín","123123","a",100000,"a",hash);

//        List<Bill> bills = BillService.loadBillByIdUser(4);
//        byte[] hash = bills.get(0).getHash();

//        System.out.println(Arrays.toString(hash));
//        System.out.println(Arrays.toString(hash1));
//          System.out.println(dsa.decrypt(hash,text));



    }




}
