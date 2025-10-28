import 'package:auto_route/auto_route.dart';

// Auth screens
import '../features/auth/presentation/pages/splash.dart';
import '../features/auth/presentation/pages/login.dart';
import '../features/auth/presentation/pages/signup.dart';
import '../features/auth/presentation/pages/forgot_password.dart';
import '../features/auth/presentation/pages/verification_code.dart';
import '../features/auth/presentation/pages/set_new_password.dart';
import '../features/auth/presentation/pages/sucessfully_reset.dart';
import '../features/auth/presentation/pages/accept_location.dart';
import '../features/auth/presentation/pages/privacy_permission.dart';
import '../features/auth/presentation/pages/onboarding.dart';

// Home screens
import '../features/home/presentation/pages/home.dart';
import '../features/home/presentation/pages/mapview.dart';

// Search screens
import '../features/search/presentation/pages/search.dart';

// Restaurant screens
import '../features/restaurant/presentation/pages/view_restaurant.dart';

// Food screens
import '../features/food/presentation/pages/view_food_details.dart';

// Cart screens
import '../features/cart/presentation/pages/cart.dart';

// Order screens
import '../features/order/presentation/pages/order_tracking.dart';
import '../features/order/presentation/pages/order_status.dart';

// Profile screens
import '../features/profile/presentation/pages/profile.dart';
import '../features/profile/presentation/pages/settings.dart';

// Notification screens
import '../features/notification/presentation/pages/notification.dart';

// Wallet screens
import '../features/wallet/presentation/pages/wallet.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // Splash Screen
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),

    // Onboarding
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),

    // Authentication Routes
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: SignupRoute.page, path: '/signup'),
    AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
    AutoRoute(page: VerificationCodeRoute.page, path: '/verification-code'),
    AutoRoute(page: SetNewPasswordRoute.page, path: '/set-new-password'),
    AutoRoute(page: SucessfullyResetRoute.page, path: '/successfully-reset'),

    // Permission Routes
    AutoRoute(page: AcceptLocationRoute.page, path: '/accept-location'),
    AutoRoute(page: PrivacyPermissionRoute.page, path: '/privacy-permission'),

    // Main App Routes
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: MapViewRoute.page, path: '/mapview'),
    AutoRoute(page: SearchRoute.page, path: '/search'),
    AutoRoute(page: ViewRestaurantRoute.page, path: '/restaurant/:id'),
    AutoRoute(page: ViewFoodDetailsRoute.page, path: '/food/:id'),
    AutoRoute(page: CartRoute.page, path: '/cart'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: OrderTrackingRoute.page, path: '/order-tracking'),
    AutoRoute(page: OrderStatusRoute.page, path: '/order-status'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: NotificationRoute.page, path: '/notification'),
    AutoRoute(page: WalletRoute.page, path: '/wallet'),
  ];
}
