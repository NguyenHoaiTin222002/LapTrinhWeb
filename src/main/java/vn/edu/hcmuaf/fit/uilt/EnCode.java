package vn.edu.hcmuaf.fit.uilt;

import java.math.BigInteger;
import java.security.MessageDigest;

public class EnCode {
    public static String checkksum(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDiest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDiest);

            return number.toString(16);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
