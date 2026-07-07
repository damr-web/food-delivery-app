<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Dashboard</title>
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

        /* Standard Glass Panel */
        .glass-panel {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            border-left: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
        }

        /* Glass Navbar (No rounded corners) */
        .glass-nav {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
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

    <div class="fixed top-20 left-10 w-96 h-96 bg-purple-600/30 rounded-full filter blur-[120px] animate-pulse z-0 pointer-events-none"></div>
    <div class="fixed bottom-20 right-10 w-[500px] h-[500px] bg-orange-600/20 rounded-full filter blur-[150px] animate-pulse z-0 pointer-events-none" style="animation-delay: 2s;"></div>

    <nav class="glass-nav sticky top-0 z-50 text-white">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-6 font-medium text-white/80">
                <a href="restaurants" class="text-white border-b-2 border-orange-500 pb-1">Home</a>
                <a href="cart" class="hover:text-white transition">Cart</a>
                <a href="order-history" class="hover:text-white transition">My Orders</a>
                <a href="logout" class="hover:text-red-400 transition ml-4">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto w-full px-6 py-12 flex-grow relative z-10">
        
        <div class="mb-10 text-center sm:text-left">
            <h2 class="text-4xl font-extrabold text-white tracking-tight drop-shadow-lg mb-2">Explore Restaurants</h2>
            <p class="text-white/60 text-lg">Find the best food in your area.</p>
        </div>

        <%
            @SuppressWarnings("unchecked")
            List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
        %>

        <% if (restaurants == null || restaurants.isEmpty()) { %>
            <div class="glass-panel rounded-3xl p-16 text-center">
                <h3 class="text-2xl font-bold text-white mb-2">No restaurants available right now.</h3>
                <p class="text-white/50">Please check back later!</p>
            </div>
        <% } else { %>
            
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <% for (Restaurant r : restaurants) { %>
                    
                    <div class="glass-panel rounded-3xl overflow-hidden hover:-translate-y-2 transition-all duration-300 group flex flex-col">
                        
                        <div class="w-full h-48 relative overflow-hidden">
                            <div class="absolute inset-0 bg-black/20 group-hover:bg-transparent transition duration-500 z-10"></div>
                            <img src="<%= r.getImageUrl() %>" alt="<%= r.getName() %>" 
                                 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                                 onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80';">
                        </div>

                        <div class="p-6 flex flex-col flex-grow">
                            <div class="flex justify-between items-start mb-2">
                                <h3 class="text-2xl font-bold text-white group-hover:text-orange-400 transition-colors">
                                    <%= r.getName() %>
                                </h3>
                                <span class="px-3 py-1 bg-white/10 text-white/90 text-xs font-bold rounded-full uppercase tracking-wide border border-white/10">
                                    <%= r.getCuisine() %>
                                </span>
                            </div>
                            
                            <p class="text-white/60 flex items-center mb-6 text-sm">
                                <svg class="w-4 h-4 mr-1 text-white/40" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                                <%= r.getAddress() %>
                            </p>
                            
                            <div class="mt-auto pt-4 border-t border-white/10">
                                <a href="menu?restaurantId=<%= r.getRestaurantId() %>" 
                                   class="block w-full py-3 rounded-xl font-bold text-white btn-glow text-center">
                                    View Menu &rarr;
                                </a>
                            </div>
                        </div>
                    </div>

                <% } %>
            </div>

        <% } %>

    </main>
</body>
</html>