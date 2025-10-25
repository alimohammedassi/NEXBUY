import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // English translations
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'NexBuy',
      'welcome': 'Welcome',
      'get_started': 'Get Started',
      'to_continue': 'to continue your journey',
      'login': 'Login',
      'signup': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'full_name': 'Full Name',
      'remember_me': 'Remember me',
      'dont_have_account': 'Don\'t have an account?',
      'already_have_account': 'Already have an account?',
      'create_account': 'Create Account',
      'sign_in': 'Sign In',
      'continue_with_google': 'Continue with Google',
      'continue_with_apple': 'Continue with Apple',
      'terms_and_conditions': 'Terms of Service',
      'privacy_policy': 'Privacy Policy',
      'agree_to_terms': 'I agree to the',
      'and': 'and',
      'enter_email': 'Please enter your email',
      'enter_valid_email': 'Please enter a valid email address',
      'enter_password': 'Please enter a password',
      'password_too_short': 'Password must be at least 6 characters',
      'passwords_dont_match': 'Passwords do not match',
      'enter_full_name': 'Please enter your full name',
      'agree_terms': 'Please agree to the terms and conditions',
      'account_created': 'Account created successfully!',
      'login_successful': 'Login successful!',
      'google_signin_demo': 'Google Sign-In not available in demo mode',
      'or': 'OR',
      'choose_language': 'Choose your preferred language',
      'english': 'English',
      'arabic': 'العربية',
      'new_text': 'NEW',
      'recent_orders': 'Recent Laptop Orders',
      'ai_chat': 'AI Chat',
      'home': 'Home',
      'profile': 'Profile',
      'featured_products': 'Featured Products',
      'categories': 'Categories',
      'premium': 'Premium',
      'points': 'Points',
      'orders': 'Orders',
      'rating': 'Rating',
      'edit_profile': 'Edit Profile',
      'addresses': 'Addresses',
      'cart': 'Cart',
      'settings': 'Settings',
      'location_not_available': 'Location not available',
      'saved_addresses': 'Saved Addresses',
      'add_address': 'Add Address',
      'default_text': 'Default',
      'edit': 'Edit',
      'set_as_default': 'Set as Default',
      'delete': 'Delete',
      'add_address_dialog': 'Add a new address to your account',
      'cancel': 'Cancel',
      'add': 'Add',
      'address_name': 'Address Name',
      'address': 'Address',
      'fill_all_fields': 'Please fill all fields',
      'save': 'Save',
      'using_current_location': 'Using current location',
      'enter_address_name': 'Please enter address name',
      'forgot_password': 'Forgot Password',
      'forgot_password_description':
          'Enter your email address and we\'ll send you a link to reset your password.',
      'reset_password': 'Reset Password',
      'remember_password': 'Remember your password?',
      'back_to_login': 'Back to Login',
      'reset_password_sent': 'Password reset link sent to your email!',
    },
    'ar': {
      'app_name': 'نيكس باي',
      'welcome': 'مرحباً',
      'get_started': 'ابدأ الآن',
      'to_continue': 'لمتابعة رحلتك',
      'login': 'تسجيل الدخول',
      'signup': 'إنشاء حساب',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'full_name': 'الاسم الكامل',
      'remember_me': 'تذكرني',
      'dont_have_account': 'ليس لديك حساب؟',
      'already_have_account': 'لديك حساب بالفعل؟',
      'create_account': 'إنشاء حساب',
      'sign_in': 'تسجيل الدخول',
      'continue_with_google': 'المتابعة مع جوجل',
      'continue_with_apple': 'المتابعة مع آبل',
      'terms_and_conditions': 'شروط الخدمة',
      'privacy_policy': 'سياسة الخصوصية',
      'agree_to_terms': 'أوافق على',
      'and': 'و',
      'enter_email': 'يرجى إدخال بريدك الإلكتروني',
      'enter_valid_email': 'يرجى إدخال عنوان بريد إلكتروني صحيح',
      'enter_password': 'يرجى إدخال كلمة المرور',
      'password_too_short': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'passwords_dont_match': 'كلمات المرور غير متطابقة',
      'enter_full_name': 'يرجى إدخال اسمك الكامل',
      'agree_terms': 'يرجى الموافقة على الشروط والأحكام',
      'account_created': 'تم إنشاء الحساب بنجاح!',
      'login_successful': 'تم تسجيل الدخول بنجاح!',
      'google_signin_demo': 'تسجيل الدخول مع جوجل غير متاح في الوضع التجريبي',
      'or': 'أو',
      'choose_language': 'اختر لغتك المفضلة',
      'english': 'English',
      'arabic': 'العربية',
      'new_text': 'جديد',
      'recent_orders': 'طلبات اللابتوب الأخيرة',
      'ai_chat': 'ذكي',
      'home': 'الرئيسية',
      'profile': 'الملف الشخصي',
      'featured_products': 'المنتجات المميزة',
      'categories': 'الفئات',
      'premium': 'مميز',
      'points': 'النقاط',
      'orders': 'الطلبات',
      'rating': 'التقييم',
      'edit_profile': 'تعديل الملف الشخصي',
      'addresses': 'العناوين',
      'cart': 'السلة',
      'settings': 'الإعدادات',
      'location_not_available': 'الموقع غير متاح',
      'saved_addresses': 'العناوين المحفوظة',
      'add_address': 'إضافة عنوان',
      'default_text': 'افتراضي',
      'edit': 'تعديل',
      'set_as_default': 'تعيين كافتراضي',
      'delete': 'حذف',
      'add_address_dialog': 'إضافة عنوان جديد إلى حسابك',
      'cancel': 'إلغاء',
      'add': 'إضافة',
      'address_name': 'اسم العنوان',
      'address': 'العنوان',
      'fill_all_fields': 'يرجى ملء جميع الحقول',
      'save': 'حفظ',
      'using_current_location': 'استخدام الموقع الحالي',
      'enter_address_name': 'يرجى إدخال اسم العنوان',
      'forgot_password': 'نسيت كلمة المرور',
      'forgot_password_description':
          'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابط لإعادة تعيين كلمة المرور.',
      'reset_password': 'إعادة تعيين كلمة المرور',
      'remember_password': 'تذكرت كلمة المرور؟',
      'back_to_login': 'العودة لتسجيل الدخول',
      'reset_password_sent':
          'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني!',
    },
  };

  String get appName =>
      _localizedValues[locale.languageCode]?['app_name'] ??
      _localizedValues['en']!['app_name']!;
  String get welcome =>
      _localizedValues[locale.languageCode]?['welcome'] ??
      _localizedValues['en']!['welcome']!;
  String get getStarted =>
      _localizedValues[locale.languageCode]?['get_started'] ??
      _localizedValues['en']!['get_started']!;
  String get toContinue =>
      _localizedValues[locale.languageCode]?['to_continue'] ??
      _localizedValues['en']!['to_continue']!;
  String get login =>
      _localizedValues[locale.languageCode]?['login'] ??
      _localizedValues['en']!['login']!;
  String get signup =>
      _localizedValues[locale.languageCode]?['signup'] ??
      _localizedValues['en']!['signup']!;
  String get email =>
      _localizedValues[locale.languageCode]?['email'] ??
      _localizedValues['en']!['email']!;
  String get password =>
      _localizedValues[locale.languageCode]?['password'] ??
      _localizedValues['en']!['password']!;
  String get confirmPassword =>
      _localizedValues[locale.languageCode]?['confirm_password'] ??
      _localizedValues['en']!['confirm_password']!;
  String get fullName =>
      _localizedValues[locale.languageCode]?['full_name'] ??
      _localizedValues['en']!['full_name']!;
  String get forgotPassword =>
      _localizedValues[locale.languageCode]?['forgot_password'] ??
      _localizedValues['en']!['forgot_password']!;
  String get rememberMe =>
      _localizedValues[locale.languageCode]?['remember_me'] ??
      _localizedValues['en']!['remember_me']!;
  String get dontHaveAccount =>
      _localizedValues[locale.languageCode]?['dont_have_account'] ??
      _localizedValues['en']!['dont_have_account']!;
  String get alreadyHaveAccount =>
      _localizedValues[locale.languageCode]?['already_have_account'] ??
      _localizedValues['en']!['already_have_account']!;
  String get createAccount =>
      _localizedValues[locale.languageCode]?['create_account'] ??
      _localizedValues['en']!['create_account']!;
  String get signIn =>
      _localizedValues[locale.languageCode]?['sign_in'] ??
      _localizedValues['en']!['sign_in']!;
  String get continueWithGoogle =>
      _localizedValues[locale.languageCode]?['continue_with_google'] ??
      _localizedValues['en']!['continue_with_google']!;
  String get continueWithApple =>
      _localizedValues[locale.languageCode]?['continue_with_apple'] ??
      _localizedValues['en']!['continue_with_apple']!;
  String get termsAndConditions =>
      _localizedValues[locale.languageCode]?['terms_and_conditions'] ??
      _localizedValues['en']!['terms_and_conditions']!;
  String get privacyPolicy =>
      _localizedValues[locale.languageCode]?['privacy_policy'] ??
      _localizedValues['en']!['privacy_policy']!;
  String get agreeToTerms =>
      _localizedValues[locale.languageCode]?['agree_to_terms'] ??
      _localizedValues['en']!['agree_to_terms']!;
  String get and =>
      _localizedValues[locale.languageCode]?['and'] ??
      _localizedValues['en']!['and']!;
  String get enterEmail =>
      _localizedValues[locale.languageCode]?['enter_email'] ??
      _localizedValues['en']!['enter_email']!;
  String get enterValidEmail =>
      _localizedValues[locale.languageCode]?['enter_valid_email'] ??
      _localizedValues['en']!['enter_valid_email']!;
  String get enterPassword =>
      _localizedValues[locale.languageCode]?['enter_password'] ??
      _localizedValues['en']!['enter_password']!;
  String get passwordTooShort =>
      _localizedValues[locale.languageCode]?['password_too_short'] ??
      _localizedValues['en']!['password_too_short']!;
  String get passwordsDontMatch =>
      _localizedValues[locale.languageCode]?['passwords_dont_match'] ??
      _localizedValues['en']!['passwords_dont_match']!;
  String get enterFullName =>
      _localizedValues[locale.languageCode]?['enter_full_name'] ??
      _localizedValues['en']!['enter_full_name']!;
  String get agreeTerms =>
      _localizedValues[locale.languageCode]?['agree_terms'] ??
      _localizedValues['en']!['agree_terms']!;
  String get accountCreated =>
      _localizedValues[locale.languageCode]?['account_created'] ??
      _localizedValues['en']!['account_created']!;
  String get loginSuccessful =>
      _localizedValues[locale.languageCode]?['login_successful'] ??
      _localizedValues['en']!['login_successful']!;
  String get googleSigninDemo =>
      _localizedValues[locale.languageCode]?['google_signin_demo'] ??
      _localizedValues['en']!['google_signin_demo']!;
  String get or =>
      _localizedValues[locale.languageCode]?['or'] ??
      _localizedValues['en']!['or']!;
  String get chooseLanguage =>
      _localizedValues[locale.languageCode]?['choose_language'] ??
      _localizedValues['en']!['choose_language']!;
  String get english =>
      _localizedValues[locale.languageCode]?['english'] ??
      _localizedValues['en']!['english']!;
  String get arabic =>
      _localizedValues[locale.languageCode]?['arabic'] ??
      _localizedValues['en']!['arabic']!;
  String get newText =>
      _localizedValues[locale.languageCode]?['new_text'] ??
      _localizedValues['en']!['new_text']!;
  String get recentOrders =>
      _localizedValues[locale.languageCode]?['recent_orders'] ??
      _localizedValues['en']!['recent_orders']!;
  String get aiChat =>
      _localizedValues[locale.languageCode]?['ai_chat'] ??
      _localizedValues['en']!['ai_chat']!;
  String get home =>
      _localizedValues[locale.languageCode]?['home'] ??
      _localizedValues['en']!['home']!;
  String get profile =>
      _localizedValues[locale.languageCode]?['profile'] ??
      _localizedValues['en']!['profile']!;
  String get featuredProducts =>
      _localizedValues[locale.languageCode]?['featured_products'] ??
      _localizedValues['en']!['featured_products']!;
  String get categories =>
      _localizedValues[locale.languageCode]?['categories'] ??
      _localizedValues['en']!['categories']!;
  String get premium =>
      _localizedValues[locale.languageCode]?['premium'] ??
      _localizedValues['en']!['premium']!;
  String get points =>
      _localizedValues[locale.languageCode]?['points'] ??
      _localizedValues['en']!['points']!;
  String get orders =>
      _localizedValues[locale.languageCode]?['orders'] ??
      _localizedValues['en']!['orders']!;
  String get rating =>
      _localizedValues[locale.languageCode]?['rating'] ??
      _localizedValues['en']!['rating']!;
  String get editProfile =>
      _localizedValues[locale.languageCode]?['edit_profile'] ??
      _localizedValues['en']!['edit_profile']!;
  String get addresses =>
      _localizedValues[locale.languageCode]?['addresses'] ??
      _localizedValues['en']!['addresses']!;
  String get cart =>
      _localizedValues[locale.languageCode]?['cart'] ??
      _localizedValues['en']!['cart']!;
  String get settings =>
      _localizedValues[locale.languageCode]?['settings'] ??
      _localizedValues['en']!['settings']!;
  String get locationNotAvailable =>
      _localizedValues[locale.languageCode]?['location_not_available'] ??
      _localizedValues['en']!['location_not_available']!;
  String get savedAddresses =>
      _localizedValues[locale.languageCode]?['saved_addresses'] ??
      _localizedValues['en']!['saved_addresses']!;
  String get addAddress =>
      _localizedValues[locale.languageCode]?['add_address'] ??
      _localizedValues['en']!['add_address']!;
  String get defaultText =>
      _localizedValues[locale.languageCode]?['default_text'] ??
      _localizedValues['en']!['default_text']!;
  String get edit =>
      _localizedValues[locale.languageCode]?['edit'] ??
      _localizedValues['en']!['edit']!;
  String get setAsDefault =>
      _localizedValues[locale.languageCode]?['set_as_default'] ??
      _localizedValues['en']!['set_as_default']!;
  String get delete =>
      _localizedValues[locale.languageCode]?['delete'] ??
      _localizedValues['en']!['delete']!;
  String get addAddressDialog =>
      _localizedValues[locale.languageCode]?['add_address_dialog'] ??
      _localizedValues['en']!['add_address_dialog']!;
  String get cancel =>
      _localizedValues[locale.languageCode]?['cancel'] ??
      _localizedValues['en']!['cancel']!;
  String get add =>
      _localizedValues[locale.languageCode]?['add'] ??
      _localizedValues['en']!['add']!;
  String get addressName =>
      _localizedValues[locale.languageCode]?['address_name'] ??
      _localizedValues['en']!['address_name']!;
  String get address =>
      _localizedValues[locale.languageCode]?['address'] ??
      _localizedValues['en']!['address']!;
  String get fillAllFields =>
      _localizedValues[locale.languageCode]?['fill_all_fields'] ??
      _localizedValues['en']!['fill_all_fields']!;
  String get save =>
      _localizedValues[locale.languageCode]?['save'] ??
      _localizedValues['en']!['save']!;
  String get usingCurrentLocation =>
      _localizedValues[locale.languageCode]?['using_current_location'] ??
      _localizedValues['en']!['using_current_location']!;
  String get enterAddressName =>
      _localizedValues[locale.languageCode]?['enter_address_name'] ??
      _localizedValues['en']!['enter_address_name']!;
  String get forgotPasswordDescription =>
      _localizedValues[locale.languageCode]?['forgot_password_description'] ??
      _localizedValues['en']!['forgot_password_description']!;
  String get resetPassword =>
      _localizedValues[locale.languageCode]?['reset_password'] ??
      _localizedValues['en']!['reset_password']!;
  String get rememberPassword =>
      _localizedValues[locale.languageCode]?['remember_password'] ??
      _localizedValues['en']!['remember_password']!;
  String get backToLogin =>
      _localizedValues[locale.languageCode]?['back_to_login'] ??
      _localizedValues['en']!['back_to_login']!;
  String get resetPasswordSent =>
      _localizedValues[locale.languageCode]?['reset_password_sent'] ??
      _localizedValues['en']!['reset_password_sent']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
