<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            /* Animated Mesh Gradient Background */
            background: linear-gradient(-45deg, #0f172a, #312e81, #701a75, #4c1d95);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: white;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* The Ultimate Glassmorphism Class */
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

        /* Glass Inputs */
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

        .glass-input::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        /* Premium Glow Button */
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
<body class="min-h-screen flex flex-col justify-center items-center p-6 relative overflow-hidden">

    <div class="absolute top-[-10%] left-[-10%] w-96 h-96 bg-purple-500 rounded-full mix-blend-screen filter blur-[100px] opacity-40 animate-pulse"></div>
    <div class="absolute bottom-[-10%] right-[-10%] w-96 h-96 bg-orange-500 rounded-full mix-blend-screen filter blur-[100px] opacity-40 animate-pulse" style="animation-delay: 2s;"></div>

    <div class="mb-10 text-center relative z-10">
        <h1 class="text-4xl font-extrabold tracking-tight mb-2 text-white drop-shadow-lg">
            Srinivas Eats
        </h1>
        <p class="text-white/60 font-medium tracking-wide">Premium Food Delivery</p>
    </div>

    <div class="w-full max-w-md glass-panel p-8 sm:p-10 relative z-10">
        
        <h2 class="text-2xl font-bold text-white mb-8 text-center tracking-wide">Welcome Back</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-500/20 border border-red-500/30 text-red-200 px-4 py-3 rounded-xl mb-6 text-sm flex items-center backdrop-blur-md">
                <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <div class="bg-green-500/20 border border-green-500/30 text-green-200 px-4 py-3 rounded-xl mb-6 text-sm flex items-center backdrop-blur-md">
                <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form action="login" method="post" class="space-y-6">
            
            <div>
                <label class="block text-white/80 font-medium mb-2 text-sm" for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required
                       class="w-full px-5 py-3.5 rounded-xl glass-input">
            </div>

            <div>
                <label class="block text-white/80 font-medium mb-2 text-sm" for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required
                       class="w-full px-5 py-3.5 rounded-xl glass-input">
            </div>

            <div class="pt-4">
                <button type="submit" class="w-full py-4 rounded-xl font-bold text-white btn-glow tracking-wide text-lg">
                    Sign In
                </button>
            </div>
            
        </form>

        <div class="mt-8 pt-6 border-t border-white/10 text-center">
            <p class="text-white/60 text-sm">
                New here? 
                <a href="signup.jsp" class="font-semibold text-orange-400 hover:text-orange-300 transition-colors ml-1">
                    Create an account
                </a>
            </p>
        </div>

    </div>
</body>
</html>