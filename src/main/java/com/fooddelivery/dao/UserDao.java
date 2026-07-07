package com.fooddelivery.dao;

import com.fooddelivery.model.User;

// Declares WHAT operations exist. No JDBC code here — that's UserDaoImpl's job.
// Controllers depend on this interface, not on the implementation directly.
public interface UserDao {
    boolean registerUser(User user);      // used by Signup
    User getUserByEmail(String email);    // used by Login
    User getUserById(int userId);
    boolean updateUser(User user);
    boolean deleteUser(int userId);
}