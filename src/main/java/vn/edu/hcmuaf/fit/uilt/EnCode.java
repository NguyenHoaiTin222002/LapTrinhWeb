package vn.edu.hcmuaf.fit.uilt;

public class EnCode {
    public static String getEncryptString(String text){
        char[] chars = text.toCharArray();
        String str = "";
        for (int i = 0; i < chars.length ; i++) {
            str += (chars[i] + 97) + ",";
        }
       return str;
    }
    public static String getDecryptString(String text){
        String[] numbers = text.split(",");
        String str = "";
        for (int i = 0; i < numbers.length ; i++) {
            int number = Integer.valueOf(numbers[i]);
            str += (char)(number - 97);
        }
        return str;
    }

    public static void main(String[] args) {
        String text = getEncryptString("thao221722");
        System.out.println(text);
    }
}
