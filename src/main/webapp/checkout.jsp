<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Checkout</title>
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
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            border-left: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
            border-radius: 24px;
        }

        .glass-nav {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(20px);
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
        
        /* Ensures the dropdown options are readable against the dark theme */
        .glass-input option {
            background-color: #1e1b4b;
            color: white;
        }

        .btn-glow {
            background: linear-gradient(135deg, #f97316 0%, #fb923c 100%);
            box-shadow: 0 0 20px rgba(249, 115, 22, 0.4);
            transition: all 0.3s ease;
        }
        .btn-glow:hover {
            box-shadow: 0 0 30px rgba(249, 115, 22, 0.6);
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="flex flex-col relative overflow-x-hidden">

    <div class="fixed top-1/4 right-1/4 w-[400px] h-[400px] bg-purple-500/20 rounded-full mix-blend-screen filter blur-[150px] animate-pulse z-0 pointer-events-none"></div>

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

    <main class="max-w-2xl mx-auto w-full px-6 py-12 flex-grow relative z-10">
        
        <div class="mb-8">
            <a href="cart" class="text-white/60 hover:text-orange-400 font-medium flex items-center transition mb-4 w-max">
                &larr; Back to Cart
            </a>
            <h1 class="text-4xl font-extrabold text-white tracking-tight drop-shadow-md">Checkout</h1>
            <p class="text-white/60 mt-2 text-lg">Enter your delivery details to complete your order.</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-500/20 border border-red-500/30 text-red-200 px-5 py-4 rounded-xl mb-6 flex items-center backdrop-blur-md">
                <svg class="w-5 h-5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                <span class="block sm:inline font-medium"><%= request.getAttribute("error") %></span>
            </div>
        <% } %>

        <div class="glass-panel p-8 sm:p-10">
            <form action="checkout" method="post" class="space-y-6">
                
                <div>
                    <label class="block text-white/80 font-semibold mb-2 text-sm" for="address">Delivery Address</label>
                    <input type="text" id="address" name="address" required 
                           class="w-full px-5 py-3.5 rounded-xl glass-input" 
                           placeholder="e.g., 123 Main Street, Apt 4B">
                </div>

                <div>
                    <label class="block text-white/80 font-semibold mb-2 text-sm" for="paymentMethod">Payment Method</label>
                    <div class="relative">
                        <select id="paymentMethod" name="paymentMethod" 
                                class="w-full px-5 py-3.5 rounded-xl glass-input appearance-none cursor-pointer">
                            <option value="Cash on Delivery">Cash on Delivery</option>
                            <option value="Card">Credit / Debit Card</option>
                            <option value="UPI">UPI</option>
                        </select>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-white/50">
                            <svg class="fill-current h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                        </div>
                    </div>
                </div>

                <div class="pt-6 border-t border-white/10 mt-6">
                    <button type="submit" class="w-full py-4 rounded-xl font-bold text-lg text-white btn-glow tracking-wide">
                        Confirm & Place Order
                    </button>
                </div>

            </form>
        </div>

    </main>
</body>
</html>