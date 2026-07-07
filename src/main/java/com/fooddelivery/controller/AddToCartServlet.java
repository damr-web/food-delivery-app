package com.fooddelivery.controller;

import com.fooddelivery.dao.MenuItemDao;
import com.fooddelivery.dao.impl.MenuItemDaoImpl;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        MenuItemDao menuItemDao = new MenuItemDaoImpl();
        MenuItem menuItem = menuItemDao.getMenuItemById(itemId);

        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Enforce "one restaurant per order": if cart has items from a
        // different restaurant, clear it before adding the new item.
        Integer cartRestaurantId = (Integer) session.getAttribute("cartRestaurantId");
        if (cartRestaurantId != null && cartRestaurantId != restaurantId) {
            cart.clear();
        }
        session.setAttribute("cartRestaurantId", restaurantId);

        // Check if item already in cart -> increment quantity instead of duplicating
        boolean found = false;
        for (CartItem ci : cart) {
            if (ci.getMenuItem().getItemId() == itemId) {
                ci.setQuantity(ci.getQuantity() + 1);
                found = true;
                break;
            }
        }
        if (!found) {
            cart.add(new CartItem(menuItem, 1));
        }

        session.setAttribute("cart", cart);

        // Go back to the same menu page after adding
        response.sendRedirect("menu?restaurantId=" + restaurantId);
    }
}