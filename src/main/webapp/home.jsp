<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.fooddelivery.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Welcome</title>
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

        .glass-btn {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        
        .glass-btn:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
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
<body class="flex flex-col justify-center items-center p-6 relative overflow-hidden">

    <div class="absolute top-[10%] left-[20%] w-96 h-96 bg-purple-500 rounded-full mix-blend-screen filter blur-[120px] opacity-40 animate-pulse"></div>
    <div class="absolute bottom-[10%] right-[20%] w-96 h-96 bg-orange-500 rounded-full mix-blend-screen filter blur-[120px] opacity-30 animate-pulse" style="animation-delay: 1.5s;"></div>

    <div class="w-full max-w-md glass-panel p-8 sm:p-10 text-center relative z-10 transition-all duration-300 hover:shadow-2xl">
        
        <div class="w-24 h-24 mx-auto rounded-full bg-white/5 border border-white/20 flex items-center justify-center text-orange-400 mb-6 shadow-[0_0_30px_rgba(249,115,22,0.2)]">
            <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
            </svg>
        </div>

        <h2 class="text-3xl font-extrabold text-white tracking-tight mb-2 drop-shadow-md">
            Welcome, <%= user.getName().split(" ")[0] %>!
        </h2>
        <p class="text-white/60 text-sm mb-10">
            Logged in as <span class="font-medium text-white/90"><%= user.getEmail() %></span>
        </p>

        <div class="space-y-4">
            <a href="restaurants" 
               class="block w-full py-4 rounded-xl font-bold text-white btn-glow text-lg">
                Browse Restaurants &rarr;
            </a>
            
            <a href="order-history" 
               class="block w-full py-4 rounded-xl font-bold text-white/90 glass-btn text-lg">
                My Order History
            </a>
        </div>

        <hr class="my-8 border-white/10">

        <div class="text-center">
            <a href="logout" class="text-sm font-semibold text-red-400 hover:text-red-300 transition-colors flex items-center justify-center">
                <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                </svg>
                Sign Out Securely
            </a>
        </div>
        
    </div>

</body>
</html>