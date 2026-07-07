package com.fooddelivery.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Fetch the current session (pass false so it doesn't create a new one)
        HttpSession session = request.getSession(false);
        
        // 2. If a session exists, invalidate (destroy) it to log the user out
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Redirect the user back to the login screen
        response.sendRedirect("login.jsp");
    }
}