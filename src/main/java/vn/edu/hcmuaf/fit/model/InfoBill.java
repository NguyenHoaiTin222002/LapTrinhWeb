package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class InfoBill implements Serializable {
     private  int idInfoBill;
     private  int idBill;
     private  int idProduct;
     private  int amount;


    public int getIdInfoBill() {
        return idInfoBill;
    }

    public void setIdInfoBill(int idInfoBill) {
        this.idInfoBill = idInfoBill;
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "InfoBill{" +
                "idInfoBill=" + idInfoBill +
                ", idBill=" + idBill +
                ", idProduct=" + idProduct +
                ", amount=" + amount +
                '}';
    }
}
