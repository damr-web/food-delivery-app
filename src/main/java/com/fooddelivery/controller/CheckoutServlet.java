package com.fooddelivery.controller;

import com.fooddelivery.dao.OrderDao;
import com.fooddelivery.dao.impl.OrderDaoImpl;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Just shows the checkout.jsp form — address + payment dropdown
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("cartRestaurantId");

        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        double total = 0;
        for (CartItem ci : cart) {
            total += ci.getSubtotal();
        }

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setDeliveryAddress(address);
        order.setPaymentMethod(paymentMethod);
        order.setTotalAmount(total);

        OrderDao orderDao = new OrderDaoImpl();
        int newOrderId = orderDao.placeOrder(order, cart);

        if (newOrderId != -1) {
            // Order saved successfully -> clear the cart so it doesn't linger for the next order
            session.removeAttribute("cart");
            session.removeAttribute("cartRestaurantId");
            response.sendRedirect("order-confirmation?orderId=" + newOrderId);
        } else {
            request.setAttribute("error", "Something went wrong placing your order. Please try again.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }
}