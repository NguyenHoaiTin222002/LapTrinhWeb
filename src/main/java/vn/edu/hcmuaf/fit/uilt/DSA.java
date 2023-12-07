package vn.edu.hcmuaf.fit.uilt;

import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class DSA {
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public byte[] encrypt(String plaintext) throws Exception {
        Signature dsa = Signature.getInstance("SHA256withDSA");
        dsa.initSign(privateKey);

        byte[] data = plaintext.getBytes(StandardCharsets.UTF_8);
        dsa.update(data);
        byte[] signature = dsa.sign();
        return signature;
    }
    public  boolean decrypt(byte[] signature,String plaintext) throws Exception {
        byte[] data = plaintext.getBytes(StandardCharsets.UTF_8);
        Signature verifier = Signature.getInstance("SHA256withDSA");
        verifier.initVerify(publicKey);
        verifier.update(data);
        boolean verified = verifier.verify(signature);
        return verified;
    }
    public  void genkey() throws  Exception{
        KeyPairGenerator keyPairGenerator = null;
        try {
            keyPairGenerator = KeyPairGenerator.getInstance("DSA");
            KeyPair keyPair = keyPairGenerator.generateKeyPair();
            PrivateKey privateKey = keyPair.getPrivate();
            PublicKey publicKey = keyPair.getPublic();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public  String publicKeyToString(PublicKey publicKey) throws Exception {
        byte[] publicKeyBytes = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(publicKeyBytes);
    }

    public  PublicKey stringToPublicKey(String publicKeyString) throws Exception {
        byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyString);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA"); // Hoặc "DSA", "EC" tùy thuộc vào thuật toán của bạn
        return keyFactory.generatePublic(keySpec);
    }

    public String privateKeyToString(PrivateKey privateKey) throws Exception {
        byte[] privateKeyBytes = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(privateKeyBytes);
    }

    public  PrivateKey stringToPrivateKey(String privateKeyString) throws Exception {
        byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyString);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA"); // Hoặc "DSA", "EC" tùy thuộc vào thuật toán của bạn
        return keyFactory.generatePrivate(keySpec);
    }

    // Kiểm tra xem khóa công khai và khóa riêng có thuộc về cùng một cặp không
    private boolean checkKeyPairMatch(PrivateKey privateKey, PublicKey publicKey) throws NoSuchAlgorithmException, InvalidKeyException, SignatureException {

        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(privateKey);

        signature.update((byte) 0);
        byte[] signatureBytes = signature.sign();

        signature.initVerify(publicKey);

        signature.update((byte) 0);

        return signature.verify(signatureBytes);
    }
    public PublicKey getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(PublicKey publicKey) {
        this.publicKey = publicKey;
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(PrivateKey privateKey) {
        this.privateKey = privateKey;
    }

}
