<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Your Cart</title>
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

        .glass-btn {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        .glass-btn:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .btn-glow {
            background: linear-gradient(135deg, #f97316 0%, #fb923c 100%);
            box-shadow: 0 0 15px rgba(249, 115, 22, 0.4);
            transition: all 0.3s ease;
        }
        .btn-glow:hover {
            box-shadow: 0 0 25px rgba(249, 115, 22, 0.6);
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="flex flex-col relative overflow-x-hidden">

    <div class="fixed top-1/3 right-10 w-96 h-96 bg-orange-500/20 rounded-full filter blur-[120px] animate-pulse z-0 pointer-events-none"></div>

    <nav class="glass-nav sticky top-0 z-50 text-white">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-6 font-medium text-white/80">
                <a href="restaurants" class="hover:text-white transition">Home</a>
                <a href="cart" class="text-white border-b-2 border-orange-500 pb-1">Cart</a>
                <a href="order-history" class="hover:text-white transition">My Orders</a>
                <a href="logout" class="hover:text-red-400 transition ml-4">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-4xl mx-auto w-full px-6 py-12 flex-grow relative z-10">
        
        <div class="flex justify-between items-end mb-8">
            <div>
                <h1 class="text-4xl font-extrabold text-white tracking-tight drop-shadow-md">Your Cart</h1>
                <a href="restaurants" class="text-orange-400 hover:text-orange-300 font-medium flex items-center mt-2 transition">
                    &larr; Back to Restaurants
                </a>
            </div>
        </div>

        <%
            @SuppressWarnings("unchecked")
            List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
            double total = 0;
        %>

        <% if (cart == null || cart.isEmpty()) { %>
            
            <div class="glass-panel rounded-3xl p-16 text-center">
                <svg class="w-20 h-20 mx-auto text-white/40 mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                <h2 class="text-2xl font-bold text-white mb-2">Your cart is empty</h2>
                <p class="text-white/60 mb-6">Looks like you haven't added anything to your cart yet.</p>
                <a href="restaurants" class="inline-block px-8 py-3 rounded-xl font-semibold text-white btn-glow transition-all">
                    Start Browsing
                </a>
            </div>

        <% } else { %>
            
            <div class="glass-panel rounded-3xl overflow-hidden mb-8">
                <ul class="divide-y divide-white/10">
                    <% 
                        for (CartItem ci : cart) {
                            total += ci.getSubtotal();
                    %>
                        <li class="p-6 flex flex-col sm:flex-row sm:justify-between sm:items-center hover:bg-white/5 transition-colors">
                            <div class="flex-grow">
                                <h3 class="text-lg font-bold text-white"><%= ci.getMenuItem().getItemName() %></h3>
                                <p class="text-white/60 text-sm mt-1 mb-4">
                                    ₹<%= String.format("%.2f", ci.getMenuItem().getPrice()) %> each
                                </p>

                                <div class="flex items-center space-x-4">
                                    <form action="update-cart" method="post" class="flex items-center glass-btn rounded-lg overflow-hidden shadow-sm">
                                        <input type="hidden" name="itemId" value="<%= ci.getMenuItem().getItemId() %>">
                                        <button type="submit" name="action" value="decrease" class="px-4 py-1.5 text-white/80 hover:text-white hover:bg-white/10 transition font-bold">-</button>
                                        <input type="text" value="<%= ci.getQuantity() %>" readonly class="w-12 py-1.5 text-center font-bold text-white bg-transparent outline-none pointer-events-none border-x border-white/20">
                                        <button type="submit" name="action" value="increase" class="px-4 py-1.5 text-white/80 hover:text-white hover:bg-white/10 transition font-bold">+</button>
                                    </form>

                                    <form action="remove-cart" method="post">
                                        <input type="hidden" name="itemId" value="<%= ci.getMenuItem().getItemId() %>">
                                        <button type="submit" class="text-red-400 hover:text-red-300 text-sm font-medium flex items-center transition p-2 rounded-lg hover:bg-red-500/20">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                            Remove
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <div class="text-left sm:text-right mt-4 sm:mt-0">
                                <span class="block text-2xl font-extrabold text-white">
                                    ₹<%= String.format("%.2f", ci.getSubtotal()) %>
                                </span>
                            </div>
                        </li>
                    <% } %>
                </ul>
            </div>

            <div class="glass-panel rounded-3xl p-6 md:p-8 flex flex-col md:flex-row justify-between items-center">
                <div class="text-center md:text-left mb-6 md:mb-0">
                    <p class="text-white/60 font-medium uppercase tracking-wider text-sm mb-1">Total Amount</p>
                    <h2 class="text-4xl font-extrabold text-white">₹<%= String.format("%.2f", total) %></h2>
                </div>
                
                <a href="checkout" class="w-full md:w-auto text-center px-10 py-4 rounded-xl font-bold text-lg text-white btn-glow transition-all">
                    Proceed to Checkout &rarr;
                </a>
            </div>

        <% } %>

    </main>
</body>
</html>