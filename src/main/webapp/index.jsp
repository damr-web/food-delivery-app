<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Premium Food Delivery</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            border-left: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
        }

        .glass-nav {
            background: rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
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
            box-shadow: 0 0 20px rgba(249, 115, 22, 0.5);
            transition: all 0.3s ease;
        }
        
        .btn-glow:hover {
            box-shadow: 0 0 35px rgba(249, 115, 22, 0.7);
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="flex flex-col relative overflow-x-hidden">

    <!-- Deep Background Orbs for 3D depth -->
    <div class="absolute top-[-10%] left-[-10%] w-[500px] h-[500px] bg-purple-600 rounded-full mix-blend-screen filter blur-[150px] opacity-40 animate-pulse pointer-events-none"></div>
    <div class="absolute bottom-[-10%] right-[-10%] w-[600px] h-[600px] bg-orange-600 rounded-full mix-blend-screen filter blur-[150px] opacity-30 animate-pulse pointer-events-none" style="animation-delay: 2s;"></div>

    <!-- Transparent Landing Navbar -->
    <nav class="glass-nav sticky top-0 z-50 text-white">
        <div class="max-w-7xl mx-auto px-6 py-5 flex justify-between items-center">
            <h1 class="text-3xl font-extrabold tracking-tight drop-shadow-md">Srinivas Eats</h1>
            <div class="space-x-4 font-medium flex items-center">
                <a href="login.jsp" class="text-white/80 hover:text-white transition px-4 py-2">Sign In</a>
                <a href="signup.jsp" class="btn-glow px-6 py-2.5 rounded-full text-white font-bold transition-all">Get Started</a>
            </div>
        </div>
    </nav>

    <!-- Main Hero Section -->
    <main class="max-w-7xl mx-auto w-full px-6 py-20 flex-grow flex flex-col justify-center items-center relative z-10 text-center">
        
        <span class="px-4 py-1.5 glass-panel rounded-full text-orange-400 font-semibold text-sm tracking-wide mb-6 inline-block border border-orange-500/30">
            ✨ The future of food delivery is here
        </span>

        <h1 class="text-5xl md:text-7xl font-extrabold text-white tracking-tight mb-6 leading-tight drop-shadow-lg max-w-4xl">
            Cravings delivered, <br />
            <span class="text-transparent bg-clip-text bg-gradient-to-r from-orange-400 to-pink-500">faster than ever.</span>
        </h1>
        
        <p class="text-xl text-white/70 max-w-2xl mx-auto mb-12 leading-relaxed">
            Discover the best restaurants in your city. Order your favorite meals with a seamless, premium experience built for you.
        </p>

        <div class="flex flex-col sm:flex-row gap-5 justify-center w-full max-w-md mx-auto sm:max-w-none">
            <a href="restaurants" class="btn-glow px-10 py-4 rounded-2xl font-bold text-xl text-white transition-all text-center flex items-center justify-center">
                Explore Menu
                <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </a>
            <a href="login.jsp" class="glass-btn px-10 py-4 rounded-2xl font-bold text-xl text-white transition-all text-center">
                Sign In
            </a>
        </div>

        <!-- 3-Column Glass Feature Grid -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 w-full mt-24">
            
            <div class="glass-panel p-8 rounded-3xl text-left hover:-translate-y-2 transition-transform duration-300">
                <div class="w-14 h-14 bg-orange-500/20 rounded-2xl flex items-center justify-center mb-6 border border-orange-500/30">
                    <svg class="w-7 h-7 text-orange-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
                </div>
                <h3 class="text-xl font-bold text-white mb-3">Lightning Fast</h3>
                <p class="text-white/60 leading-relaxed">Hot and fresh meals delivered straight to your door in record time.</p>
            </div>

            <div class="glass-panel p-8 rounded-3xl text-left hover:-translate-y-2 transition-transform duration-300">
                <div class="w-14 h-14 bg-pink-500/20 rounded-2xl flex items-center justify-center mb-6 border border-pink-500/30">
                    <svg class="w-7 h-7 text-pink-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2v10z"></path></svg>
                </div>
                <h3 class="text-xl font-bold text-white mb-3">Verified Reviews</h3>
                <p class="text-white/60 leading-relaxed">Read real feedback from our community before you decide what to eat.</p>
            </div>

            <div class="glass-panel p-8 rounded-3xl text-left hover:-translate-y-2 transition-transform duration-300">
                <div class="w-14 h-14 bg-purple-500/20 rounded-2xl flex items-center justify-center mb-6 border border-purple-500/30">
                    <svg class="w-7 h-7 text-purple-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path></svg>
                </div>
                <h3 class="text-xl font-bold text-white mb-3">Premium Quality</h3>
                <p class="text-white/60 leading-relaxed">We partner exclusively with top-rated restaurants to guarantee excellence.</p>
            </div>

        </div>

    </main>

    <!-- Footer -->
    <footer class="border-t border-white/10 mt-auto relative z-10">
        <div class="max-w-7xl mx-auto px-6 py-8 flex flex-col md:flex-row justify-between items-center">
            <p class="text-white/50 text-sm">© 2026 Srinivas Eats. All rights reserved.</p>
            <div class="flex space-x-4 mt-4 md:mt-0">
                <a href="#" class="text-white/50 hover:text-white transition">Privacy Policy</a>
                <a href="#" class="text-white/50 hover:text-white transition">Terms of Service</a>
            </div>
        </div>
    </footer>

</body>
</html>