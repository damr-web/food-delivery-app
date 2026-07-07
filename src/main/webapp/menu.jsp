<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.MenuItem" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>
<%@ page import="com.fooddelivery.model.Review" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Menu</title>
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

        .glass-input {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }
        
        .glass-input:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
            outline: none;
        }

        .glass-input::placeholder { color: rgba(255, 255, 255, 0.4); }

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

    <div class="fixed top-1/4 left-10 w-96 h-96 bg-purple-600/30 rounded-full filter blur-[120px] animate-pulse z-0 pointer-events-none"></div>
    <div class="fixed bottom-10 right-10 w-[500px] h-[500px] bg-orange-600/20 rounded-full filter blur-[150px] animate-pulse z-0 pointer-events-none" style="animation-delay: 2s;"></div>

    <nav class="glass-nav sticky top-0 z-50 text-white">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-6 font-medium text-white/80">
                <a href="restaurants" class="hover:text-white transition">Home</a>
                <a href="cart" class="hover:text-white transition">Cart</a>
                <a href="logout" class="hover:text-red-400 transition ml-4">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto w-full px-6 py-8 flex-grow relative z-10">

        <%
            Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
            @SuppressWarnings("unchecked")
            List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
        %>

        <a href="restaurants" class="inline-flex items-center text-white/60 hover:text-orange-400 font-medium transition mb-6">
            &larr; Back to all restaurants
        </a>

        <% if (restaurant == null) { %>
            <div class="glass-panel rounded-2xl p-12 text-center">
                <h2 class="text-2xl font-bold text-white">Restaurant not found.</h2>
            </div>
        <% } else { %>
            
            <div class="glass-panel rounded-3xl overflow-hidden mb-10 flex flex-col md:flex-row">
                <div class="md:w-1/3 h-48 md:h-auto bg-black/40 relative">
                    <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>" class="w-full h-full object-cover opacity-80">
                </div>
                <div class="md:w-2/3 p-8 flex flex-col justify-center">
                    <div class="flex justify-between items-start mb-2">
                        <h1 class="text-4xl font-extrabold text-white tracking-tight"><%= restaurant.getName() %></h1>
                        <span class="inline-block px-4 py-1.5 bg-white/10 text-white text-sm font-bold rounded-full uppercase tracking-wide border border-white/10">
                            <%= restaurant.getCuisine() %>
                        </span>
                    </div>
                    <p class="text-white/60 flex items-center mt-2 mb-6 text-lg">
                        <svg class="w-5 h-5 mr-2 text-white/40" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                        <%= restaurant.getAddress() %>
                    </p>
                    <div>
                        <a href="cart" class="inline-flex items-center px-6 py-3 rounded-xl font-bold text-white bg-white/10 hover:bg-white/20 border border-white/10 transition-colors">
                            <svg class="w-5 h-5 mr-2 text-orange-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            View Cart & Checkout
                        </a>
                    </div>
                </div>
            </div>

            <h2 class="text-2xl font-bold text-white mb-6 drop-shadow-md">Menu Items</h2>
            
            <% if (menuItems == null || menuItems.isEmpty()) { %>
                <div class="text-center py-12 glass-panel rounded-2xl">
                    <p class="text-white/60 text-lg">This restaurant hasn't added any menu items yet.</p>
                </div>
            <% } else { %>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <% for (MenuItem item : menuItems) { %>
                        <div class="glass-panel rounded-2xl flex flex-col overflow-hidden group">
                            <div class="w-full h-48 bg-black/40 relative overflow-hidden">
                                <img src="<%= item.getImageUrl() %>" alt="<%= item.getItemName() %>" 
                                     class="w-full h-full object-cover opacity-90 group-hover:scale-105 group-hover:opacity-100 transition-all duration-500">
                            </div>
                            <div class="p-6 flex flex-col flex-grow">
                                <div class="flex justify-between items-start mb-2">
                                    <h3 class="text-xl font-bold text-white pr-2"><%= item.getItemName() %></h3>
                                    <span class="text-lg font-extrabold text-white bg-white/10 px-3 py-1 rounded-lg border border-white/10">
                                        ₹<%= String.format("%.2f", item.getPrice()) %>
                                    </span>
                                </div>
                                <p class="text-white/60 text-sm mb-6 line-clamp-2"><%= item.getDescription() %></p>
                                
                                <form action="add-to-cart" method="post" class="mt-auto">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>"/>
                                    <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>"/>
                                    <button type="submit" class="w-full py-3 rounded-xl font-bold text-white bg-white/10 hover:bg-orange-500 hover:border-orange-500 border border-white/10 transition-colors flex items-center justify-center">
                                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                        Add to Cart
                                    </button>
                                </form>
                            </div>
                        </div>
                    <% } %>
                </div>
            <% } %>

            <hr class="my-12 border-white/10">
            
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-10">
                <div class="lg:col-span-1">
                    <div class="glass-panel rounded-2xl p-6 sticky top-24">
                        <h3 class="text-xl font-bold text-white mb-4">Share Your Experience</h3>
                        <form action="submit-review" method="post" class="space-y-4">
                            <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>" />
                            <div>
                                <label class="block text-white/80 font-medium mb-2 text-sm">Rating</label>
                                <select name="rating" required class="w-full px-4 py-3 rounded-xl glass-input cursor-pointer appearance-none bg-transparent">
                                    <option value="5" class="text-gray-900">⭐⭐⭐⭐⭐ (5 - Excellent)</option>
                                    <option value="4" class="text-gray-900">⭐⭐⭐⭐ (4 - Very Good)</option>
                                    <option value="3" class="text-gray-900">⭐⭐⭐ (3 - Average)</option>
                                    <option value="2" class="text-gray-900">⭐⭐ (2 - Poor)</option>
                                    <option value="1" class="text-gray-900">⭐ (1 - Terrible)</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-white/80 font-medium mb-2 text-sm">Your Review</label>
                                <textarea name="comment" rows="4" required placeholder="What did you like or dislike?" 
                                          class="w-full px-4 py-3 rounded-xl glass-input resize-none"></textarea>
                            </div>
                            <button type="submit" class="w-full py-3 rounded-xl font-bold text-white btn-glow transition-all">
                                Submit Review
                            </button>
                        </form>
                    </div>
                </div>
                
                <div class="lg:col-span-2 space-y-4">
                    <h3 class="text-2xl font-bold text-white mb-4 drop-shadow-md">Customer Reviews</h3>
                    <%
                        @SuppressWarnings("unchecked")
                        List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                        if (reviews == null || reviews.isEmpty()) {
                    %>
                        <div class="p-8 glass-panel rounded-2xl text-center">
                            <p class="text-white/60 font-medium">No reviews yet. Be the first to leave one!</p>
                        </div>
                    <% } else {
                            for (Review rev : reviews) {
                                String stars = "";
                                for(int i=0; i<rev.getRating(); i++) stars += "⭐";
                    %>
                        <div class="glass-panel p-6 rounded-2xl">
                            <div class="flex justify-between items-start mb-2">
                                <div>
                                    <h4 class="font-bold text-white"><%= rev.getUserName() %></h4>
                                    <div class="text-sm mt-0.5"><%= stars %></div>
                                </div>
                            </div>
                            <p class="text-white/80 mt-3 text-sm leading-relaxed">"<%= rev.getComment() %>"</p>
                        </div>
                    <%      }
                        }
                    %>
                </div>
            </div>

        <% } %>

    </main>
</body>
</html>