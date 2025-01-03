import 'package:go_router/go_router.dart';
import 'package:toko_rame/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:toko_rame/features/products/presentation/pages/product_detail_page.dart';
import 'package:toko_rame/features/products/presentation/pages/products_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        name:
            'onboarding', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name:
            'home', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const ProductsPage(),
      ),
      GoRoute(
        name:
            'product', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailPage(
            productId: id,
          );
        },
      ),
    ],
  );
}
