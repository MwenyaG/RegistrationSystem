package org.lotus.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtils {

    private static DataSource ds;

    static {
        Properties properties = new Properties();

        try {
            properties.load(new FileInputStream("/Users/xiongkouqin/Desktop/SVV Assignment 2/RegisterSystem/src/main/resources/mysql.properties"));
            ds = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

    public static void close(ResultSet rs, Statement st, Connection con) {
        try{
            if(rs != null){
                rs.close();
            }
            if(st != null){
                st.close();
            }
            if(con != null){
                con.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
