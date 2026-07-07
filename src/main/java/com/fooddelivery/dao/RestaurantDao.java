package com.fooddelivery.dao;

import com.fooddelivery.model.Restaurant;
import java.util.List;

public interface RestaurantDao {

    // Fetch all restaurants
    List<Restaurant> getAllRestaurants();

    // Fetch a restaurant by its ID
    Restaurant getRestaurantById(int restaurantId);
}