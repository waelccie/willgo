import 'package:get_storage/get_storage.dart';

class CacheHelper {
  //========================================================

  static final GetStorage _appBox = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  //========================================================
  static Future<void> cacheToken({
    required String token,
  }) async {
    await _cacheUserToken(token);
  }
    //========================================================

 static Future<void> cacheEmail({
    required String email,
  }) async {
    await _appBox.write('email', email);
  }
    static String? get getEmail => _appBox.read('email');

  //========================================================

  static Future<void> _cacheUserToken(String uid) async =>
      await _appBox.write('token', uid);

  static String? get getUserToken => _appBox.read('token');

//=========================================================
  static Future<void> cacheLocale({
    required String langCode,
  }) async {
    await _cacheLocale(langCode);
  }

  static Future<void> _cacheLocale(String langCode) async =>
      await _appBox.write('langCode', langCode);

  static String get getLocale => _appBox.read('langCode') ?? "en";

  //========================================================
  static Future<void> cacheFirstTime({
    required bool isFirst,
  }) async {
    await _cacheFirstTime(isFirst);
  }

  static Future<void> _cacheFirstTime(bool isFirst) async =>
      await _appBox.write('isFirst', isFirst);

  static bool get getIsFirstTime => _appBox.read('isFirst') ?? true;
  //========================================================
  //========================================================
  //========================================================
  //========================================================
  //========================================================
  static Future<void> eraseCache() async => _appBox.erase();

  static Future<void> logout() async => await _appBox.remove("token");

//========================================================
}
