package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;
import java.util.Date;

public class Bill implements Serializable {
    private int idBill;
    private int idUser;
    private String fullName;
    private String address;
    private String description;
    private String phone;
    private double price;
    private Date dayBooking;
    private Date dateDelivery;
    private int blockBill;

    public Bill() {
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDayBooking() {
        return dayBooking;
    }

    public void setDayBooking(Date dayBooking) {
        this.dayBooking = dayBooking;
    }

    public Date getDateDelivery() {
        return dateDelivery;
    }

    public void setDateDelivery(Date dateDelivery) {
        this.dateDelivery = dateDelivery;
    }

    public int getBlockBill() {
        return blockBill;
    }

    public void setBlockBill(int blockBill) {
        this.blockBill = blockBill;
    }
}
