package com.fooddelivery.dao;

import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;
import java.util.List;

public interface OrderDao {
    // Places the order AND its line items together — returns the new order's ID, or -1 on failure
    int placeOrder(Order order, List<CartItem> cartItems);

    List<Order> getOrdersByUserId(int userId);
    List<OrderItem> getOrderItems(int orderId);
    Order getOrderById(int orderId);
    
    
}