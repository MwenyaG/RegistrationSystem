package org.lotus.web;

import org.lotus.dao.UserDao;
import org.lotus.pojo.User;
import org.lotus.utils.MD5Utils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Logic/Web Layer - Register
 * to get parameters from HTTP request
 * and use userDao to complete the backend operations
 */

public class RegisterServlet extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Get parameters
        String username = req.getParameter("username");
        String passwordEncrypted = MD5Utils.getMd5(req.getParameter("password"));
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");

//        Check whether username exists or not
        if (userDao.usernameExists(username) == null) {
            // not exists
            // insert the user and redirect to a welcome page
            User user = new User(username, passwordEncrypted, firstname, lastname);
            userDao.insertUser(user);
            String msg = "Welcome " + username + ", you have signed up successfully!";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/welcome.jsp").forward(req, resp);
        } else {
            // exists
            // go back to register page and prompt user that the name exists
            String msg = "Sorry, username already exists!";
            req.setAttribute("msg", msg);
            req.setAttribute("username", username);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
