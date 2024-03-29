package vn.edu.hcmuaf.fit.uilt;

import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
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
    public  static Map<String,String> checkUpPassWord(String userPassWord,String passOld,String passNew,String passNewReset){
        Map<String,String>  map = new HashMap<>();
        String md5Hex = EnCode.checkksum(passOld);
        String md5HexPass = EnCode.checkksum(passNew);
        if(!userPassWord.trim().equals(md5Hex)){
            map.put("passOld","Nhập mật khẩu không đúng ");
        }
        if (!checkPassWord(passNew)){
            map.put("passNew","Mật khấu quá ngắn, phải ít nhất 6 kí tự");
        }
        if(!passNewReset.equals(passNew)){
            map.put("passNewReset","Nhập lại mật khẩu mới không đúng");

        }
        return map;
    }
    public static Map<String,String> checkSignUpMap(String fullName,String userName,String password,String email,String phone,String address){
        Map<String,String>  map = new HashMap<>();
         if("".equals(address.trim())){
             map.put("address","Chưa nhập địa chỉ");
         }
        if("".equals(fullName.trim())){
            map.put("fullName","Chưa nhập họ và tên");
        }
//        User user = UserService.getUserLogin(userName.trim());
//        if(user!=null){
//            map.put("userName","Tên tài khoản đã có đã được đăng kí, xin chọn tên khác");
//        }
        if (!checkPassWord(password)){
            map.put("password","Mật khấu quá ngắn, phải ít nhất 6 kí tự");
        }
        if (!checkEmail(email)){
            map.put("email","Email bạn đặt chưa đúng vd Nam@gmail.com");


        }
        if (!checkPhone(phone)){
            map.put("phone","Số điện thoại bạn đặt chưa đúng vd 084734661");

        }
        return map;
    }

    public static Map<String,String> checkUpdateUser(String fullName, String address, String email, String phone){
        Map<String,String> map = new HashMap<>();
        if("".equals(fullName.trim())){
            map.put("fullName","Chưa nhập Họ Tên");
        }
        if("".equals(address.trim())){
            map.put("address","Chưa nhập địa chỉ");
        }
        if (!checkEmail(email)){
            map.put("email","chưa nhập email hoặc email sai");
        }
        if (!checkPhone(phone)){
            map.put("phone","chưa nhập số điện thoại hoặc số điện thoại ko đúng");
        }
        return map;

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
