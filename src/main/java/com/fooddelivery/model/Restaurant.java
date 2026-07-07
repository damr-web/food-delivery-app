package com.fooddelivery.model;

public class Restaurant {

    private int restaurantId;
    private String name;
    private String cuisine;
    private String address;
    private String imageUrl;

    public Restaurant() {
    }

    public Restaurant(int restaurantId, String name, String cuisine, String address, String imageUrl) {
        this.restaurantId = restaurantId;
        this.name = name;
        this.cuisine = cuisine;
        this.address = address;
        this.imageUrl = imageUrl;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}