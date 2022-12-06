package vn.edu.hcmuaf.fit.uilt;

import java.text.NumberFormat;
import java.util.Locale;

public class Fomat {
    public static String fomatCurrency(double vnd){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String str1 = currencyVN.format(vnd);
        return str1;
    }

    public static void main(String[] args) {

    }
}
