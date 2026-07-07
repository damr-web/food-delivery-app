<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Create Account</title>
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
            box-shadow: 0 0 20px rgba(249, 115, 22, 0.4);
            transition: all 0.3s ease;
        }
        .btn-glow:hover {
            box-shadow: 0 0 30px rgba(249, 115, 22, 0.6);
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="flex flex-col justify-center items-center p-6 py-12 relative overflow-hidden">

    <div class="absolute top-[-5%] right-[-5%] w-96 h-96 bg-purple-500 rounded-full mix-blend-screen filter blur-[120px] opacity-40 animate-pulse"></div>
    <div class="absolute bottom-[10%] left-[-10%] w-96 h-96 bg-orange-500 rounded-full mix-blend-screen filter blur-[120px] opacity-30 animate-pulse" style="animation-delay: 1.5s;"></div>

    <div class="mb-8 text-center relative z-10">
        <h1 class="text-3xl font-extrabold tracking-tight mb-2 text-white drop-shadow-lg">Srinivas Eats</h1>
        <p class="text-white/60 font-medium tracking-wide">Join us for the best meals in town.</p>
    </div>

    <div class="w-full max-w-lg glass-panel p-8 sm:p-10 relative z-10">
        
        <h2 class="text-2xl font-bold text-white mb-6 text-center tracking-wide">Create an Account</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-500/20 border border-red-500/30 text-red-200 px-4 py-3 rounded-xl mb-6 text-sm flex items-center backdrop-blur-md">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="signup" method="post" class="space-y-4">
            <div>
                <label class="block text-white/80 font-medium mb-1 text-sm" for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="John Doe" required class="w-full px-4 py-3 rounded-xl glass-input">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-white/80 font-medium mb-1 text-sm" for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required class="w-full px-4 py-3 rounded-xl glass-input">
                </div>
                <div>
                    <label class="block text-white/80 font-medium mb-1 text-sm" for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="9876543210" required class="w-full px-4 py-3 rounded-xl glass-input">
                </div>
            </div>

            <div>
                <label class="block text-white/80 font-medium mb-1 text-sm" for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required class="w-full px-4 py-3 rounded-xl glass-input">
            </div>

            <div>
                <label class="block text-white/80 font-medium mb-1 text-sm" for="address">Delivery Address</label>
                <textarea id="address" name="address" rows="2" placeholder="Street name, City, Area" required class="w-full px-4 py-3 rounded-xl glass-input resize-none"></textarea>
            </div>

            <div class="pt-4">
                <button type="submit" class="w-full py-4 rounded-xl font-bold text-white btn-glow tracking-wide text-lg">
                    Create Account
                </button>
            </div>
        </form>

        <div class="mt-6 pt-6 border-t border-white/10 text-center">
            <p class="text-white/60 text-sm">
                Already have an account? 
                <a href="login.jsp" class="font-semibold text-orange-400 hover:text-orange-300 transition-colors ml-1">Sign in instead</a>
            </p>
        </div>
    </div>
</body>
</html>