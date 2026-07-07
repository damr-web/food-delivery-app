package com.fooddelivery.controller;

import com.fooddelivery.dbutil.DBUtil;
import com.fooddelivery.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/submit-review")
public class AddReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        String sql = "INSERT INTO reviews (user_id, restaurant_id, rating, comment) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, user.getUserId());
            stmt.setInt(2, restaurantId);
            stmt.setInt(3, rating);
            stmt.setString(4, comment);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Send back to the menu of that restaurant to see the updated reviews
        response.sendRedirect("menu?restaurantId=" + restaurantId);
    }
}