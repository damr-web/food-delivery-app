<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Order History</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(-45deg, #0f172a, #312e81, #701a75, #4c1d95);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: white;
            min-height: 100vh;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            border-left: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
        }

        .glass-nav {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .glass-badge {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body class="flex flex-col relative overflow-x-hidden">

    <div class="fixed top-1/4 left-1/4 w-96 h-96 bg-purple-500/20 rounded-full filter blur-[120px] animate-pulse z-0 pointer-events-none"></div>

    <nav class="glass-nav sticky top-0 z-50 text-white">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-6 font-medium text-white/80">
                <a href="restaurants" class="hover:text-white transition">Home</a>
                <a href="cart" class="hover:text-white transition">Cart</a>
                <a href="order-history" class="text-white border-b-2 border-orange-500 pb-1">My Orders</a>
                <a href="logout" class="hover:text-red-400 transition ml-4">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-4xl mx-auto w-full px-6 py-12 flex-grow relative z-10">
        
        <div class="flex justify-between items-end mb-8">
            <div>
                <a href="restaurants" class="text-white/60 hover:text-orange-400 font-medium flex items-center mb-4 transition w-max">
                    &larr; Back to Dashboard
                </a>
                <h1 class="text-4xl font-extrabold text-white tracking-tight drop-shadow-md">Your Past Orders</h1>
            </div>
        </div>

        <%
            @SuppressWarnings("unchecked")
            List<Order> orders = (List<Order>) request.getAttribute("orders");
        %>

        <% if (orders == null || orders.isEmpty()) { %>
            <div class="glass-panel rounded-3xl p-16 text-center">
                <svg class="w-20 h-20 mx-auto text-white/40 mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>
                <h2 class="text-2xl font-bold text-white mb-2">No orders yet</h2>
                <p class="text-white/60 mb-6">You haven't placed any orders. Time to find something delicious!</p>
                <a href="restaurants" class="inline-block px-8 py-3 rounded-xl font-semibold text-white bg-white/10 hover:bg-white/20 border border-white/10 transition-all">
                    Browse Restaurants
                </a>
            </div>
        <% } else { %>
            <div class="space-y-5">
                <% for (Order o : orders) { %>
                    <div class="glass-panel rounded-2xl p-6 flex flex-col sm:flex-row justify-between items-start sm:items-center hover:bg-white/5 transition-colors duration-300">
                        <div class="mb-4 sm:mb-0">
                            <div class="flex items-center space-x-3 mb-2">
                                <h3 class="text-xl font-bold text-white">Order #<%= o.getOrderId() %></h3>
                                <span class="glass-badge px-3 py-1 text-xs font-bold rounded-full text-white uppercase tracking-wide shadow-sm">
                                    <%= o.getStatus() %>
                                </span>
                            </div>
                            <p class="text-white/60 text-sm flex items-center">
                                <svg class="w-4 h-4 mr-1.5 text-white/40" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                Placed on <%= o.getOrderDate() %>
                            </p>
                        </div>
                        <div class="text-left sm:text-right w-full sm:w-auto border-t sm:border-0 border-white/10 pt-4 sm:pt-0 mt-2 sm:mt-0">
                            <span class="block text-2xl font-extrabold text-white mb-2">
                                ₹<%= String.format("%.2f", o.getTotalAmount()) %>
                            </span>
                            <a href="order-details?orderId=<%= o.getOrderId() %>" class="inline-flex items-center font-semibold text-orange-400 hover:text-orange-300 transition-colors group">
                                View Details 
                                <span class="transform group-hover:translate-x-1 transition-transform ml-1">&rarr;</span>
                            </a>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>

    </main>
</body>
</html>