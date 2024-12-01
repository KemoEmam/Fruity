import 'package:flutter/material.dart';
import 'package:fruity/core/layout/navigation_bar_layout.dart';
import 'package:fruity/core/layout/testos/cart.dart';
import 'package:fruity/core/layout/testos/products.dart';
import 'package:fruity/core/layout/testos/profile.dart';
import 'package:fruity/core/router/routes.dart';
import 'package:fruity/features/auth/presentation/views/password_view.dart';
import 'package:fruity/features/auth/presentation/views/signin_view.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:fruity/features/home/presentation/views/home_view.dart';
import 'package:fruity/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

//*add the packages: go_router
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '_root');

final router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Oops! Page not found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(Routes.home), // Redirect to home
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  },
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: Routes.signin,
      builder: (context, state) => const SigninView(),
    ),
    GoRoute(
      path: Routes.password,
      builder: (context, state) => const PasswordView(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignupView(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                  path: Routes.nestedBestSelling,
                  builder: (context, state) => const BestSellingView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cart,
              builder: (context, state) => const Cart(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.products,
              builder: (context, state) => const Products(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const Profile(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) => NavigationBarLayout(
        shell: navigationShell,
      ),
    ),
  ],
);
