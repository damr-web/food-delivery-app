package com.fooddelivery.controller;

import com.fooddelivery.dao.OrderDao; 
import com.fooddelivery.dao.impl.OrderDaoImpl;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/order-confirmation")
public class OrderConfirmationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDao orderDao = new OrderDaoImpl();
        Order order = orderDao.getOrderById(orderId);
        List<OrderItem> items = orderDao.getOrderItems(orderId);

        request.setAttribute("order", order);
        request.setAttribute("items", items);
        request.getRequestDispatcher("order-confirmation.jsp").forward(request, response);
    }
}