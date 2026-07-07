package com.fooddelivery.dbutil;

public class DBTest {
    public static void main(String[] args) throws Exception {
        var conn = com.fooddelivery.dbutil.DBUtil.getConnection();
        System.out.println("Connected: " + !conn.isClosed());
        conn.close();
    }
}  