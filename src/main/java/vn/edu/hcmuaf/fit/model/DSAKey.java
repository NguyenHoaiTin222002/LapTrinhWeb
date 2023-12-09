package vn.edu.hcmuaf.fit.model;

import javax.xml.crypto.Data;
import java.io.Serializable;
import java.util.Date;

public class DSAKey implements Serializable {
    private int idKey;
    private int idUser;
    private String publicKey;
    private String privateKey;
    private Date createDate;

    private Date endDate;
    private int status;

//    public DSAKey(int idKey, int idUser, String publicKey, String privateKey, Date createDate, Date endDate, int status) {
//        this.idKey = idKey;
//        this.idUser = idUser;
//        this.publicKey = publicKey;
//        this.privateKey = privateKey;
//        this.createDate = createDate;
//        this.endDate = endDate;
//        this.status = status;
//    }

    public int getIdKey() {
        return idKey;
    }

    public void setIdKey(int idKey) {
        this.idKey = idKey;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
