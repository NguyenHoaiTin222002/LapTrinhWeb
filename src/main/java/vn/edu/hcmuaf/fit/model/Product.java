package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class Product implements Serializable {
   private int idProduct;
   private  String nameProduct;
   private  double price;
   private  int amountProduct;
   private  int amountSoldProduct;
    private  int newProduct;
    private  int sale;
    private  String producer;
    private  String discription;
    private  String img;
    private  int blockProduct;

    public Product(int idProduct, String nameProduct, double price, int amountProduct, int amountSoldProduct,
                   int newProduct, int sale, String producer, String discription, String img, int blockProduct) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.price = price;
        this.amountProduct = amountProduct;
        this.amountSoldProduct = amountSoldProduct;
        this.newProduct = newProduct;
        this.sale = sale;
        this.producer = producer;
        this.discription = discription;
        this.img = img;
        this.blockProduct = blockProduct;
    }

    public Product() {

    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmountProduct() {
        return amountProduct;
    }

    public void setAmountProduct(int amountProduct) {
        this.amountProduct = amountProduct;
    }

    public int getAmountSoldProduct() {
        return amountSoldProduct;
    }

    public void setAmountSoldProduct(int amountSoldProduct) {
        this.amountSoldProduct = amountSoldProduct;
    }

    public int getNewProduct() {
        return newProduct;
    }

    public void setNewProduct(int newProduct) {
        this.newProduct = newProduct;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getBlockProduct() {
        return blockProduct;
    }

    public void setBlockProduct(int blockProduct) {
        this.blockProduct = blockProduct;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idProduct=" + idProduct +
                ", nameProduct='" + nameProduct + '\'' +
                ", price=" + price +
                ", amountProduct=" + amountProduct +
                ", amountSoldProduct=" + amountSoldProduct +
                ", newProduct=" + newProduct +
                ", sale=" + sale +
                ", producer='" + producer + '\'' +
                ", discription='" + discription + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
