package vn.edu.hcmuaf.fit.db;


import com.mysql.cj.jdbc.MysqlDataSource;
import  org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBiConnector {
     Jdbi jdbi;
     static JDBiConnector con;
     public JDBiConnector(){

         try {
             MysqlDataSource data = new MysqlDataSource();
             data.setURL("jdbc:mysql://" + DBProperties.host()+ ":" + DBProperties.port() + "/" + DBProperties.name());
             data.setUser(DBProperties.user());
             data.setPassword(DBProperties.pass());
             data.setAutoReconnect(true);
             data.setUseCompression(true);
             jdbi = jdbi.create(data);
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
     }

     public static  Jdbi me(){
         if (con == null) con = new JDBiConnector();
         return con.jdbi;
     }

    public static void main(String[] args) {
     List<User> list =   JDBiConnector.me().withHandle(handle ->
                {
                    return handle.createQuery("select  * from User").mapToBean(User.class).stream().collect(Collectors.toList());
                }
                );
        System.out.println(list.size());
    }
}
