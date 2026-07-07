package com.fooddelivery.dao.impl;

import com.fooddelivery.dao.OrderDao;
import com.fooddelivery.dbutil.DBUtil;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {

	@Override
	public int placeOrder(Order order, List<CartItem> cartItems) {
	    String insertOrderSql =
	        "INSERT INTO orders (user_id, restaurant_id, delivery_address, payment_method, total_amount, status, order_date) " +
	        "VALUES (?, ?, ?, ?, ?, ?, NOW())";

	    String insertItemSql =
	        "INSERT INTO order_items (order_id, item_id, quantity, price_at_order) VALUES (?, ?, ?, ?)";

	    Connection conn = null;
	    try {
	        conn = DBUtil.getConnection();
	        conn.setAutoCommit(false);

	        int newOrderId;
	        try (PreparedStatement stmt = conn.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS)) {
	            stmt.setInt(1, order.getUserId());
	            stmt.setInt(2, order.getRestaurantId());
	            stmt.setString(3, order.getDeliveryAddress());
	            stmt.setString(4, order.getPaymentMethod());
	            stmt.setDouble(5, order.getTotalAmount());
	            stmt.setString(6, "PLACED");
	            stmt.executeUpdate();

	            try (ResultSet keys = stmt.getGeneratedKeys()) {
	                if (keys.next()) {
	                    newOrderId = keys.getInt(1);
	                } else {
	                    throw new SQLException("Order insert did not return a generated ID");
	                }
	            }
	        }

	        try (PreparedStatement stmt = conn.prepareStatement(insertItemSql)) {
	            for (CartItem ci : cartItems) {
	                stmt.setInt(1, newOrderId);
	                stmt.setInt(2, ci.getMenuItem().getItemId());
	                stmt.setInt(3, ci.getQuantity());
	                stmt.setDouble(4, ci.getMenuItem().getPrice());
	                stmt.addBatch();
	            }
	            stmt.executeBatch();
	        }

	        conn.commit();
	        return newOrderId;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        if (conn != null) {
	            try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
	        }
	        return -1;
	    } finally {
	        if (conn != null) {
	            try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
	        }
	    }
	}

	@Override
	public List<OrderItem> getOrderItems(int orderId) {
	    List<OrderItem> items = new ArrayList<>();
	    String sql = "SELECT oi.*, mi.name AS item_name " +
	                 "FROM order_items oi " +
	                 "JOIN menu_items mi ON oi.item_id = mi.item_id " +
	                 "WHERE oi.order_id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, orderId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                OrderItem oi = new OrderItem();
	                oi.setOrderItemId(rs.getInt("order_item_id"));
	                oi.setOrderId(rs.getInt("order_id"));
	                oi.setItemId(rs.getInt("item_id"));
	                oi.setItemName(rs.getString("item_name"));
	                oi.setQuantity(rs.getInt("quantity"));
	                oi.setPriceAtOrder(rs.getDouble("price_at_order"));
	                items.add(oi);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return items;
	}

	@Override
	public List<Order> getOrdersByUserId(int userId) {
	    List<Order> orders = new ArrayList<>();
	    String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, userId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                orders.add(mapRowToOrder(rs));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orders;
	}

	@Override
	public Order getOrderById(int orderId) {
	    String sql = "SELECT * FROM orders WHERE order_id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, orderId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                return mapRowToOrder(rs);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	private Order mapRowToOrder(ResultSet rs) throws SQLException {
	    Order o = new Order();
	    o.setOrderId(rs.getInt("order_id"));
	    o.setUserId(rs.getInt("user_id"));
	    o.setRestaurantId(rs.getInt("restaurant_id"));
	    o.setDeliveryAddress(rs.getString("delivery_address"));
	    o.setPaymentMethod(rs.getString("payment_method"));
	    o.setTotalAmount(rs.getDouble("total_amount"));
	    o.setStatus(rs.getString("status"));
	    o.setOrderDate(rs.getTimestamp("order_date"));
	    return o;
	}
}