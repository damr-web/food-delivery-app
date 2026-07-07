package com.fooddelivery.controller;

import com.fooddelivery.dao.MenuItemDao;
import com.fooddelivery.dao.RestaurantDao;
import com.fooddelivery.dao.impl.MenuItemDaoImpl;
import com.fooddelivery.dao.impl.RestaurantDaoImpl;
import com.fooddelivery.dbutil.DBUtil;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.model.Restaurant;
import com.fooddelivery.model.Review; // Important for the new feature!

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read the restaurantId query param from the URL (?restaurantId=1)
        String restaurantIdParam = request.getParameter("restaurantId");

        if (restaurantIdParam == null) {
            response.sendRedirect("restaurants");
            return;
        }

        int restaurantId = Integer.parseInt(restaurantIdParam);

        // Fetch Restaurant and Menu Items
        RestaurantDao restaurantDao = new RestaurantDaoImpl();
        MenuItemDao menuItemDao = new MenuItemDaoImpl();

        Restaurant restaurant = restaurantDao.getRestaurantById(restaurantId);
        List<MenuItem> menuItems = menuItemDao.getMenuByRestaurantId(restaurantId);

        // ==========================================
        // NEW FEATURE: Fetch Reviews for this Restaurant
        // ==========================================
        List<Review> reviews = new ArrayList<>();
        String reviewSql = "SELECT r.*, u.name FROM reviews r JOIN users u ON r.user_id = u.user_id WHERE r.restaurant_id = ? ORDER BY r.created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(reviewSql)) {
             
            stmt.setInt(1, restaurantId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Review rev = new Review();
                    rev.setReviewId(rs.getInt("review_id"));
                    rev.setRating(rs.getInt("rating"));
                    rev.setComment(rs.getString("comment"));
                    rev.setUserName(rs.getString("name"));
                    reviews.add(rev);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // ==========================================

        // Attach all data to the request
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("menuItems", menuItems);
        request.setAttribute("reviews", reviews); // Pass the reviews to the JSP
        
        // Forward to the UI
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}