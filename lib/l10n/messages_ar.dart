import 'messages.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'WillGo';

  @override
  String get currency => 'ر.س';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get error => 'خطأ';

  @override
  String get try_again => 'حاول مرة أخرى';

  @override
  String get phone_empty_val => 'يجب ألا يكون الهاتف فارغ';

  @override
  String get phone_valid_val => 'يجب أن يكون رقم الهاتف صالح';

  @override
  String get you_are_offline => 'أنت غير متصل بالإنترنت';

  @override
  String get please_connect_to_the_internet_and_try_again => 'يرجى الاتصال بالإنترنت والمحاولة مرة أخرى.';

  @override
  String get username_empty => 'يرجى إدخال اسم المستخدم الخاص بك.';

  @override
  String get username_short => 'يجب أن يتكون اسم المستخدم الخاص بك من 2 أحرف على الأقل.';

  @override
  String get email_empty => 'يرجى إدخال عنوان بريدك الإلكتروني.';

  @override
  String get email_invalid => 'يرجى إدخال عنوان بريد إلكتروني صالح.';

  @override
  String get password_empty => 'يرجى إنشاء كلمة مرور.';

  @override
  String get password_short => 'يجب أن تكون كلمة المرور الخاصة بك 8 أحرف على الأقل.';

  @override
  String get password_complexity => 'يجب أن تحتوي كلمة المرور على حرف واحد كبير، وحرف واحد صغير، ورقم، ورمز خاص.';

  @override
  String get confirmPassword_empty => 'يرجى تأكيد كلمة المرور الخاصة بك.';

  @override
  String get confirmPassword_mismatch => 'كلمات المرور غير متطابقة. يرجى المحاولة مرة أخرى.';

  @override
  String get phone_empty => 'يرجى إدخال رقم هاتفك.';

  @override
  String get phone_unsupported_country => 'رمز الدولة غير مدعوم. يرجى إدخال رمز دولة صالح.';

  @override
  String get phone_invalid => 'يرجى إدخال رقم هاتف صالح.';

  @override
  String get normalPhone_invalid => 'يرجى إدخال رقم هاتف صالح.';

  @override
  String get address_empty => 'يرجى إدخال عنوانك.';

  @override
  String get firstName_empty => 'يرجى إدخال اسمك الأول.';

  @override
  String get lastName_empty => 'يرجى إدخال اسم عائلتك.';

  @override
  String get notEmpty_required => 'هذا الحقل مطلوب.';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get verify_email_success_title => 'تم التحقق من عنوان البريد الإلكتروني بنجاح';

  @override
  String get verify_email_success_body => 'تهانينا، تم التحقق من عنوان بريدك الإلكتروني بنجاح. يمكنك البدء في استخدام حسابك الجديد';

  @override
  String get reset_password_success_title => 'تمت إعادة تعيين كلمة المرور بنجاح';

  @override
  String get reset_password_success_body => 'تهانينا، تمت إعادة تعيين كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة';

  @override
  String get continue_title => 'استمر';

  @override
  String get change_password_success_title => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get change_password_success_subtitle => 'تهانينا، تم تغيير كلمة المرور الخاصة بك. يمكنك الآن البدء في استخدام كلمة المرور الجديدة';

  @override
  String get thank_you => 'شكرا لك';

  @override
  String get order_success_subtitle => 'لقد تم تقديم طلبك بنجاح. سوف تتلقى رسالة تأكيد بالبريد الإلكتروني قريبًا.';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logout_title => 'سيتعين عليك إدخال اسم المستخدم وكلمة المرور في المرة القادمة التي تريد فيها تسجيل الدخول.';

  @override
  String get cancel => 'إلغاء';
}
