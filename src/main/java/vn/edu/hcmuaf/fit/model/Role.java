package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class Role implements Serializable {
    private  int idRole ;
    private  String nameRole;

    public Role(int idRole, String nameRole) {
        this.idRole = idRole;
        this.nameRole = nameRole;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getNameRole() {
        return nameRole;
    }

    public void setNameRole(String nameRole) {
        this.nameRole = nameRole;
    }

    @Override
    public String toString() {
        return "Role{" +
                "idRole=" + idRole +
                ", nameRole=" + nameRole +
                '}';
    }
}
