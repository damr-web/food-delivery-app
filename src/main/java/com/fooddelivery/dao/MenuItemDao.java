package com.fooddelivery.dao;

import com.fooddelivery.model.MenuItem;
import java.util.List;

public interface MenuItemDao {
    List<MenuItem> getMenuByRestaurantId(int restaurantId);
    MenuItem getMenuItemById(int itemId);
}