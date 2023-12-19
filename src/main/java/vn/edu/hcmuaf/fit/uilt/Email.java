package vn.edu.hcmuaf.fit.uilt;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Email {
    public static boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("20130436@st.hcmuaf.edu.vn","thao221722");
            }
        };
        Session session = Session.getInstance(props,auth);

        try {

            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("20130436@st.hcmuaf.edu.vn"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }
        return true;
    }
    public static boolean sendMailHTML(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("20130436@st.hcmuaf.edu.vn","thao221722");
            }
        };
        Session session = Session.getInstance(props,auth);

        try {

            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("20130436@st.hcmuaf.edu.vn"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(text,  "text/html; charset=utf-8");
            // Gửi email
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }
        return true;
    }

    public static void main(String[] args) {
//        String text = "<div style=\"max-width: 600px; margin: 0 auto; font-family: Arial, sans-serif;\">\n" +
//                "        <div style=\"font-weight: bold;\">Họ và Tên: <span style=\"color: #cf0b2c;\">Nguyễn Hoài Tín</span></div>\n" +
//                "        <div style=\"font-weight: bold;\">Địa chỉ: <span style=\"color: #cf0b2c;\">Tân Bảnh, Tân Phước, Giồng Găng</span></div>\n" +
//                "        <div style=\"font-weight: bold;\">Mô tả thêm: <span style=\"color: #cf0b2c;\">Nguyễn Hoài Tín</span></div>\n" +
//                "        <div style=\"font-weight: bold;\">Số điện thoại: <span style=\"color: #cf0b2c;\">0814734661</span></div>\n" +
//                "        \n" +
//                "        <ul style=\"list-style: none; padding: 0;\">\n" +
//                "            <li style=\"display: flex; justify-content: space-between; font-weight: bold; margin: 10px 0;\">\n" +
//                "                <div style=\"width: 200px;\">Tên sản phẩm</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">Số lượng</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">Giá</div>\n" +
//                "            </li>\n" +
//                "            <li style=\"display: flex; justify-content: space-between; margin: 10px 0;\">\n" +
//                "                <div style=\"flex: 1;\">Giấy In Double A Khổ A4, A3 Các Định Lượng</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">2</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">200.000đ</div>\n" +
//                "            </li>\n" +
//                "            <li style=\"display: flex; justify-content: space-between; margin: 10px 0;\">\n" +
//                "                <div style=\"flex: 1;\">Giấy In Double A Khổ A4, A3 Các Định Lượng</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">2</div>\n" +
//                "                <div style=\"flex: 1; text-align: center;\">200.000đ</div>\n" +
//                "            </li>\n" +
//                "        </ul>\n" +
//                "    \n" +
//                "        <div style=\"font-weight: bold; margin-top: 10px;\">Tổng tiền: <span style=\"color: #cf0b2c;\">2.000.000đ</span></div>\n" +
//                "        \n" +
//                "        <div style=\"text-align: center; font-weight: bold; margin-top: 20px;\">\n" +
//                "            Nếu không có gì sai, vui lòng nhấn vào nút ở dưới để chuyển đến trang nhập khóa\n" +
//                "        </div>\n" +
//                "    \n" +
//                "        <div style=\"text-align: center; margin-top: 20px;\">\n" +
//                "            <a href=\"http://localhost:8080/\" style=\"text-decoration: none; color: white; background-color: #cf0b2c; padding: 10px 20px; border-radius: 5px; display: inline-block;\">\n" +
//                "                Nhập Khóa\n" +
//                "            </a>\n" +
//                "        </div>\n" +
//                "    </div>\n";
        String alo = Fomat.getStringHTML("a","b","c","d",20,4);
        Email.sendMailHTML("lucvy221722@gmail.com","mat khau",alo);
    }
}
