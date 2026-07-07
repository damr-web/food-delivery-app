package com.fooddelivery.model;

public class MenuItem {
    private int itemId;
    private int restaurantId;
    private String itemName;
    private double price;
    private String description;
    private String imageUrl; // Added the new image property!

    public MenuItem() {}

    // Updated constructor to include imageUrl
    public MenuItem(int itemId, int restaurantId, String itemName, double price, String description, String imageUrl) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    // New Getter and Setter for the image
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}