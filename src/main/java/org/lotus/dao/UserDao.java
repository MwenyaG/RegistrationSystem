package org.lotus.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.lotus.pojo.User;
import org.lotus.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Persistence Layer to interact with the database
 */

public class UserDao {
    /**
     * insert a user's information into the database
     *
     * @param user, which encapsulates the information of a user needed to create an account
     */
    public void insertUser(User user) {
        try {
            Connection con = JDBCUtils.getConnection();
            QueryRunner qr = new QueryRunner();
            String sql = "INSERT INTO `users` (`username`, `password`,`firstname`,`lastname`) VALUES (?, ?, ?, ?)";
            qr.update(con, sql, user.getUsername(), user.getPassword(), user.getFirstname(), user.getLastname());
            JDBCUtils.close(null, null, con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Check whether a username already exists in the database or not
     *
     * @param username
     * @return return null if there is no user with such username
     * return User instance if there is a user with such username
     */
    public User usernameExists(String username) {
        User user = null;
        try {
            Connection con = JDBCUtils.getConnection();
            QueryRunner qr = new QueryRunner();
            String sql = "SELECT * FROM `users` WHERE `username` = ?";
            user = qr.query(con, sql, new BeanHandler<>(User.class), username);
            JDBCUtils.close(null, null, con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
