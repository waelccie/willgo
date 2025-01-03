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

  /// No description provided for @appname.
  ///
  /// In en, this message translates to:
  /// **'WillGo'**
  String get appname;

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

  /// No description provided for @confirmpassword_empty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password.'**
  String get confirmpassword_empty;

  /// No description provided for @confirmpassword_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match. Please try again.'**
  String get confirmpassword_mismatch;

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

  /// No description provided for @normalphone_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get normalphone_invalid;

  /// No description provided for @address_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address.'**
  String get address_empty;

  /// No description provided for @firstname_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name.'**
  String get firstname_empty;

  /// No description provided for @lastname_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name.'**
  String get lastname_empty;

  /// No description provided for @notempty_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get notempty_required;

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

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @validatename.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get validatename;

  /// No description provided for @validateemail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get validateemail;

  /// No description provided for @validateemailstructure.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validateemailstructure;

  /// No description provided for @validatephone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validatephone;

  /// No description provided for @validatephonestartwithzero.
  ///
  /// In en, this message translates to:
  /// **'The phone number should not start with 0'**
  String get validatephonestartwithzero;

  /// No description provided for @validatephonecontaintennumbers.
  ///
  /// In en, this message translates to:
  /// **'The phone number must contain digits'**
  String get validatephonecontaintennumbers;

  /// No description provided for @validatepassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get validatepassword;

  /// No description provided for @validateconfirmpassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password correctly'**
  String get validateconfirmpassword;

  /// No description provided for @validateempty.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validateempty;

  /// No description provided for @passwordstructurevalidation.
  ///
  /// In en, this message translates to:
  /// **'password must contain an uppercase letter, a lowercase letter, a symbol and a number'**
  String get passwordstructurevalidation;

  /// No description provided for @pleaseloginfirst.
  ///
  /// In en, this message translates to:
  /// **'Please log in first'**
  String get pleaseloginfirst;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get lang;

  /// No description provided for @doyouwanttologout.
  ///
  /// In en, this message translates to:
  /// **'Do you want to log out?'**
  String get doyouwanttologout;

  /// No description provided for @continueasvisitor.
  ///
  /// In en, this message translates to:
  /// **'Continue as Visitor'**
  String get continueasvisitor;

  /// No description provided for @welcomeback.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeback;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signin;

  /// No description provided for @pleaselogintoyouraccountorcreateanewaccounttocontinue.
  ///
  /// In en, this message translates to:
  /// **'Please log in to your account or create a new account to continue.'**
  String get pleaselogintoyouraccountorcreateanewaccounttocontinue;

  /// No description provided for @mobilenumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobilenumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotpassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotpassword;

  /// No description provided for @donthaveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donthaveanaccount;

  /// No description provided for @createnewaccount.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createnewaccount;

  /// No description provided for @dontworry.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry!'**
  String get dontworry;

  /// No description provided for @pleaseenteryournumbertocontinue.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number to continue.'**
  String get pleaseenteryournumbertocontinue;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @joinforus.
  ///
  /// In en, this message translates to:
  /// **'Join Us!'**
  String get joinforus;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP Code'**
  String get otp;

  /// No description provided for @pleaseentertheotcodesentto.
  ///
  /// In en, this message translates to:
  /// **'Please enter the OTP code sent to'**
  String get pleaseentertheotcodesentto;

  /// No description provided for @tocompletetheregistrationprocess.
  ///
  /// In en, this message translates to:
  /// **'to complete the registration process'**
  String get tocompletetheregistrationprocess;

  /// No description provided for @didntreceivethecode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get didntreceivethecode;

  /// No description provided for @resendcode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendcode;

  /// No description provided for @onelaststep.
  ///
  /// In en, this message translates to:
  /// **'One last step!'**
  String get onelaststep;

  /// No description provided for @setnewpassword.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get setnewpassword;

  /// No description provided for @pleaseenternewpassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password.'**
  String get pleaseenternewpassword;

  /// No description provided for @pleaseenteroldpassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your old password.'**
  String get pleaseenteroldpassword;

  /// No description provided for @confirmpassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmpassword;

  /// No description provided for @createyouraccountnow.
  ///
  /// In en, this message translates to:
  /// **'Create your account now!'**
  String get createyouraccountnow;

  /// No description provided for @createanewaccount.
  ///
  /// In en, this message translates to:
  /// **'Create a New Account'**
  String get createanewaccount;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @newaccount.
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get newaccount;

  /// No description provided for @enteryourinfotobeapartofus.
  ///
  /// In en, this message translates to:
  /// **'Enter your information to be a part of our community.'**
  String get enteryourinfotobeapartofus;

  /// No description provided for @agreeto.
  ///
  /// In en, this message translates to:
  /// **'Agree to'**
  String get agreeto;

  /// No description provided for @haveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveanaccount;

  /// No description provided for @enteryourinfotostarttouseourservices.
  ///
  /// In en, this message translates to:
  /// **'Enter your information to start using our services.'**
  String get enteryourinfotostarttouseourservices;

  /// No description provided for @firstname.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstname;

  /// No description provided for @lastname.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastname;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @createaccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createaccount;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @activenotifications.
  ///
  /// In en, this message translates to:
  /// **'Activate Notifications'**
  String get activenotifications;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @nointernet.
  ///
  /// In en, this message translates to:
  /// **'No Internet'**
  String get nointernet;

  /// No description provided for @connectiontimeoutwithapiserver.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout with ApiServer'**
  String get connectiontimeoutwithapiserver;

  /// No description provided for @sendtimeoutwithapiserver.
  ///
  /// In en, this message translates to:
  /// **'Send timeout with ApiServer'**
  String get sendtimeoutwithapiserver;

  /// No description provided for @receivetimeoutwithapiserver.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout with ApiServer'**
  String get receivetimeoutwithapiserver;

  /// No description provided for @requesttoapiserverwascanceled.
  ///
  /// In en, this message translates to:
  /// **'Request to ApiServer was canceled'**
  String get requesttoapiserverwascanceled;

  /// No description provided for @nointernetconnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get nointernetconnection;

  /// No description provided for @unexpectederrorpleasetryagain.
  ///
  /// In en, this message translates to:
  /// **'Unexpected Error, Please Try Again!'**
  String get unexpectederrorpleasetryagain;

  /// No description provided for @oppstherewasanerrorpleasetryagain.
  ///
  /// In en, this message translates to:
  /// **'Opps There was an Error, Please try again'**
  String get oppstherewasanerrorpleasetryagain;

  /// No description provided for @yourrequestnotfoundpleasetrylater.
  ///
  /// In en, this message translates to:
  /// **'Your request not found, Please try later!'**
  String get yourrequestnotfoundpleasetrylater;

  /// No description provided for @internalservererrorpleasetrylater.
  ///
  /// In en, this message translates to:
  /// **'Internal Server error, Please try later'**
  String get internalservererrorpleasetrylater;

  /// No description provided for @continueasguest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueasguest;

  /// No description provided for @createanaccountorlogintoexploreourapp.
  ///
  /// In en, this message translates to:
  /// **'Create an account or log in to explore our app'**
  String get createanaccountorlogintoexploreourapp;

  /// No description provided for @emailorphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone Number'**
  String get emailorphonenumber;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @enteryouremailtoreceivepassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive password'**
  String get enteryouremailtoreceivepassword;

  /// No description provided for @sendemail.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get sendemail;

  /// No description provided for @backtologin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backtologin;

  /// No description provided for @pleaseenter4digitcodehasbeensentto.
  ///
  /// In en, this message translates to:
  /// **'Please enter 4 digit code has been sent to'**
  String get pleaseenter4digitcodehasbeensentto;

  /// No description provided for @dontreceiveotp.
  ///
  /// In en, this message translates to:
  /// **'Don’t receive OTP?'**
  String get dontreceiveotp;

  /// No description provided for @verifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying...'**
  String get verifying;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @invalidorincorrectotptryagain.
  ///
  /// In en, this message translates to:
  /// **'Invalid or incorrect OTP, try again'**
  String get invalidorincorrectotptryagain;

  /// No description provided for @iagreewithtermsandconditions.
  ///
  /// In en, this message translates to:
  /// **'I agree with Terms and Conditions'**
  String get iagreewithtermsandconditions;

  /// No description provided for @streetname.
  ///
  /// In en, this message translates to:
  /// **'Street Name'**
  String get streetname;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @rememberme.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberme;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @personaldata.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personaldata;

  /// No description provided for @please_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get please_try_again;

  /// No description provided for @searchforfood.
  ///
  /// In en, this message translates to:
  /// **'Search for food'**
  String get searchforfood;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliver_to;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @noresultsfound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any results'**
  String get noresultsfound;

  /// No description provided for @makeyourfirst_order.
  ///
  /// In en, this message translates to:
  /// **'Come on, make your first order'**
  String get makeyourfirst_order;

  /// No description provided for @restaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurant;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @allrestaurants.
  ///
  /// In en, this message translates to:
  /// **'All Restaurants'**
  String get allrestaurants;

  /// No description provided for @seeall.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeall;

  /// No description provided for @slectlanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get slectlanguage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @privacypolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacypolicy;

  /// No description provided for @termsandconditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsandconditions;

  /// No description provided for @profilesettings.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get profilesettings;

  /// No description provided for @hinicetomeetyou.
  ///
  /// In en, this message translates to:
  /// **'Hi, nice to meet you'**
  String get hinicetomeetyou;

  /// No description provided for @helpcenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpcenter;

  /// No description provided for @aboutus.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutus;

  /// No description provided for @contactus.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactus;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @myrates.
  ///
  /// In en, this message translates to:
  /// **'My Rates'**
  String get myrates;

  /// No description provided for @requestaccountdeletion.
  ///
  /// In en, this message translates to:
  /// **'Request Account Deletion'**
  String get requestaccountdeletion;

  /// No description provided for @signout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signout;

  /// No description provided for @addrequest.
  ///
  /// In en, this message translates to:
  /// **'Add Request'**
  String get addrequest;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @sendrequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendrequest;

  /// No description provided for @minut.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get minut;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @savechanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get savechanges;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @selectdate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectdate;

  /// No description provided for @selecttime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selecttime;

  /// No description provided for @selectlocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectlocation;

  /// No description provided for @selectaddress.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get selectaddress;

  /// No description provided for @selectcity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectcity;

  /// No description provided for @selectcountry.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get selectcountry;

  /// No description provided for @selectstate.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get selectstate;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @asaguest.
  ///
  /// In en, this message translates to:
  /// **'As a Guest'**
  String get asaguest;

  /// No description provided for @orsiginwith.
  ///
  /// In en, this message translates to:
  /// **'Or sign in with'**
  String get orsiginwith;

  /// No description provided for @cancelorder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelorder;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @changeofmind.
  ///
  /// In en, this message translates to:
  /// **'Change of Mind'**
  String get changeofmind;

  /// No description provided for @foundbetterpriceelsewhere.
  ///
  /// In en, this message translates to:
  /// **'Found better price elsewhere'**
  String get foundbetterpriceelsewhere;

  /// No description provided for @deliverytime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get deliverytime;

  /// No description provided for @deliveryaddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryaddress;

  /// No description provided for @deliverycity.
  ///
  /// In en, this message translates to:
  /// **'Delivery City'**
  String get deliverycity;

  /// No description provided for @deliverydelay.
  ///
  /// In en, this message translates to:
  /// **'Delivery Delay'**
  String get deliverydelay;

  /// No description provided for @incorrectorder.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Order'**
  String get incorrectorder;

  /// No description provided for @incorrectitemselected.
  ///
  /// In en, this message translates to:
  /// **'Incorrect item selected'**
  String get incorrectitemselected;

  /// No description provided for @yourordercancelled.
  ///
  /// In en, this message translates to:
  /// **'Your order cancelled'**
  String get yourordercancelled;

  /// No description provided for @weresorrytoseeyourordergo.
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry to see your order gone. We\'re always striving to improve, and we hope to serve you better next time'**
  String get weresorrytoseeyourordergo;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @we_couldnt_find_any_result.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any result!'**
  String get we_couldnt_find_any_result;

  /// No description provided for @please_login_register.
  ///
  /// In en, this message translates to:
  /// **'Please Login / Register'**
  String get please_login_register;

  /// No description provided for @log_in_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Log in/Sign Up'**
  String get log_in_sign_up;

  /// No description provided for @please_make_your_first_order.
  ///
  /// In en, this message translates to:
  /// **'Come on, make your first order!'**
  String get please_make_your_first_order;

  /// No description provided for @total_items.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get total_items;

  /// No description provided for @delivery_fee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get delivery_fee;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @payment_summary.
  ///
  /// In en, this message translates to:
  /// **'Payment Summary'**
  String get payment_summary;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @no_restaurants_found.
  ///
  /// In en, this message translates to:
  /// **'No restaurants found'**
  String get no_restaurants_found;

  /// No description provided for @thepizzaplace.
  ///
  /// In en, this message translates to:
  /// **'The Pizza Place'**
  String get thepizzaplace;

  /// No description provided for @your_location.
  ///
  /// In en, this message translates to:
  /// **'Your Location'**
  String get your_location;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @change_location.
  ///
  /// In en, this message translates to:
  /// **'Change Location'**
  String get change_location;

  /// No description provided for @location_name.
  ///
  /// In en, this message translates to:
  /// **'Location Name'**
  String get location_name;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @checkout_button.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkout_button;

  /// No description provided for @please_enter_address.
  ///
  /// In en, this message translates to:
  /// **'Please enter an address'**
  String get please_enter_address;
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
