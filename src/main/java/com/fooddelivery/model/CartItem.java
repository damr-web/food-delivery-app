package com.fooddelivery.model;

// Lives only in session memory — never saved to the database.
// Wraps a MenuItem together with how many the user wants.
public class CartItem {
    private MenuItem menuItem;
    private int quantity;

    public CartItem(MenuItem menuItem, int quantity) {
        this.menuItem = menuItem;
        this.quantity = quantity;
    }

    public MenuItem getMenuItem() { return menuItem; }
    public void setMenuItem(MenuItem menuItem) { this.menuItem = menuItem; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    // Convenience method used directly in JSP: item.getSubtotal()
    public double getSubtotal() {
        return menuItem.getPrice() * quantity;
    }
}