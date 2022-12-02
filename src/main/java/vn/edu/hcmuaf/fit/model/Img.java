package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class Img implements Serializable {
    private  int idImg;
    private  int idProduct;
    private  String imgLink;

    public Img(int idImg, int idProduct, String imgLink) {
        this.idImg = idImg;
        this.idProduct = idProduct;
        this.imgLink = imgLink;
    }
    public Img(){

    }


    public int getIdImg() {
        return idImg;
    }

    public void setIdImg(int idImg) {
        this.idImg = idImg;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }
}
