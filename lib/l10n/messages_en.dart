import 'messages.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'WillGo';

  @override
  String get currency => 'SAR';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get error => 'Error';

  @override
  String get try_again => 'Please Try Again';

  @override
  String get phone_empty_val => 'The phone must not be empty';

  @override
  String get phone_valid_val => 'Phone number should be valid';

  @override
  String get you_are_offline => 'You are offline';

  @override
  String get please_connect_to_the_internet_and_try_again => 'Please connect to the internet and try again.';

  @override
  String get username_empty => 'Please enter your username.';

  @override
  String get username_short => 'Your username must be at least 2 characters long.';

  @override
  String get email_empty => 'Please enter your email address.';

  @override
  String get email_invalid => 'Please enter a valid email address.';

  @override
  String get password_empty => 'Please create a password.';

  @override
  String get password_short => 'Your password must be at least 8 characters long.';

  @override
  String get password_complexity => 'Your password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.';

  @override
  String get confirmPassword_empty => 'Please confirm your password.';

  @override
  String get confirmPassword_mismatch => 'Passwords do not match. Please try again.';

  @override
  String get phone_empty => 'Please enter your phone number.';

  @override
  String get phone_unsupported_country => 'Unsupported country code. Please enter a valid country code.';

  @override
  String get phone_invalid => 'Please enter a valid phone number.';

  @override
  String get normalPhone_invalid => 'Please enter a valid phone number.';

  @override
  String get address_empty => 'Please enter your address.';

  @override
  String get firstName_empty => 'Please enter your first name.';

  @override
  String get lastName_empty => 'Please enter your last name.';

  @override
  String get notEmpty_required => 'This field is required.';

  @override
  String get phone => 'Phone number';

  @override
  String get verify_email_success_title => 'Phone nummber verified successfully';

  @override
  String get verify_email_success_body => 'Congratulations, your phone nummber has been verified. You can start using the app';

  @override
  String get reset_password_success_title => 'Reset password Successful';

  @override
  String get reset_password_success_body => 'Congratulations, your password has been reset successfully. You can start using your new password';

  @override
  String get continue_title => 'Continue';

  @override
  String get change_password_success_title => 'Password changed Successfully';

  @override
  String get change_password_success_subtitle => 'Congratulations, your Password has been changed. You can start using the new password';

  @override
  String get thank_you => 'Thank You!';

  @override
  String get order_success_subtitle => 'Your order has been placed successfully. You will receive a confirmation email shortly.';

  @override
  String get logout => 'Logout';

  @override
  String get logout_title => 'You’ll need to enter your username and password next time you want to login.';

  @override
  String get cancel => 'Cancel';
}
