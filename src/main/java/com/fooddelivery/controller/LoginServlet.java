package com.fooddelivery.controller;

import com.fooddelivery.dao.UserDao;
import com.fooddelivery.dao.impl.UserDaoImpl;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUserByEmail(email);

        // Check user exists AND password matches
        if (user != null && user.getPassword().equals(password)) {

            // HttpSession stores data that persists across multiple requests for ONE user
            // (unlike servlet instance fields, this IS safe — each user gets their own session)
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            // Redirect (not forward) after successful login — prevents form resubmission on refresh
            response.sendRedirect("home.jsp");

        } else {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}