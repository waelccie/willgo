import 'messages.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appname => 'WillGo';

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
  String get confirmpassword_empty => 'يرجى تأكيد كلمة المرور الخاصة بك.';

  @override
  String get confirmpassword_mismatch => 'كلمات المرور غير متطابقة. يرجى المحاولة مرة أخرى.';

  @override
  String get phone_empty => 'يرجى إدخال رقم هاتفك.';

  @override
  String get phone_unsupported_country => 'رمز الدولة غير مدعوم. يرجى إدخال رمز دولة صالح.';

  @override
  String get phone_invalid => 'يرجى إدخال رقم هاتف صالح.';

  @override
  String get normalphone_invalid => 'يرجى إدخال رقم هاتف صالح.';

  @override
  String get address_empty => 'يرجى إدخال عنوانك.';

  @override
  String get firstname_empty => 'يرجى إدخال اسمك الأول.';

  @override
  String get lastname_empty => 'يرجى إدخال اسم عائلتك.';

  @override
  String get notempty_required => 'هذا الحقل مطلوب.';

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

  @override
  String get camera => 'الكاميرا';

  @override
  String get gallery => 'المعرض';

  @override
  String get ok => 'حسنا';

  @override
  String get save => 'حفظ';

  @override
  String get send => 'إرسال';

  @override
  String get search => 'بحث';

  @override
  String get continuee => 'استمرار';

  @override
  String get skip => 'تخطي';

  @override
  String get validatename => 'الرجاء كتابة اسمك';

  @override
  String get validateemail => 'الرجاء كتابة البريد الإلكتروني';

  @override
  String get validateemailstructure => 'الرجاء كتابة البريد الإلكتروني بشكل صحيح';

  @override
  String get validatephone => 'الرجاء كتابة رقم الهاتف الصحيح';

  @override
  String get validatephonestartwithzero => 'يجب ألا يبدأ الهاتف بـ 0';

  @override
  String get validatephonecontaintennumbers => 'رقم الهاتف يجب أن يتكون من أرقام';

  @override
  String get validatepassword => 'الرجاء كتابة كلمة المرور';

  @override
  String get validateconfirmpassword => 'الرجاء كتابة كلمة المرور بشكل صحيح';

  @override
  String get validateempty => 'هذا الحقل مطلوب';

  @override
  String get passwordstructurevalidation => 'كلمة المرور يجب أن تحتوي على حرف كبير، حرف صغير، رمز ورقم';

  @override
  String get pleaseloginfirst => 'الرجاء تسجيل الدخول أولا';

  @override
  String get no => 'لا';

  @override
  String get yes => 'نعم';

  @override
  String get lang => 'العربية';

  @override
  String get doyouwanttologout => 'هل تريد تسجيل الخروج؟';

  @override
  String get continueasvisitor => 'التكملة كزائر';

  @override
  String get welcomeback => 'مرحبًا بك مجددًا !';

  @override
  String get signin => 'تسجيل الدخول';

  @override
  String get pleaselogintoyouraccountorcreateanewaccounttocontinue => 'يرجى تسجيل الدخول إلى حسابك أو إنشاء حساب جديد للمتابعة.';

  @override
  String get mobilenumber => 'رقم الجوال';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotpassword => 'نسيت كلمة المرور ؟';

  @override
  String get donthaveanaccount => 'ليس لديك حساب ؟';

  @override
  String get createnewaccount => 'عمل حساب جديد';

  @override
  String get dontworry => 'لا تقلق !';

  @override
  String get pleaseenteryournumbertocontinue => 'يرجى إدخال رقم الجوال للمتابعة.';

  @override
  String get next => 'التالي';

  @override
  String get joinforus => 'انضم إلينا !';

  @override
  String get otp => 'رمز OTP';

  @override
  String get pleaseentertheotcodesentto => 'يُرجى إدخال رمز OTP المرسل إلى رقم';

  @override
  String get tocompletetheregistrationprocess => 'لإكمال عملية التسجيل';

  @override
  String get didntreceivethecode => 'لم يصلك الرمز ؟';

  @override
  String get resendcode => 'إعادة إرسال الرمز';

  @override
  String get onelaststep => 'خطوة أخيرة !';

  @override
  String get setnewpassword => 'تعيين كلمة المرور الجديدة';

  @override
  String get pleaseenternewpassword => 'يرجى إدخال كلمة المرور الجديدة.';

  @override
  String get pleaseenteroldpassword => 'يرجى إدخال كلمة المرور القديمة.';

  @override
  String get confirmpassword => 'تأكيد كلمة المرور';

  @override
  String get createyouraccountnow => 'أنشئ حسابك الآن!';

  @override
  String get createanewaccount => 'إنشاء حساب جديد';

  @override
  String get submit => 'تأكيد';

  @override
  String get newaccount => 'حساب جديد';

  @override
  String get enteryourinfotobeapartofus => 'أدخل معلوماتك لتكون جزءًا من مجتمعنا الرائع.';

  @override
  String get agreeto => 'الموافقة على';

  @override
  String get haveanaccount => 'لديك حساب بالفعل؟';

  @override
  String get enteryourinfotostarttouseourservices => 'قم بإدخال معلوماتك للبدء في استخدام خدماتنا.';

  @override
  String get firstname => 'الاسم الأول';

  @override
  String get lastname => 'الاسم الأخير';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get createaccount => 'إنشاء الحساب';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get activenotifications => 'تفعيل الإشعارات';

  @override
  String get confirm => 'تأكيد';

  @override
  String get language => 'اللغة';

  @override
  String get nointernet => 'لا يوجد شبكة';

  @override
  String get connectiontimeoutwithapiserver => 'انتهت مهلة الاتصال بالخادم ';

  @override
  String get sendtimeoutwithapiserver => 'انتهت مهلة الإرسال إلى الخادم ';

  @override
  String get receivetimeoutwithapiserver => 'انتهت مهلة الاستقبال من الخادم ';

  @override
  String get requesttoapiserverwascanceled => 'تم إلغاء الطلب إلى الخادم ';

  @override
  String get nointernetconnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get unexpectederrorpleasetryagain => 'حدث خطأ غير متوقع، الرجاء المحاولة مرة أخرى!';

  @override
  String get oppstherewasanerrorpleasetryagain => 'عذرًا، حدث خطأ، الرجاء المحاولة مرة أخرى';

  @override
  String get yourrequestnotfoundpleasetrylater => 'طلبك غير موجود، الرجاء المحاولة لاحقًا!';

  @override
  String get internalservererrorpleasetrylater => 'خطأ في الخادم الداخلي، الرجاء المحاولة لاحقًا';

  @override
  String get continueasguest => 'Continue as guest';

  @override
  String get createanaccountorlogintoexploreourapp => 'Create an account or log in to explore our app';

  @override
  String get emailorphonenumber => 'Email or Phone Number';

  @override
  String get or => 'Or';

  @override
  String get enteryouremailtoreceivepassword => 'Enter your email to receive password';

  @override
  String get sendemail => 'Send Email';

  @override
  String get backtologin => 'Back to Login';

  @override
  String get pleaseenter4digitcodehasbeensentto => 'Please enter 4 digit code has been sent to';

  @override
  String get dontreceiveotp => 'Don’t receive OTP?';

  @override
  String get verifying => 'Verifying...';

  @override
  String get verify => 'Verify';

  @override
  String get invalidorincorrectotptryagain => 'Invalid or incorrect OTP, try again';

  @override
  String get iagreewithtermsandconditions => 'I agree with Terms and Conditions';

  @override
  String get streetname => 'Street Name';

  @override
  String get login => 'Login';

  @override
  String get rememberme => 'Remember Me';

  @override
  String get signup => 'Sign Up';

  @override
  String get personaldata => 'Personal Data';

  @override
  String get please_try_again => 'Please try again';

  @override
  String get searchforfood => 'ابحث عن الطعام';

  @override
  String get deliver_to => 'Deliver to';

  @override
  String get home => 'الرئيسية';

  @override
  String get orders => 'الطلبات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get noresultsfound => 'لم يتم العثور على نتائج';

  @override
  String get makeyourfirst_order => 'Come on, make your first order';

  @override
  String get restaurant => 'مطعم';

  @override
  String get restaurants => 'مطاعم';

  @override
  String get allrestaurants => 'جميع المطاعم';

  @override
  String get seeall => 'عرض الكل';

  @override
  String get slectlanguage => 'اختر اللغة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get location => 'الموقع';

  @override
  String get support => 'الدعم';

  @override
  String get privacypolicy => 'سياسة الخصوصية';

  @override
  String get termsandconditions => 'الشروط والأحكام';

  @override
  String get profilesettings => 'إعدادات الملف الشخصي';

  @override
  String get hinicetomeetyou => 'مرحبًا، سعداء بلقائك';

  @override
  String get helpcenter => 'مركز المساعدة';

  @override
  String get aboutus => 'معلومات عنا';

  @override
  String get contactus => 'اتصل بنا';

  @override
  String get faq => 'الأسئلة الشائعة';

  @override
  String get myrates => 'تقييماتي';

  @override
  String get requestaccountdeletion => 'طلب حذف الحساب';

  @override
  String get signout => 'تسجيل الخروج';
}
