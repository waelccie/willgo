// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import '../services/network_service.dart/dio_network_service.dart';

const String dummyImage = "https://picsum.photos/800";
const String emptyImage =
    "https://assets2.lottiefiles.com/private_files/lf30_e3pteeho.json";
const String userImage =
    "https://firebasestorage.googleapis.com/v0/b/elkady-dataflow.appspot.com/o/profile.png?alt=media&token=ce956826-60d0-4274-98c3-39f32e6ff5fd&_gl=1*1f9d2nj*_ga*MTA5MjI0NDU4LjE2Nzk5MDg4MzY.*_ga_CW55HF8NVT*MTY5NjUwMzEwOS4xNDUuMS4xNjk2NTAzMzQ0LjUxLjAuMA..";
final NetworkService networkService = NetworkService(
  baseUrl: APIKeys.baseUrl,
  httpHeaders: {
    'Accept': 'application/json',
    "password": APIKeys.apiPassword,
  },
);
String appDateFormat(DateTime date) {
  String pattern = 'yyyy-MM-dd';
  var format = DateFormat(pattern, "en");
  var dateString = format.format(date);
  return dateString;
}

String appTimeFormat(DateTime time) {
  String pattern = 'HH:mm';
  var format = DateFormat(pattern, "en");
  var timeString = format.format(time);
  return timeString;
}

String formatSeconds(int totalSeconds) {
  int minutes = totalSeconds ~/ 60; // Calculate the minutes
  int seconds = totalSeconds % 60; // Calculate the remaining seconds

  // Format as "MM:SS"
  String formattedTime =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  return formattedTime;
}

String timeUntil(DateTime date) {
  return timeago.format(date, allowFromNow: true);
}

extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) => map(
        (items) => items.where(where).toList(),
      );
}

extension CustomList<T> on List<T> {
  List<T> asReversed(bool isReverse) {
    return isReverse ? reversed.toList() : this;
  }

  T? elementAtOrNull(int index) {
    try {
      return this[index];
    } catch (_) {}
    return null;
  }
}

const int pageLimit = 10;

class APIKeys {
  static const String baseUrl = "https://willgoback.rowadtech.com/api/";
  static const String paymentTest =
      "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
  static const String paymentLive = "";
  static const String resetOtpPassword = "send-reset-password-otp";
  static const String vtifyOtp = "verify-otp";
  static const String pusherAppId = "";
  static const String checkOut = "user/orders/checkout";
  static const String pusherKey = "";
  static const String pusherSecret = "";
  static const String pusherCluster = "";
  static const String addToCart = "user/cart";
  static const String updateProfile = "user/profile";
  static const String SupportRequests = "user/contactus";
  static const String apiPassword =
      "\$2y\$12\$lKLPBP1GlcywPnqPZceE4OcTWQNMrTgoshgoz91DrvvuTFMGiUI32";
  static const String sentryKey = "";
  static const String paymentKeyTest = "";
  static const String paymentKeyLive = "";
  static const String login = "login_by_phone";
  static const String register = "send-register-otp";
  static const String verifyPhone = "reset-password-after-otp";
  static const String sendOtp = "send-reset-password-otp";
  static const String search = "user/searches";
  static const String sendresetPassword = "register-after-otp";
  static const String resetPassword = "reset-password-after-otp";
  static const String registerAfterOtp = "register-after-otp";
  static const String getUserData = "user/profile";
  static const String getCategories = "user/categories";
  static const String getResturantByCat = "user/restaurants";

  static const String getCategoriesDetails = "user/categories";

  static const String cart = "user/cart";
  static const String getResturant = "user/restaurants";
  static const String getOrders = "user/orders/user";
  static const String getNotifaction = "user/notifications";

  static const String getAllLocation = "user/locations";
  static const String contactus = "/api/user/contactus";
  static const String getDEfaultLocation = "user/locations/default/get";
  static String getRestaurantDetail(int id) => "user/restaurants/$id";
  static String getLocationByid(int id) => "user/locations/$id";
  static String getProductDetail(int id) => "user/products/$id";
  static String updateCatr(int id) => "user/cart/$id/update";
  static String getOrderDetails(int id) => "user/orders/$id";
  static String setDefaultLocation(int id) =>
      "user/locations/primary_location/$id/update";
  static String delete_it(int id) => "user/cart/$id";
  static String addLocation = 'user/locations';
  static const String getProducts = "user/products";
  static const String updateUser = "user/profile";
  static const String logout = "logout";
  static const String deleteAccount = "user/profile/delete";

  static const String deleteUser = "profile/delete";
  static const String changePassword = "profile/change-password";
  static const String storeFCMToken = "fcm";
  static const String getAllSliders = "user/sliders";
  static const String getAllParentCategories = "user/classes";
  static String getSettings({String? settingkey}) =>"user/settings/$settingkey";
}

void openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    log("Could not launch url");
  }
}

void showErrorsSequentially(List<String> errors, [int index = 0]) {
  if (index >= errors.length) return; // Stop when all errors have been shown

  // Show the current error
  BotToast.showText(
    text: errors[index],
    onClose: () {
      // Show the next error after this one closes
      showErrorsSequentially(errors, index + 1);
    },
  );
}
