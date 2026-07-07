package com.fooddelivery.controller;

import com.fooddelivery.dao.UserDao;
import com.fooddelivery.dao.impl.UserDaoImpl;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// @WebServlet maps this class to a URL — no web.xml entry needed
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    // NOTE: UserDao is created fresh inside doPost(), not as an instance field.
    // Tomcat reuses ONE instance of this servlet across all users — instance
    // fields would be shared/unsafe across concurrent requests.

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GET just shows the signup form
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form field values sent from signup.jsp
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Build a User object from the form data
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password); // plain text for now — hashing comes later
        user.setPhone(phone);
        user.setAddress(address);

        // Call the DAO to insert into MySQL
        UserDao userDao = new UserDaoImpl();
        boolean success = userDao.registerUser(user);

        if (success) {
            // Registration worked — send them to the login page
            request.setAttribute("message", "Signup successful! Please log in.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Something went wrong (e.g. duplicate email) — show the form again with an error
            request.setAttribute("error", "Signup failed. Email may already be registered.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}