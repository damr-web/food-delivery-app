<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Order" %>
<%@ page import="com.fooddelivery.model.OrderItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Order Confirmed</title>
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
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .glass-btn {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        .glass-btn:hover { background: rgba(255, 255, 255, 0.2); }
        .btn-glow {
            background: linear-gradient(135deg, #f97316 0%, #fb923c 100%);
            box-shadow: 0 0 15px rgba(249, 115, 22, 0.4);
            transition: all 0.3s ease;
        }
        .btn-glow:hover {
            box-shadow: 0 0 25px rgba(249, 115, 22, 0.6);
            transform: translateY(-2px);
        }
        @media print {
            body { background: white !important; animation: none; color: black; }
        }
    </style>
</head>
<body class="flex flex-col relative overflow-x-hidden print:bg-white">

    <div class="fixed top-20 right-20 w-[400px] h-[400px] bg-green-500/20 rounded-full filter blur-[150px] animate-pulse z-0 pointer-events-none print:hidden"></div>

    <nav class="glass-nav sticky top-0 z-50 text-white print:hidden">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-6 font-medium text-white/80">
                <a href="restaurants" class="hover:text-white transition">Home</a>
                <a href="order-history" class="hover:text-white transition">My Orders</a>
                <a href="logout" class="hover:text-red-400 transition ml-4">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-3xl mx-auto w-full px-6 py-12 flex-grow relative z-10 print:py-0 print:px-0">

        <%
            Order order = (Order) request.getAttribute("order");
            @SuppressWarnings("unchecked")
            List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
        %>

        <div class="glass-panel rounded-3xl overflow-hidden mb-8 print:shadow-none print:border-none print:mb-0 print:bg-white">
            
            <div class="bg-white/10 px-8 py-10 text-center border-b border-white/10 print:bg-transparent print:border-b-2 print:border-gray-200">
                <div class="w-20 h-20 mx-auto bg-green-400/20 rounded-full flex items-center justify-center mb-4 border border-green-400/30 print:hidden">
                    <svg class="w-10 h-10 text-green-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
                <h1 class="text-3xl font-extrabold text-white tracking-tight mb-2 drop-shadow-md print:text-gray-900">Order Confirmed!</h1>
                <p class="text-green-300 font-medium text-lg print:text-gray-600">Thank you! Your food is currently being prepared.</p>
            </div>

            <div class="p-8 print:p-4">
                <div class="bg-black/20 rounded-2xl p-6 mb-8 border border-white/10 print:bg-transparent print:border-2 print:border-gray-200">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <p class="text-sm font-semibold text-white/50 uppercase tracking-wider mb-1 print:text-gray-500">Order Number</p>
                            <p class="text-lg font-bold text-white print:text-gray-900">#<%= order.getOrderId() %></p>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-white/50 uppercase tracking-wider mb-1 print:text-gray-500">Status</p>
                            <span class="inline-block px-3 py-1 text-xs font-bold rounded-full bg-orange-400/20 border border-orange-400/30 text-orange-300 uppercase tracking-wide print:bg-transparent print:border-gray-300 print:text-gray-800">
                                <%= order.getStatus() %>
                            </span>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-white/50 uppercase tracking-wider mb-1 print:text-gray-500">Payment Method</p>
                            <p class="font-medium text-white print:text-gray-900"><%= order.getPaymentMethod() %></p>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-white/50 uppercase tracking-wider mb-1 print:text-gray-500">Delivering To</p>
                            <p class="font-medium text-white leading-relaxed print:text-gray-900"><%= order.getDeliveryAddress() %></p>
                        </div>
                    </div>
                </div>

                <h3 class="text-xl font-bold text-white mb-4 border-b border-white/10 pb-3 print:border-gray-200 print:text-gray-900">Order Details</h3>
                <ul class="divide-y divide-white/10 print:divide-gray-200 mb-6">
                    <% for (OrderItem oi : items) { %>
                        <li class="py-4 flex justify-between items-center">
                            <div>
                                <h4 class="text-lg font-bold text-white print:text-gray-900"><%= oi.getItemName() %></h4>
                                <p class="text-white/50 text-sm mt-1 print:text-gray-600">Qty: <span class="font-semibold text-white/90 print:text-gray-800"><%= oi.getQuantity() %></span></p>
                            </div>
                            <div class="text-right">
                                <span class="block text-lg font-bold text-white print:text-gray-900">
                                    ₹<%= String.format("%.2f", oi.getSubtotal()) %>
                                </span>
                            </div>
                        </li>
                    <% } %>
                </ul>

                <div class="border-t-2 border-dashed border-white/20 pt-6 mt-4 flex justify-between items-end print:border-gray-300">
                    <span class="text-white/60 font-bold uppercase tracking-wider print:text-gray-600">Total Paid</span>
                    <span class="text-4xl font-extrabold text-white drop-shadow-md print:text-gray-900 print:drop-shadow-none">
                        ₹<%= String.format("%.2f", order.getTotalAmount()) %>
                    </span>
                </div>
            </div>
        </div>

        <div class="flex flex-col sm:flex-row justify-center items-center space-y-4 sm:space-y-0 sm:space-x-4 print:hidden">
            <a href="restaurants" class="w-full sm:w-auto px-8 py-4 rounded-xl font-bold text-lg text-white btn-glow text-center">
                &larr; Order from another restaurant
            </a>
            <button onclick="window.print()" class="w-full sm:w-auto px-8 py-4 rounded-xl font-bold text-lg text-white glass-btn flex items-center justify-center">
                <svg class="w-6 h-6 mr-2 text-white/70" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"></path></svg>
                Print Receipt
            </button>
        </div>

    </main>
</body>
</html>