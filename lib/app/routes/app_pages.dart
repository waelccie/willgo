// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/all_offers/bindings/all_offers_binding.dart';
import '../modules/all_offers/views/all_offers_view.dart';
import '../modules/all_restaurants/bindings/all_restaurants_binding.dart';
import '../modules/all_restaurants/views/all_restaurants_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/cancelOrder/bindings/cancel_order_binding.dart';
import '../modules/cancelOrder/views/cancel_order_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category_details/bindings/category_details_binding.dart';
import '../modules/category_details/views/category_details_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/check_out/bindings/check_out_binding.dart';
import '../modules/check_out/views/check_out_view.dart';
import '../modules/delevery_address/bindings/delevery_address_binding.dart';
import '../modules/delevery_address/views/delevery_address_view.dart';
import '../modules/environment/bindings/environment_binding.dart';
import '../modules/environment/views/internet_connection_view.dart';
import '../modules/fav_resturant/bindings/fav_resturant_binding.dart';
import '../modules/fav_resturant/views/fav_resturant_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nav_screen/bindings/nav_screen_binding.dart';
import '../modules/nav_screen/views/nav_screen_view.dart';
import '../modules/new_location/bindings/new_location_binding.dart';
import '../modules/new_location/views/new_location_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/payment_method/bindings/payment_method_binding.dart';
import '../modules/payment_method/views/payment_method_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/restaurant_details/bindings/restaurant_details_binding.dart';
import '../modules/restaurant_details/views/restaurant_details_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';
import '../modules/update_currunt_address/bindings/update_currunt_address_binding.dart';
import '../modules/update_currunt_address/views/update_currunt_address_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () =>  const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () =>  const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.ENVIRONMENT,
      page: () => const InternetConnectionView(),
      binding: EnvironmentBinding(),
    ),
    GetPage(
      name: _Paths.NAV_SCREEN,
      page: () => const NavScreenView(),
      binding: NavScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_CURRUNT_ADDRESS,
      page: () => const UpdateCurruntAddressView(),
      binding: UpdateCurruntAddressBinding(),
    ),
    GetPage(
      name: _Paths.ALL_RESTAURANTS,
      page: () => const AllRestaurantsView(),
      binding: AllRestaurantsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_OFFERS,
      page: () => const AllOffersView(),
      binding: AllOffersBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_DETAILS,
      page: () => const RestaurantDetailsView(),
      binding: RestaurantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_DETAILS,
      page: () => const CategoryDetailsView(),
      binding: CategoryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD,
      page: () => const PaymentMethodView(),
      binding: PaymentMethodBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CANCEL_ORDER,
      page: () => const CancelOrderView(),
      binding: CancelOrderBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => const CheckOutView(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: _Paths.DELEVERY_ADDRESS,
      page: () => const DeleveryAddressView(),
      binding: DeleveryAddressBinding(),
    ),
    GetPage(
      name: _Paths.NEW_LOCATION,
      page: () =>  NewLocationView(),
      binding: NewLocationBinding(),
    ),
    GetPage(
      name: _Paths.FAV_RESTURANT,
      page: () => const FavResturantView(),
      binding: FavResturantBinding(),
    ),
  ];
}
