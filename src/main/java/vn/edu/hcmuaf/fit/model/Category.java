package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class Category  implements Serializable {
    private  int idCatpgory;
    private  String nameCatogory;

    public Category(int idCatpgory, String nameCatogory) {
        this.idCatpgory = idCatpgory;
        this.nameCatogory = nameCatogory;
    }

    public int getIdCatpgory() {
        return idCatpgory;
    }

    public void setIdCatpgory(int idCatpgory) {
        this.idCatpgory = idCatpgory;
    }

    public String getNameCatogory() {
        return nameCatogory;
    }

    public void setNameCatogory(String nameCatogory) {
        this.nameCatogory = nameCatogory;
    }

    @Override
    public String toString() {
        return "Catogory{" +
                "idCatpgory=" + idCatpgory +
                ", nameCatogory='" + nameCatogory + '\'' +
                '}';
    }
}
