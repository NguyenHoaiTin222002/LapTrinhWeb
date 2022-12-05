package vn.edu.hcmuaf.fit.uilt;

import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Check {
    private static Pattern pattern;
    private static Matcher matcher;
    private static final String EMAIL_REGEX =   "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    private static final String PHONE_REGEX =   "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}";

    public static String checkSignUp(String userName,String password,String email,String phone,String address){
        if(userName.trim().equals("")||password.trim().equals("")
                ||email.trim().equals("")||phone.trim().equals("")||address.trim().equals("")){
            return "Nhập đầy đủ thông tin";
        }
        User user = UserService.getUserLogin(userName);
        if(user==null){
            return "Tên tài khoản đã có đã được đăng kí, xin chọn tên khác";
        }
        if (!checkPassWord(password)){
            return "Mật khấu quá ngắn, phải ít nhất 6 kí tự";
        }
        if (!checkEmail(email)){
            return "Đặt lại email";
        }
        if (!checkPhone(phone)){
            return "Xin nhập lại số điện thoại";
        }
        return "";
    }
    public static String checkUpdateUser(String fullName, String address, String email, String phone){
        if(fullName.trim().equals("")||address.trim().equals("")||email.trim().equals("")||phone.trim().equals("")){
            return "Nhập đầy đủ thông tin";

        }
        if (!checkEmail(email)){
            return "Đặt lại email";
        }
        if (!checkPhone(phone)){
            return "Xin nhập lại số điện thoại";
        }
        return "";

    }
    public  static boolean checkPhone(String phone){
        pattern = Pattern.compile(PHONE_REGEX);
        matcher = pattern.matcher(phone);
        return matcher.matches();
    }
    public  static boolean checkEmail(String email){
        pattern = Pattern.compile(EMAIL_REGEX);
        matcher = pattern.matcher(email);
        return matcher.matches();

    }

    public static String UpDate(String date){
        String re = date.substring(date.length()-4, date.length())+ "-";
        re += date.substring(date.length()-7,date.length()-5)+ "-";
        re += date.substring(0,2);
        return re;
    }
    public static boolean checkPassWord(String password){
        return  password.length() >= 6;
    }




}
