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
import java.sql.ResultSet;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String action = request.getParameter("action"); // "increase" or "decrease"

        try (Connection conn = DBUtil.getConnection()) {
            // 1. Get current quantity
            String getQtySql = "SELECT quantity FROM cart WHERE user_id = ? AND item_id = ?";
            PreparedStatement getStmt = conn.prepareStatement(getQtySql);
            getStmt.setInt(1, user.getUserId());
            getStmt.setInt(2, itemId);
            ResultSet rs = getStmt.executeQuery();

            if (rs.next()) {
                int currentQty = rs.getInt("quantity");
                int newQty = action.equals("increase") ? currentQty + 1 : currentQty - 1;

                if (newQty > 0) {
                    // Update quantity
                    String updateSql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND item_id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                    updateStmt.setInt(1, newQty);
                    updateStmt.setInt(2, user.getUserId());
                    updateStmt.setInt(3, itemId);
                    updateStmt.executeUpdate();
                } else {
                    // If quantity drops to 0, completely remove it from cart
                    String deleteSql = "DELETE FROM cart WHERE user_id = ? AND item_id = ?";
                    PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
                    deleteStmt.setInt(1, user.getUserId());
                    deleteStmt.setInt(2, itemId);
                    deleteStmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Send user right back to the cart page to see the changes
        response.sendRedirect("cart");
    }
}