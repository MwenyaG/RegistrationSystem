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
 * Logic/Web Layer - Login
 * to get parameters from HTTP request
 * and use userDao to complete the backend operations
 */

public class LoginServlet extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDao.usernameExists(username);
        if (user == null) {
            System.out.println("Username not exists!");
            String msg = "Username not exists!";
            req.setAttribute("msg", msg);
            req.setAttribute("username", username);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            if (user.getPassword().equals(MD5Utils.getMd5(password))) {
                req.setAttribute("username", user.getUsername());
                req.setAttribute("fullname", user.getFirstname() + " " + user.getLastname());
                req.getRequestDispatcher("/welcome.jsp").forward(req, resp);
            } else {
                String msg = "Wrong password or wrong username!";
                req.setAttribute("msg", msg);
                req.setAttribute("username", username);
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        }
    }
}
