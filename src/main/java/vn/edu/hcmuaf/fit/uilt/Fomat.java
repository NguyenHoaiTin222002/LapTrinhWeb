package vn.edu.hcmuaf.fit.uilt;

import vn.edu.hcmuaf.fit.service.CartService;

import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

public class Fomat {
    public static String fomatCurrency(double vnd){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String str1 = currencyVN.format(vnd);
        return str1;
    }

    public static String getStringHTML( String fullName,String phone,String address, String description, double price,int idUser){
        String contentListProduct = CartService.getStringBill(idUser);
        StringBuffer sb = new StringBuffer();
        sb.append(String.format("<div style=\"max-width: 600px; margin: 0 auto; font-family: Arial, sans-serif;\">\n" +
                "        <div style=\"font-weight: bold;\">Họ và Tên: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                "        <div style=\"font-weight: bold;\">Địa chỉ: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                "        <div style=\"font-weight: bold;\">Mô tả thêm: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                "        <div style=\"font-weight: bold;\">Số điện thoại: <span style=\"color: #cf0b2c;\">%s</span></div>\n"+
                 contentListProduct +
                        "        <div style=\"font-weight: bold; margin-top: 10px;\">Tổng tiền: <span style=\"color: #cf0b2c;\">%.2f đ</span></div>\n" +
                        "        \n" +
                        "        <div style=\"text-align: center; font-weight: bold; margin-top: 20px;\">\n" +
                        "            Nếu không có gì sai, vui lòng nhấn vào nút ở dưới để chuyển đến trang nhập khóa\n" +
                        "        </div>\n" +
                        "    \n" +
                        "        <div style=\"text-align: center; margin-top: 20px;\">\n" +
                        "            <a href=\"http://localhost:8080/checkOutByPritaveKey.jsp\" style=\"text-decoration: none; color: white; background-color: #cf0b2c; padding: 10px 20px; border-radius: 5px; display: inline-block;\">\n" +
                        "                Nhập Khóa\n" +
                        "            </a>\n" +
                        "        </div>\n" +
                        "    </div>\n",
                fullName,address,description,phone,price));
        return String.valueOf(sb);

    }
    public  static  String getStringBil( String fullName,String phone,String address, String description, String price) {
        StringBuffer sb = new StringBuffer();
        sb.append(String.format("Họ và Tên: %s, Số điện thoại: %s, Địa chỉ: %s, Mô tả: %s, Tổng tiền: %s",fullName,phone,address,description,price));
        return String.valueOf(sb);

    }

    public static String getStringOption(String fullName, String phone, String address, double price, String dayBooking, String message){

        StringBuffer sb = new StringBuffer();
        sb.append(String.format("<div style=\"max-width: 600px; margin: 0 auto; font-family: Arial, sans-serif;\">\n" +
                        "        <div style=\"font-weight: bold;\">Tên khách hàng: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                        "        <div style=\"font-weight: bold;\">Số điện thoại: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                        "        <div style=\"font-weight: bold;\">Địa chỉ: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                        "        <div style=\"font-weight: bold;\">Tổng tiền: <span style=\"color: #cf0b2c;\">%.2f đ</span></div>\n" +
                        "        <div style=\"font-weight: bold;\">Thời gian đặt: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                        "        <div style=\"font-weight: bold;\">Thông báo: <span style=\"color: #cf0b2c;\">%s</span></div>\n" +
                        "    </div>\n",
                fullName,phone,address,price,dayBooking,message));
        return String.valueOf(sb);

    }
    public static void main(String[] args) {



    }
}
