import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'messages_ar.dart';
import 'messages_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/messages.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'WillGo'**
  String get appName;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get currency;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Please Try Again'**
  String get try_again;

  /// No description provided for @phone_empty_val.
  ///
  /// In en, this message translates to:
  /// **'The phone must not be empty'**
  String get phone_empty_val;

  /// No description provided for @phone_valid_val.
  ///
  /// In en, this message translates to:
  /// **'Phone number should be valid'**
  String get phone_valid_val;

  /// No description provided for @you_are_offline.
  ///
  /// In en, this message translates to:
  /// **'You are offline'**
  String get you_are_offline;

  /// No description provided for @please_connect_to_the_internet_and_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please connect to the internet and try again.'**
  String get please_connect_to_the_internet_and_try_again;

  /// No description provided for @username_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username.'**
  String get username_empty;

  /// No description provided for @username_short.
  ///
  /// In en, this message translates to:
  /// **'Your username must be at least 2 characters long.'**
  String get username_short;

  /// No description provided for @email_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address.'**
  String get email_empty;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get email_invalid;

  /// No description provided for @password_empty.
  ///
  /// In en, this message translates to:
  /// **'Please create a password.'**
  String get password_empty;

  /// No description provided for @password_short.
  ///
  /// In en, this message translates to:
  /// **'Your password must be at least 8 characters long.'**
  String get password_short;

  /// No description provided for @password_complexity.
  ///
  /// In en, this message translates to:
  /// **'Your password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.'**
  String get password_complexity;

  /// No description provided for @confirmPassword_empty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password.'**
  String get confirmPassword_empty;

  /// No description provided for @confirmPassword_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match. Please try again.'**
  String get confirmPassword_mismatch;

  /// No description provided for @phone_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number.'**
  String get phone_empty;

  /// No description provided for @phone_unsupported_country.
  ///
  /// In en, this message translates to:
  /// **'Unsupported country code. Please enter a valid country code.'**
  String get phone_unsupported_country;

  /// No description provided for @phone_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get phone_invalid;

  /// No description provided for @normalPhone_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get normalPhone_invalid;

  /// No description provided for @address_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address.'**
  String get address_empty;

  /// No description provided for @firstName_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name.'**
  String get firstName_empty;

  /// No description provided for @lastName_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name.'**
  String get lastName_empty;

  /// No description provided for @notEmpty_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get notEmpty_required;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone;

  /// No description provided for @verify_email_success_title.
  ///
  /// In en, this message translates to:
  /// **'Phone nummber verified successfully'**
  String get verify_email_success_title;

  /// No description provided for @verify_email_success_body.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, your phone nummber has been verified. You can start using the app'**
  String get verify_email_success_body;

  /// No description provided for @reset_password_success_title.
  ///
  /// In en, this message translates to:
  /// **'Reset password Successful'**
  String get reset_password_success_title;

  /// No description provided for @reset_password_success_body.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, your password has been reset successfully. You can start using your new password'**
  String get reset_password_success_body;

  /// No description provided for @continue_title.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_title;

  /// No description provided for @change_password_success_title.
  ///
  /// In en, this message translates to:
  /// **'Password changed Successfully'**
  String get change_password_success_title;

  /// No description provided for @change_password_success_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, your Password has been changed. You can start using the new password'**
  String get change_password_success_subtitle;

  /// No description provided for @thank_you.
  ///
  /// In en, this message translates to:
  /// **'Thank You!'**
  String get thank_you;

  /// No description provided for @order_success_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed successfully. You will receive a confirmation email shortly.'**
  String get order_success_subtitle;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logout_title.
  ///
  /// In en, this message translates to:
  /// **'You’ll need to enter your username and password next time you want to login.'**
  String get logout_title;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SAr();
    case 'en': return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
