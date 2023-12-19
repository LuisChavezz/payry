import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [esText, enText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OK_FN_Payry_08_iniciasesion
  {
    'jum3v5xb': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    '86w70zpm': {
      'es': 'Ingresa tu email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'jz9na8jl': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    'deinoihd': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    '4ps3fpl7': {
      'es': 'Recordarme',
      'ar': 'تذكرنى',
      'de': 'erinnere dich an mich',
      'en': 'remember me',
    },
    'iw6obytv': {
      'es': '¿Olvidaste tu contraseña?',
      'ar': 'هل نسيت كلمة المرور الخاصة بك؟',
      'de': 'Haben Sie Ihr Passwort vergessen?',
      'en': 'Did you forget your password?',
    },
    's9pxafcc': {
      'es': 'Iniciar sesión',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'en': 'Log in',
    },
    '7ia6ktrl': {
      'es': '¿Aún no tienes cuenta?',
      'ar': 'لا تملك حسابا حتى الآن؟',
      'de': 'Sie haben noch kein Konto?',
      'en': 'Don\'t have an account yet?',
    },
    'at591blu': {
      'es': 'Regístrate ahora',
      'ar': 'سجل الان',
      'de': 'Jetzt registrieren',
      'en': 'Register now',
    },
    '27axqe40': {
      'es': 'El correo electrónico es requerido...',
      'ar': 'البريد الالكتروني مطلوب...',
      'de': 'E-Mail ist erforderlich...',
      'en': 'Email is required...',
    },
    'tyqk38p9': {
      'es': 'El correo electrónico es inválido',
      'ar': 'البريد الإلكتروني غير صالح',
      'de': 'E-Mail ist ungültig',
      'en': 'Email is invalid',
    },
    'xclof7dd': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '6h98y1lc': {
      'es': 'La contraseña es requerida',
      'ar': 'كلمة المرور مطلوبة',
      'de': 'Passwort wird benötigt',
      'en': 'Password is required',
    },
    'cgvk80vg': {
      'es': 'La contraseña debe ser de al menos 6 caracteres',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'de': 'Das Passwort muss mindestens aus 6 Zeichen bestehen',
      'en': 'Password must be at least 6 characters',
    },
    'i3p3sikm': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '2bb3vct7': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_05_Registrate
  {
    'ikzhppju': {
      'es': 'Crea una cuenta',
      'ar': 'إنشاء حساب',
      'de': 'Ein Konto erstellen',
      'en': 'Create an account',
    },
    'fjfmidv9': {
      'es': 'Nombre',
      'ar': 'اسم',
      'de': 'Name',
      'en': 'Name',
    },
    'pnyzp1sb': {
      'es': 'Ingresa el nombre...',
      'ar': 'أدخل الاسم...',
      'de': 'Geben Sie den Namen ein...',
      'en': 'Enter the name...',
    },
    '713i7rkd': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    '0adyjdn8': {
      'es': 'Ingresa tu email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'yr4412e8': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'z0n34ab4': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    'u6zo5657': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    'ldhylmt3': {
      'es': 'Confirma Contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Bestätige das Passwort',
      'en': 'Confirm Password',
    },
    'qy98q9l2': {
      'es': 'Confirma tu contraseña...',
      'ar': 'أكد رقمك السري...',
      'de': 'Bestätigen Sie Ihr Passwort...',
      'en': 'Confirm your password...',
    },
    'rze6a28l': {
      'es': 'Crea tu cuenta',
      'ar': 'أنشئ حسابك',
      'de': 'Erstellen Sie Ihr Konto',
      'en': 'creat your account',
    },
    'tyf3xf8g': {
      'es': '¿Ya tienes una cuenta?',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Haben Sie bereits ein Konto?',
      'en': 'Do you already have an account?',
    },
    '1bubxwnj': {
      'es': 'Inicia sesión',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'en': 'Log in',
    },
    '28papsit': {
      'es': 'El nombre es requerido',
      'ar': 'الاسم مطلوب',
      'de': 'Der Name ist erforderlich',
      'en': 'The name is required',
    },
    'oom3qs60': {
      'es': 'El ',
      'ar': 'هو',
      'de': 'Er',
      'en': 'He',
    },
    'xhwrdaev': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'd9g3kky1': {
      'es': 'El correo electrónico es requerido',
      'ar': 'البريد الالكتروني مطلوب',
      'de': 'E-Mail ist erforderlich',
      'en': 'Email is required',
    },
    'wvq5uvay': {
      'es': 'El correo electrónico es inválido',
      'ar': 'البريد الإلكتروني غير صالح',
      'de': 'E-Mail ist ungültig',
      'en': 'Email is invalid',
    },
    'ugge2a69': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'yd0c2etn': {
      'es': 'La contraseña es requerida',
      'ar': 'كلمة المرور مطلوبة',
      'de': 'Passwort wird benötigt',
      'en': 'Password is required',
    },
    '9nowmu28': {
      'es': 'La contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': 'الرقم السري يجب الا يقل عن 6 احرف على الاقل',
      'de': 'Das Passwort muss mindestens 6 Zeichen lang sein',
      'en': 'Password must be at least 6 characters long',
    },
    'xbqqpbcu': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'zvhste4m': {
      'es': 'La confirmación de contraseña es requerida',
      'ar': 'مطلوب تأكيد كلمة المرور',
      'de': 'Eine Passwortbestätigung ist erforderlich',
      'en': 'Password confirmation is required',
    },
    'a0yysijc': {
      'es':
          'La confirmación de contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': 'يجب أن يتكون تأكيد كلمة المرور من 6 أحرف على الأقل',
      'de': 'Die Passwortbestätigung muss mindestens 6 Zeichen lang sein',
      'en': 'Password confirmation must be at least 6 characters long',
    },
    'pxbr9toy': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'momge5oj': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_09_olvidecontrasena
  {
    'g416xg9f': {
      'es': 'Recupera tu contraseña',
      'ar': 'استعادة كلمة المرور الخاصة بك',
      'de': 'Stellen Sie Ihr Passwort wieder her',
      'en': 'Recover your password',
    },
    '9jlu6055': {
      'es':
          'Por favor, ingresa tu correo electrónico para recibir un link donde podrás crear una nueva contraseña.',
      'ar':
          'الرجاء إدخال بريدك الإلكتروني لتلقي رابط يمكنك من خلاله إنشاء كلمة مرور جديدة.',
      'de':
          'Bitte geben Sie Ihre E-Mail-Adresse ein, um einen Link zu erhalten, über den Sie ein neues Passwort erstellen können.',
      'en':
          'Please enter your email to receive a link where you can create a new password.',
    },
    'g7wdqnew': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    'hf9mbsc3': {
      'es': 'Ingresa tu correo...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'b7er5pp3': {
      'es': 'Enviar Correo',
      'ar': 'ارسل بريد',
      'de': 'Mail senden',
      'en': 'Send mail',
    },
    '598b8d3m': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // Payry_60_NotifConfig
  {
    'sc4ff4ce': {
      'es': 'Notificaciones',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'en': 'Notifications',
    },
    'r72zvrv5': {
      'es':
          'Elige el tipo de notificaciones que quieres recibir y actualizaremos la configuración.',
      'ar': 'اختر نوع الإشعارات التي تريد تلقيها وسنقوم بتحديث إعداداتك.',
      'de':
          'Wählen Sie die Art der Benachrichtigungen aus, die Sie erhalten möchten, und wir aktualisieren Ihre Einstellungen.',
      'en':
          'Choose the type of notifications you want to receive and we will update your settings.',
    },
    'gjygkr0n': {
      'es': 'Notificaciones Push',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'en': 'Push Notifications',
    },
    '3y3yhxbk': {
      'es': 'Recibe notificaciones push de payry.',
      'ar': 'تلقي إشعارات الدفع من payry.',
      'de': 'Erhalten Sie Push-Benachrichtigungen von payry.',
      'en': 'Receive push notifications from payry.',
    },
    '1ytebj35': {
      'es': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'en': 'Email Notifications',
    },
    '9lvh5nst': {
      'es':
          'Recine notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funcionalidades.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'en':
          'Receive email notifications from our marketing team about new features.',
    },
    'isgrgbfs': {
      'es': 'Guardar cambios',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'en': 'Save Changes',
    },
    'a96mlyeh': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_01_Splash
  {
    'hs3po7j0': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_02_onboarding1
  {
    'j3w8zg1b': {
      'es': 'Te damos la bienvenida a Payry, tu app de pagos',
      'ar': 'نرحب بكم في Payry، تطبيق الدفع الخاص بك',
      'de': 'Wir begrüßen Sie bei Payry, Ihrer Zahlungs-App',
      'en': 'We welcome you to Payry, your payment app',
    },
    'amg0eoe7': {
      'es': 'Comenzar',
      'ar': 'يبدأ',
      'de': 'Beginnen',
      'en': 'Begin',
    },
    'l1xtbhh4': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_06_confirmacionRegistro
  {
    '6ez7rsj0': {
      'es': 'Cuenta Creada',
      'ar': 'الحساب الذي تم إنشاؤه',
      'de': 'Konto erstellt',
      'en': 'Created Account',
    },
    'z63r0cj8': {
      'es': 'Hemos enviado un correo\npara verificar tu cuenta',
      'ar': 'لقد أرسلنا بريدا إلكترونيا\nللتحقق من حسابك',
      'de': 'Wir haben eine E-Mail gesendet\num Ihr Konto zu verifizieren',
      'en': 'We have sent an email\nto verify your account',
    },
    'w15h5dfo': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'oegnw16m': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_11_olvidecontrasenanueva
  {
    '1scpfbjl': {
      'es': 'Nueva contraseña',
      'ar': 'كلمة المرور الجديدة',
      'de': 'Neues Kennwort',
      'en': 'New Password',
    },
    '0lkt5i1u': {
      'es': 'Ingresa una nueva contraseña y confirma',
      'ar': 'أدخل كلمة المرور الجديدة وقم بتأكيدها',
      'de': 'Geben Sie ein neues Passwort ein und bestätigen Sie',
      'en': 'Enter a new password and confirm',
    },
    'q62evrj4': {
      'es': 'Nueva contraseña',
      'ar': 'كلمة المرور الجديدة',
      'de': 'Neues Kennwort',
      'en': 'New Password',
    },
    'su26th0w': {
      'es': 'Ingresa tu nueva contraseña...',
      'ar': 'أدخل كلمة المرور الجديدة...',
      'de': 'Gib dein neues Passwort ein...',
      'en': 'Enter your new password...',
    },
    '6oxspkdf': {
      'es': 'Confirmar contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Bestätige das Passwort',
      'en': 'Confirm Password',
    },
    'rhsv090u': {
      'es': 'Confirma tu nueva contraseña...',
      'ar': 'قم بتأكيد كلمة المرور الجديدة...',
      'de': 'Bestätigen Sie Ihr neues Passwort...',
      'en': 'Confirm your new password...',
    },
    '8ul4j5vv': {
      'es': 'Cambiar contraseña',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'en': 'Change Password',
    },
    '7vfa2ggp': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_14_Perfil_PENDSW
  {
    'u9x4uw1l': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
    },
    'pw1utjb5': {
      'es': 'Información personal',
      'ar': 'معلومات شخصية',
      'de': 'Persönliche Angaben',
      'en': 'Personal information',
    },
    'ofnghzzj': {
      'es': 'Empresa',
      'ar': 'شركة',
      'de': 'Unternehmen',
      'en': 'Company',
    },
    'c9v6ppr8': {
      'es': 'Verificar email',
      'ar': 'التحقق من البريد الإلكتروني',
      'de': 'E-Mail bestätigen',
      'en': 'Verify email',
    },
    'ch95hbw0': {
      'es': 'Notificaciones',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'en': 'Notifications',
    },
    'b6dxtbml': {
      'es': 'Cerrar sesión',
      'ar': 'تسجيل خروج',
      'de': 'abmelden',
      'en': 'Sign off',
    },
    '9sck8j18': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_15_EditProfile
  {
    '67p8kkfi': {
      'es': 'Editar información personal',
      'ar': 'تحرير المعلومات الشخصية',
      'de': 'Persönliche Informationen bearbeiten',
      'en': 'Edit personal information',
    },
    '2hvik180': {
      'es': 'Nombre',
      'ar': 'اسم',
      'de': 'Name',
      'en': 'Name',
    },
    'jvxuxc3d': {
      'es': 'Ingresa tu nombre...',
      'ar': 'أدخل أسمك...',
      'de': 'Gib deinen Namen ein...',
      'en': 'Enter your name...',
    },
    'luiu9ows': {
      'es': 'Celular',
      'ar': 'الهاتف الخلوي',
      'de': 'Handy',
      'en': 'Cell phone',
    },
    '937utiyy': {
      'es': 'Ingresa tu celular...',
      'ar': 'أدخل رقم جوالك...',
      'de': 'Geben Sie Ihre Handynummer ein...',
      'en': 'Enter your cell phone...',
    },
    '47vlgt4r': {
      'es': 'Estatus',
      'ar': 'حالة',
      'de': 'Status',
      'en': 'Status',
    },
    '4lwilji8': {
      'es': 'Alta',
      'ar': 'عالي',
      'de': 'hoch',
      'en': 'high',
    },
    'mclx8r2m': {
      'es': 'Baja',
      'ar': 'قليل',
      'de': 'Niedrig',
      'en': 'Low',
    },
    '6i4rcooy': {
      'es': 'Estatus',
      'ar': 'حالة',
      'de': 'Status',
      'en': 'Status',
    },
    'lpt1swye': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    '8w1emfrl': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    '7zgk5aqm': {
      'es': 'El nombre es requerido',
      'ar': 'الاسم مطلوب',
      'de': 'Der Name ist erforderlich',
      'en': 'The name is required',
    },
    's8g227zo': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'afkqo1mv': {
      'es': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
    },
    '33sy0rs1': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '4ysxke82': {
      'es': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
    },
    'bifwrifl': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'mijkkrqs': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_16_verificarNumero
  {
    '1y3hwffm': {
      'es': 'Te enviaremos un SMS con un código de verficación',
      'ar': 'سوف نرسل لك رسالة نصية قصيرة تحتوي على رمز التحقق',
      'de': 'Wir senden Ihnen eine SMS mit einem Bestätigungscode',
      'en': 'We will send you an SMS with a verification code',
    },
    'sas1fi5m': {
      'es': 'Celular',
      'ar': 'الهاتف الخلوي',
      'de': 'Handy',
      'en': 'Cell phone',
    },
    '7hmdi9ah': {
      'es': 'Ingresa los 10 digitos de tu celular...',
      'ar': 'أدخل 10 أرقام من هاتفك الخلوي...',
      'de': 'Geben Sie die 10 Ziffern Ihrer Mobiltelefonnummer ein...',
      'en': 'Enter the 10 digits of your cell phone...',
    },
    'gggqysoi': {
      'es': 'Enviar código de validación',
      'ar': 'إرسال رمز التحقق',
      'de': 'Validierungscode senden',
      'en': 'Send validation code',
    },
    'istdaqmd': {
      'es': 'Verifica tu número de teléfono',
      'ar': 'اكد على رقم هاتفك او جوالك',
      'de': 'Bestätige deine Telefonnummer',
      'en': 'Verify your phone number',
    },
    '2p0xo9dq': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_17_verificarOTP
  {
    'hojxjzzq': {
      'es': 'Ingresa el código aquí',
      'ar': 'أدخل الرمز هنا',
      'de': 'Geben Sie hier den Code ein',
      'en': 'Enter the code here',
    },
    '23rofti3': {
      'es': 'Tiempo restante para verificar código:',
      'ar': 'الوقت المتبقي للتحقق من الكود:',
      'de': 'Verbleibende Zeit zum Verifizieren des Codes:',
      'en': 'Remaining time to verify code:',
    },
    'zn3cfybp': {
      'es': 'seg.',
      'ar': 'ثانية.',
      'de': 'Sek.',
      'en': 'sec.',
    },
    'q87dx548': {
      'es': 'Verificar',
      'ar': 'يؤكد',
      'de': 'Verifizieren',
      'en': 'Verify',
    },
    'e9n3ppnb': {
      'es': 'Verifica tu número de teléfono',
      'ar': 'اكد على رقم هاتفك او جوالك',
      'de': 'Bestätige deine Telefonnummer',
      'en': 'Verify your phone number',
    },
    'eibdrzwt': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_19_formularioEmpresa
  {
    '5uh5eome': {
      'es': 'Empresas',
      'ar': 'شركات',
      'de': 'Firmen',
      'en': 'Companies',
    },
    'u8fnr9qu': {
      'es': 'Empresa',
      'ar': 'شركة',
      'de': 'Unternehmen',
      'en': 'Company',
    },
    '46kcduuj': {
      'es': 'Ingresa el nombre de tu empresa...',
      'ar': 'أدخل اسم شركتك...',
      'de': 'Geben Sie Ihren Firmennamen ein...',
      'en': 'Enter your company name...',
    },
    'gyv162vv': {
      'es': 'Alias',
      'ar': 'الاسم المستعار',
      'de': 'Alias',
      'en': 'Alias',
    },
    '857jwk6h': {
      'es': 'Un nombre corto que te identifique...',
      'ar': 'اسم قصير يحدد هويتك..',
      'de': 'Ein kurzer Name, der Sie identifiziert...',
      'en': 'A short name that identifies you...',
    },
    '8ypcwsg1': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    'ajo1dman': {
      'es': 'Ingresa el correo electrónico...',
      'ar': 'أدخل البريد الإلكتروني...',
      'de': 'Email eingeben...',
      'en': 'Enter email...',
    },
    'j3ou680r': {
      'es': 'Calle',
      'ar': 'شارع',
      'de': 'Straße',
      'en': 'Street',
    },
    '49wdakb5': {
      'es': 'Ingresa la calle...',
      'ar': 'أدخل الشارع...',
      'de': 'Betreten Sie die Straße...',
      'en': 'Enter the street...',
    },
    'u46t2e2d': {
      'es': 'Número',
      'ar': 'رقم',
      'de': 'Nummer',
      'en': 'Number',
    },
    'yjbwt5nz': {
      'es': 'Ingresa el número...',
      'ar': 'أدخل الرقم...',
      'de': 'Geben Sie die Nummer ein...',
      'en': 'Enter the number...',
    },
    'p8r6nj86': {
      'es': 'Colonia',
      'ar': 'كولونيا',
      'de': 'Köln',
      'en': 'Cologne',
    },
    'zz9ua64x': {
      'es': 'Ingresa la colonia...',
      'ar': 'أدخل المستعمرة...',
      'de': 'Betreten Sie die Kolonie...',
      'en': 'Enter the colony...',
    },
    'b0cp85l7': {
      'es': 'Ciudad',
      'ar': 'مدينة',
      'de': 'Stadt',
      'en': 'City',
    },
    'vib32lqq': {
      'es': 'Ingresa la ciudad...',
      'ar': 'أدخل المدينة...',
      'de': 'Betreten Sie die Stadt...',
      'en': 'Enter the city...',
    },
    'go8ghc4a': {
      'es': 'Aguascalientes',
      'ar': 'أغواسكاليينتس',
      'de': 'Aguascalientes',
      'en': 'Aguascalientes',
    },
    'zjx3ybtx': {
      'es': 'Baja California',
      'ar': 'باجا كاليفورنيا',
      'de': 'Baja California',
      'en': 'Baja California',
    },
    '1xw1froj': {
      'es': 'Baja California Sur',
      'ar': 'باجا كاليفورنيا سور',
      'de': 'Baja California Sur',
      'en': 'Baja California Sur',
    },
    '7zmqy4y2': {
      'es': 'Campeche',
      'ar': 'كامبيتشي',
      'de': 'Campeche',
      'en': 'Campeche',
    },
    'zejrbq2m': {
      'es': 'Chiapas',
      'ar': 'تشياباس',
      'de': 'Chiapas',
      'en': 'Chiapas',
    },
    '4lt8m6f0': {
      'es': 'Chihuahua',
      'ar': 'تشيهواهوا',
      'de': 'Chihuahua',
      'en': 'Chihuahua',
    },
    '455acntm': {
      'es': 'Coahuila de Zaragoza',
      'ar': 'كواويلا دي سرقسطة',
      'de': 'Coahuila de Zaragoza',
      'en': 'Coahuila de Zaragoza',
    },
    'x4id3r4f': {
      'es': 'Colima',
      'ar': 'كوليما',
      'de': 'Colima',
      'en': 'Colima',
    },
    'iutg88s8': {
      'es': 'Ciudad de México',
      'ar': 'مدينة مكسيكو',
      'de': 'Mexiko Stadt',
      'en': 'Mexico City',
    },
    'xf0d10v2': {
      'es': 'Durango',
      'ar': 'دورانجو',
      'de': 'Durango',
      'en': 'Durango',
    },
    'himy5mgg': {
      'es': 'Guanajuato',
      'ar': 'غواناخواتو',
      'de': 'Guanajuato',
      'en': 'Guanajuato',
    },
    'os7d06at': {
      'es': 'Guerrero',
      'ar': 'محارب',
      'de': 'Krieger',
      'en': 'Warrior',
    },
    '0nytbfgj': {
      'es': 'Hidalgo',
      'ar': 'انسان محترم',
      'de': 'Gentleman',
      'en': 'Gentleman',
    },
    's9i4wcfs': {
      'es': 'Jalisco',
      'ar': 'خاليسكو',
      'de': 'Jalisco',
      'en': 'Jalisco',
    },
    '7e2o4bjj': {
      'es': 'México',
      'ar': 'المكسيك',
      'de': 'Mexiko',
      'en': 'Mexico',
    },
    'hnzn52vk': {
      'es': 'Michoacán',
      'ar': 'ميتشواكان',
      'de': 'Michoacan',
      'en': 'Michoacan',
    },
    'yhqd49e9': {
      'es': 'Morelos',
      'ar': 'موريلوس',
      'de': 'Morelos',
      'en': 'Morelos',
    },
    '9ok7sq6w': {
      'es': 'Nayarit',
      'ar': 'ناياريت',
      'de': 'Nayarit',
      'en': 'Nayarit',
    },
    'qpfc6fd3': {
      'es': 'Nuevo León',
      'ar': 'أسد جديد',
      'de': 'Neuer Löwe',
      'en': 'New Lion',
    },
    '1o7ue3ye': {
      'es': 'Oaxaca',
      'ar': 'أواكساكا',
      'de': 'Oaxaca',
      'en': 'Oaxaca',
    },
    'q9ksfdld': {
      'es': 'Puebla',
      'ar': 'بويبلا',
      'de': 'Puebla',
      'en': 'Puebla',
    },
    'z6s6i98l': {
      'es': 'Querétaro',
      'ar': 'كويريتارو',
      'de': 'Querétaro',
      'en': 'Queretaro',
    },
    'dpc5645k': {
      'es': 'Quintana Roo',
      'ar': 'كوينتانا رو',
      'de': 'Quintana Roo',
      'en': 'Quintana Roo',
    },
    'avbuybt2': {
      'es': 'San Luis Potosí',
      'ar': 'سان لويس بوتوسي',
      'de': 'San Luis Potosi',
      'en': 'San Luis Potosi',
    },
    'ak4kpq8i': {
      'es': 'Sinaloa',
      'ar': 'سينالوا',
      'de': 'Sinaloa',
      'en': 'Sinaloa',
    },
    'ucxahdvp': {
      'es': 'Sonora',
      'ar': 'سونورا',
      'de': 'Sonora',
      'en': 'Sonora',
    },
    '5plh4f9e': {
      'es': 'Tabasco',
      'ar': 'تاباسكو',
      'de': 'Tabasco',
      'en': 'Tabasco',
    },
    'o8izppq8': {
      'es': 'Tamaulipas',
      'ar': 'تاماوليباس',
      'de': 'Tamaulipas',
      'en': 'Tamaulipas',
    },
    'mq3r0tea': {
      'es': 'Tlaxcala',
      'ar': 'تلاكسكالا',
      'de': 'Tlaxcala',
      'en': 'Tlaxcala',
    },
    'jmv2keih': {
      'es': 'Veracruz',
      'ar': 'فيراكروز',
      'de': 'Veracruz',
      'en': 'Veracruz',
    },
    'v6vt8xik': {
      'es': 'Yucatán',
      'ar': 'يوكاتان',
      'de': 'Yucatan',
      'en': 'Yucatan',
    },
    'fj4jzs3y': {
      'es': 'Zacatecas',
      'ar': 'زاكاتيكاس',
      'de': 'Zacatecas',
      'en': 'Zacatecas',
    },
    'f10sk94j': {
      'es': 'Selecciona el estado...',
      'ar': 'اختر الولاية...',
      'de': 'Wählen Sie das Bundesland aus...',
      'en': 'Select the state...',
    },
    'cqiy6sv1': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    's5362kms': {
      'es': 'México',
      'ar': 'المكسيك',
      'de': 'Mexiko',
      'en': 'Mexico',
    },
    'ca8533s2': {
      'es': 'Selecciona el país...',
      'ar': 'اختر الدولة...',
      'de': 'Wählen Sie das Land aus...',
      'en': 'Select the country...',
    },
    'uy4mfjvb': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    '1mvj4d4m': {
      'es': 'Código postal',
      'ar': 'الرمز البريدي',
      'de': 'Postleitzahl',
      'en': 'Postal Code',
    },
    'v4wbmqbe': {
      'es': 'Ingresa el código postal...',
      'ar': 'أدخل الرمز البريدي...',
      'de': 'Bitte Postleitzahl eingeben...',
      'en': 'Enter zip code...',
    },
    'w7ql9v86': {
      'es': 'Activo',
      'ar': 'أصل',
      'de': 'Vermögenswert',
      'en': 'Asset',
    },
    '84qv8zmx': {
      'es': 'Inactivo',
      'ar': 'عاطل',
      'de': 'Leerlauf',
      'en': 'Idle',
    },
    '1ubo04ht': {
      'es': 'Selecciona el estatus...',
      'ar': 'حدد الحالة...',
      'de': 'Wählen Sie den Status aus...',
      'en': 'Select the status...',
    },
    'ldwj4coo': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    '0g424hjt': {
      'es': '¿Necesitas factura?',
      'ar': 'هل تحتاج إلى فاتورة؟',
      'de': 'Sie benötigen eine Rechnung?',
      'en': 'Do you need an invoice?',
    },
    'us2wvb9t': {
      'es': 'Si/No',
      'ar': 'لكن',
      'de': 'Aber',
      'en': 'But',
    },
    '83pzx1dt': {
      'es': 'RFC',
      'ar': 'RFC',
      'de': 'RFC',
      'en': 'RFC',
    },
    'jm8dwn69': {
      'es': 'Ingresa el RFC como en tu CSF...',
      'ar': 'أدخل RFC كما هو الحال في ملف CSF الخاص بك...',
      'de': 'Geben Sie den RFC wie in Ihrem CSF ein...',
      'en': 'Enter the RFC as in your CSF...',
    },
    '5y9oh7vq': {
      'es': 'CFDI 1',
      'ar': 'كفدي 1',
      'de': 'CFDI 1',
      'en': 'CFDI 1',
    },
    'p57psx54': {
      'es': 'CFDI 2',
      'ar': 'كفدي 2',
      'de': 'CFDI 2',
      'en': 'CFDI 2',
    },
    'k1708aa0': {
      'es': 'CFDI 3',
      'ar': 'كفدي 3',
      'de': 'CFDI 3',
      'en': 'CFDI 3',
    },
    'wnlj5rzy': {
      'es': 'Selecciona el régimen fiscal...',
      'ar': 'اختر النظام الضريبي...',
      'de': 'Wählen Sie das Steuersystem aus...',
      'en': 'Select the tax regime...',
    },
    'igdj7lpd': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    '8ve08x9p': {
      'es': 'CFDI 1',
      'ar': 'كفدي 1',
      'de': 'CFDI 1',
      'en': 'CFDI 1',
    },
    'vuler3fa': {
      'es': 'CFDI 2',
      'ar': 'كفدي 2',
      'de': 'CFDI 2',
      'en': 'CFDI 2',
    },
    'a5ajcag5': {
      'es': 'CFDI 3',
      'ar': 'كفدي 3',
      'de': 'CFDI 3',
      'en': 'CFDI 3',
    },
    'u9dffgl9': {
      'es': 'Selecciona el uso del CFDI...',
      'ar': 'اختر استخدام CFDI...',
      'de': 'Wählen Sie die Verwendung von CFDI aus...',
      'en': 'Select the use of CFDI...',
    },
    '8a4kvhmg': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    'nb8qhyyv': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    '519tf078': {
      'es': 'Datos bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank data',
    },
    '8mhw9j38': {
      'es': 'API',
      'ar': 'واجهة برمجة التطبيقات',
      'de': 'API',
      'en': 'API',
    },
    'ywefvk2q': {
      'es': 'El nombre es requerido',
      'ar': 'الاسم مطلوب',
      'de': 'Der Name ist erforderlich',
      'en': 'The name is required',
    },
    'e9uwq3ln': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'ojg5b58u': {
      'es': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
    },
    'sdhk9jy7': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'tp3wowqm': {
      'es': 'El correo electrónico es requerido',
      'ar': 'البريد الالكتروني مطلوب',
      'de': 'E-Mail ist erforderlich',
      'en': 'Email is required',
    },
    'fpf8iioc': {
      'es': 'El correo electrónico es inválido',
      'ar': 'البريد الإلكتروني غير صالح',
      'de': 'E-Mail ist ungültig',
      'en': 'Email is invalid',
    },
    'kftaqk6c': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'jqf4gofj': {
      'es': 'La calle es requerida',
      'ar': 'الشارع مطلوب',
      'de': 'Die Straße ist erforderlich',
      'en': 'The street is required',
    },
    '3bcoaxfl': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'bn5m7502': {
      'es': 'El número de calle es requerido',
      'ar': 'رقم الشارع مطلوب',
      'de': 'Hausnummer ist erforderlich',
      'en': 'Street number is required',
    },
    'gsxcxvb0': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'o0w310ve': {
      'es': 'La colonia es requerida',
      'ar': 'المستعمرة مطلوبة',
      'de': 'Die Kolonie ist erforderlich',
      'en': 'The colony is required',
    },
    'vc91ilvw': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'la4d1fmp': {
      'es': 'La ciudad es requerida',
      'ar': 'المدينة مطلوبة',
      'de': 'Die Stadt ist gefragt',
      'en': 'The city is required',
    },
    'w2yg9p4k': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '7dht57pp': {
      'es': 'El código postal es requerido',
      'ar': 'الرمز البريدي مطلوب',
      'de': 'Postleitzahl ist erforderlich',
      'en': 'Zip code is required',
    },
    '6qfdmdr8': {
      'es': 'El código postal debe contener exactamente 5 dígitos',
      'ar': 'يجب أن يحتوي الرمز البريدي على 5 أرقام بالضبط',
      'de': 'Die Postleitzahl muss genau 5 Ziffern enthalten',
      'en': 'The zip code must contain exactly 5 digits',
    },
    'wwsm4d49': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '1e8m9n58': {
      'es': 'El RFC es requerido',
      'ar': 'مطلوب RFC',
      'de': 'RFC ist erforderlich',
      'en': 'RFC is required',
    },
    'ipuqaog2': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'n3ppdc0z': {
      'es': 'El régimen físcal es requerido',
      'ar': 'النظام الضريبي مطلوب',
      'de': 'Das Steuersystem ist erforderlich',
      'en': 'The tax regime is required',
    },
    'jeu90uz3': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'xb4ro7ev': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_20_datosBancarios
  {
    'l0gu5g4f': {
      'es': 'Datos bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank data',
    },
    '6pqk2wso': {
      'es': 'CLABE',
      'ar': 'كلاب',
      'de': 'CLABE',
      'en': 'CLABE',
    },
    'bab8ykx4': {
      'es': 'Ingresa tu CLABE a 18 dígitos',
      'ar': 'أدخل CLABE المكون من 18 رقمًا',
      'de': 'Geben Sie Ihren 18-stelligen CLABE ein',
      'en': 'Enter your 18-digit CLABE',
    },
    '1f1inxe7': {
      'es': 'Banco',
      'ar': 'بنك',
      'de': 'Bank',
      'en': 'Bank',
    },
    'udwka0sy': {
      'es': 'Banco',
      'ar': 'بنك',
      'de': 'Bank',
      'en': 'Bank',
    },
    '1jp6ppa3': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    'l7wp2gbp': {
      'es': 'La CLABE es requerida',
      'ar': 'مطلوب CLABE',
      'de': 'CLABE ist erforderlich',
      'en': 'CLABE is required',
    },
    'bqt618xs': {
      'es': 'La CLABE debe contener 18 caracteres',
      'ar': 'يجب أن يحتوي CLABE على 18 حرفًا',
      'de': 'Der CLABE muss 18 Zeichen enthalten',
      'en': 'The CLABE must contain 18 characters',
    },
    'ej4p7bia': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '8m8nisg8': {
      'es': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
    },
    'xqtt572a': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '1e5muyr7': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_22_conexionAPI
  {
    'd33inlx3': {
      'es': 'Conexión (API)',
      'ar': 'الاتصال (واجهة برمجة التطبيقات)',
      'de': 'Verbindung (API)',
      'en': 'Connection (API)',
    },
    'ybmok4k9': {
      'es': 'API',
      'ar': 'واجهة برمجة التطبيقات',
      'de': 'API',
      'en': 'API',
    },
    'sdaiqnp0': {
      'es': 'Ingrese su API...',
      'ar': 'أدخل واجهة برمجة التطبيقات الخاصة بك...',
      'de': 'Geben Sie Ihre API ein...',
      'en': 'Enter your API...',
    },
    '8edm3ker': {
      'es': 'API Secret',
      'ar': 'سر واجهة برمجة التطبيقات',
      'de': 'API-Geheimnis',
      'en': 'API Secret',
    },
    '7y5yadtv': {
      'es': 'Campo automático según la CLABE',
      'ar': 'الحقل التلقائي وفقًا لـ CLABE',
      'de': 'Automatisches Feld nach CLABE',
      'en': 'Automatic field according to CLABE',
    },
    'qxt6sy2m': {
      'es': 'Regenerar',
      'ar': 'تجديد',
      'de': 'Regenerieren',
      'en': 'Regenerate',
    },
    '45id83aw': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_23_invitarUsuario
  {
    '9a0k2nie': {
      'es': 'Invitar usuario',
      'ar': 'دعوة المستخدم',
      'de': 'Benutzer einladen',
      'en': 'Invite user',
    },
    '9n5ct4z6': {
      'es':
          'Ingresa el correo electrónico de la persona a la que quieres invitar a tu sesión de Payry.',
      'ar':
          'أدخل البريد الإلكتروني للشخص الذي تريد دعوته إلى جلسة Payry الخاصة بك.',
      'de':
          'Geben Sie die E-Mail-Adresse der Person ein, die Sie zu Ihrer Payry-Sitzung einladen möchten.',
      'en':
          'Enter the email of the person you want to invite to your Payry session.',
    },
    'bcvyk3sm': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    'x6bguf0q': {
      'es': 'Ingresa un correo electrónico...',
      'ar': 'أدخل البريد الإلكتروني...',
      'de': 'Geben Sie eine E-Mail ein...',
      'en': 'Enter an email...',
    },
    'ojlbpuz8': {
      'es': 'Enviar invitación',
      'ar': 'إرسال دعوة',
      'de': 'Einladung senden',
      'en': 'Send invitation',
    },
    'dvyr7c3n': {
      'es': 'Debes ingresar un correo electrónico',
      'ar': 'يجب إدخال البريد الإلكتروني',
      'de': 'Sie müssen eine E-Mail-Adresse eingeben',
      'en': 'You must enter an email',
    },
    'zbm4lg3a': {
      'es': 'Correo electrónico inválido',
      'ar': 'بريد إلكتروني خاطئ',
      'de': 'Ungültige E-Mail',
      'en': 'Invalid email',
    },
    'y1ru9g9v': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'g7akq31o': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_24_listadoUsuarios
  {
    'lwfdgm61': {
      'es': 'Listado de usuarios',
      'ar': 'قائمة المستخدم',
      'de': 'Benutzerliste',
      'en': 'User List',
    },
    '6nb1maod': {
      'es': 'Invitar amigo',
      'ar': 'دعوة صديق',
      'de': 'Freund einladen',
      'en': 'Invite friend',
    },
    'wrz2781b': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_25_permisos
  {
    'zm3d4597': {
      'es': 'Permisos',
      'ar': 'الأذونات',
      'de': 'Berechtigungen',
      'en': 'Permissions',
    },
    'n45iwjv6': {
      'es': 'Acciones',
      'ar': 'أجراءات',
      'de': 'Aktionen',
      'en': 'Actions',
    },
    '2pmt60gi': {
      'es': 'Generar QR',
      'ar': 'توليد ريال قطري',
      'de': 'QR generieren',
      'en': 'Generate QR',
    },
    'p0didp27': {
      'es': 'Consultar QR de todos \nlos usuarios',
      'ar': 'تحقق من QR للجميع\nالمستخدمين',
      'de': 'Überprüfen Sie den QR aller Personen\ndie Benutzer',
      'en': 'Check everyone\'s QR\nthe users',
    },
    '1uwsd8l0': {
      'es': 'Generar SMS',
      'ar': 'توليد الرسائل القصيرة',
      'de': 'SMS generieren',
      'en': 'Generate SMS',
    },
    '4nvavto5': {
      'es': 'Consultar SMS de todos\nlos usuarios',
      'ar': 'التحقق من الرسائل القصيرة من الجميع\nالمستخدمين',
      'de': 'Überprüfen Sie die SMS von allen\ndie Benutzer',
      'en': 'Check SMS from everyone\nthe users',
    },
    'dnn20e44': {
      'es': 'Ver transferencias',
      'ar': 'عرض التحويلات',
      'de': 'Transfers ansehen',
      'en': 'View transfers',
    },
    'eqw2hhvs': {
      'es': 'Generar devoluciones',
      'ar': 'توليد عوائد',
      'de': 'Rendite generieren',
      'en': 'Generate returns',
    },
    '0y2l5cx0': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_27_solicitarQR
  {
    'x2jheoni': {
      'es': 'Solicitar pago con QR',
      'ar': 'طلب الدفع باستخدام QR',
      'de': 'Fordern Sie die Zahlung mit QR an',
      'en': 'Request payment with QR',
    },
    'lupf7333': {
      'es': 'Concepto',
      'ar': 'مفهوم',
      'de': 'Konzept',
      'en': 'Concept',
    },
    'rj4tcl4w': {
      'es': 'Ingresa el concepto de pago...',
      'ar': 'أدخل مفهوم الدفع...',
      'de': 'Geben Sie das Zahlungskonzept ein...',
      'en': 'Enter the payment concept...',
    },
    'q9t6j3yi': {
      'es': 'Importe',
      'ar': 'كمية',
      'de': 'Menge',
      'en': 'Amount',
    },
    'xnnflt44': {
      'es': 'Ingresa el importe...',
      'ar': 'أدخل المبلغ...',
      'de': 'Geben Sie den Betrag ein...',
      'en': 'Enter the amount...',
    },
    'r6vi2thx': {
      'es': 'Generar QR',
      'ar': 'توليد ريال قطري',
      'de': 'QR generieren',
      'en': 'Generate QR',
    },
    'h3sgrdco': {
      'es': 'El concepto es requerido',
      'ar': 'المفهوم مطلوب',
      'de': 'Das Konzept ist erforderlich',
      'en': 'The concept is required',
    },
    'pwrztfxc': {
      'es': 'El concepto debe contener al menos 10 caracteres',
      'ar': 'يجب أن يحتوي المفهوم على 10 أحرف على الأقل',
      'de': 'Das Konzept muss mindestens 10 Zeichen enthalten',
      'en': 'The concept must contain at least 10 characters',
    },
    'mid5m10r': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'fqxgivzu': {
      'es': 'El importe es requerido',
      'ar': 'المبلغ مطلوب',
      'de': 'Der Betrag ist erforderlich',
      'en': 'The amount is required',
    },
    'aa4xq3ih': {
      'es': 'El formato del importe es inválido',
      'ar': 'تنسيق المبلغ غير صالح',
      'de': 'Das Betragsformat ist ungültig',
      'en': 'The amount format is invalid',
    },
    'pn4cpqxm': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'erb0b90p': {
      'es': 'Más opciones de QR',
      'ar': 'المزيد من خيارات QR',
      'de': 'Weitere QR-Optionen',
      'en': 'More QR options',
    },
    '5uxuvkt1': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_28_qrGenerado
  {
    'xl43giyv': {
      'es': 'Código QR generado',
      'ar': 'تم إنشاء رمز الاستجابة السريعة',
      'de': 'Generierter QR-Code',
      'en': 'Generated QR code',
    },
    'etu2mvv6': {
      'es': 'Importe',
      'ar': 'كمية',
      'de': 'Menge',
      'en': 'Amount',
    },
    'euqk06k0': {
      'es': 'Concepto',
      'ar': 'مفهوم',
      'de': 'Konzept',
      'en': 'Concept',
    },
    'x3ht5qhq': {
      'es': 'Estatus',
      'ar': 'حالة',
      'de': 'Status',
      'en': 'Status',
    },
    'x06hb21g': {
      'es': 'Compartir QR',
      'ar': 'مشاركة ريال قطري',
      'de': 'QR teilen',
      'en': 'Share QR',
    },
    'fdmdguk1': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_29_opcionesQR
  {
    'a9ak7qjr': {
      'es': 'Más opciones para QR',
      'ar': 'المزيد من الخيارات لـ QR',
      'de': 'Weitere Optionen für QR',
      'en': 'More options for QR',
    },
    'd9u1u16r': {
      'es': 'Generar QR',
      'ar': 'توليد ريال قطري',
      'de': 'QR generieren',
      'en': 'Generate QR',
    },
    '9cevfu5f': {
      'es': 'Consultar QR',
      'ar': 'استشارة ريال قطري',
      'de': 'Konsultieren Sie QR',
      'en': 'Consult QR',
    },
    'sizja0pt': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_30_historialQRs
  {
    'ta7l4a98': {
      'es': 'Historial de QR\'s',
      'ar': 'تاريخ الاستجابة السريعة',
      'de': 'QR-Verlauf',
      'en': 'QR History',
    },
    'hnwglb2z': {
      'es': 'Buscar concepto de QR',
      'ar': 'بحث مفهوم QR',
      'de': 'Suchen Sie nach QR-Konzept',
      'en': 'Search QR concept',
    },
    's6znzru1': {
      'es': 'Buscar...',
      'ar': 'بحث...',
      'de': 'Suche...',
      'en': 'Look for...',
    },
    'vku13j4l': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_35_historialSMS
  {
    'mz5uoln6': {
      'es': 'Historial de SMS',
      'ar': 'تاريخ الرسائل القصيرة',
      'de': 'SMS-Verlauf',
      'en': 'SMS history',
    },
    'pr0htgdd': {
      'es': 'Buscar concepto de SMS',
      'ar': 'بحث مفهوم الرسائل القصيرة',
      'de': 'Suche nach SMS-Konzept',
      'en': 'Search SMS concept',
    },
    'bag8pw7e': {
      'es': 'Buscar...',
      'ar': 'بحث...',
      'de': 'Suche...',
      'en': 'Look for...',
    },
    'xbz9cmrs': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_34_opcionesSMS
  {
    'wr0624dk': {
      'es': 'Más opciones para SMS',
      'ar': 'المزيد من الخيارات للرسائل القصيرة',
      'de': 'Weitere Optionen für SMS',
      'en': 'More options for SMS',
    },
    'p3t1lkwz': {
      'es': 'Generar SMS',
      'ar': 'توليد الرسائل القصيرة',
      'de': 'SMS generieren',
      'en': 'Generate SMS',
    },
    'wnfqkq3b': {
      'es': 'Consultar SMS',
      'ar': 'استشر الرسائل القصيرة',
      'de': 'Konsultieren Sie SMS',
      'en': 'Consult SMS',
    },
    'kg7rzyhe': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_31_detallesdeQR
  {
    'mm5hpk78': {
      'es': 'Concepto',
      'ar': 'مفهوم',
      'de': 'Konzept',
      'en': 'Concept',
    },
    'kvcrg8nj': {
      'es': 'Estatus',
      'ar': 'حالة',
      'de': 'Status',
      'en': 'Status',
    },
    'j7p86qgo': {
      'es': 'Ver recibo',
      'ar': 'انظر الإيصال',
      'de': 'Siehe Quittung',
      'en': 'See receipt',
    },
    'ydw72xtl': {
      'es': 'Cancelar QR',
      'ar': 'إلغاء QR',
      'de': 'QR abbrechen',
      'en': 'Cancel QR',
    },
    'gdrwosru': {
      'es': 'Devolver',
      'ar': 'يعود',
      'de': 'Zurückkehren',
      'en': 'Return',
    },
    '25n3if0w': {
      'es': 'Descargar',
      'ar': 'تسريح',
      'de': 'Entladung',
      'en': 'Discharge',
    },
    'uasq3vqt': {
      'es': 'Compartir',
      'ar': 'يشارك',
      'de': 'Aktie',
      'en': 'Share',
    },
    'uiwum3xo': {
      'es': 'Detalles de QR',
      'ar': 'تفاصيل QR',
      'de': 'QR-Details',
      'en': 'QR Details',
    },
    'p4gr2ezk': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_37_facturas
  {
    '4bjqyvsl': {
      'es': 'Facturación',
      'ar': 'الفواتير',
      'de': 'Abrechnung',
      'en': 'Billing',
    },
    'me4wl4p3': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_42_Terminosycondiciones
  {
    'bt8srygl': {
      'es': 'Términos y condiciones',
      'ar': 'الأحكام والشروط',
      'de': 'Geschäftsbedingungen',
      'en': 'Terms and Conditions',
    },
    'lv9mqnhn': {
      'es': '1. Términos',
      'ar': '1. الشروط',
      'de': '1. Bedingungen',
      'en': '1. Terms',
    },
    'x9at1eqx': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. لم يتم إنشاء عصر الاسم. Donec ultrices tincidunt arcu غير صودا. Velit sed ullamcorper morbi tincidunt. Molestie iaculis يؤدي إلى ظهور شحوم كريهة. موريس لا يطابق السيرة الذاتية أبدًا. لا يوجد شيء غير جيد. Faucibus nisl tincidunt eget nullam not nisi est. ليو duis ut diam quam nulla.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sitzt mit Nulla Facilisi morbi tempus. Es wurde kein Name erstellt. Keine Schmerzen, keine Schmerzen. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis and erat pellentesque adipiscing. Mauris stimmt nie mit seinem Lebenslauf überein. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris never congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
    },
    '1h2ffv7r': {
      'es': '2. Licencia de uso',
      'ar': '2. ترخيص الاستخدام',
      'de': '2. Nutzungslizenz',
      'en': '2. License to use',
    },
    '6d8oivfd': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. لم يتم إنشاء عصر الاسم. Donec ultrices tincidunt arcu غير صودا. Velit sed ullamcorper morbi tincidunt. Molestie iaculis يؤدي إلى ظهور شحوم كريهة. موريس لا يطابق السيرة الذاتية أبدًا. لا يوجد شيء غير جيد. Faucibus nisl tincidunt eget nullam not nisi est. ليو duis ut diam quam nulla.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sitzt mit Nulla Facilisi morbi tempus. Es wurde kein Name erstellt. Keine Schmerzen, keine Schmerzen. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis and erat pellentesque adipiscing. Mauris stimmt nie mit seinem Lebenslauf überein. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris never congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
    },
    '2m8t6tbr': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. لم يتم إنشاء عصر الاسم. Donec ultrices tincidunt arcu غير صودا. Velit sed ullamcorper morbi tincidunt. Molestie iaculis يؤدي إلى ظهور شحوم كريهة. موريس لا يطابق السيرة الذاتية أبدًا. لا يوجد شيء غير جيد. Faucibus nisl tincidunt eget nullam not nisi est. ليو duis ut diam quam nulla.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sitzt mit Nulla Facilisi morbi tempus. Es wurde kein Name erstellt. Keine Schmerzen, keine Schmerzen. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis and erat pellentesque adipiscing. Mauris stimmt nie mit seinem Lebenslauf überein. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris never congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
    },
    '5hzdia0z': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_36_detallesdeSMS
  {
    'us6expax': {
      'es': 'Concepto',
      'ar': 'مفهوم',
      'de': 'Konzept',
      'en': 'Concept',
    },
    'fagqh51u': {
      'es': 'Estatus',
      'ar': 'حالة',
      'de': 'Status',
      'en': 'Status',
    },
    'p6c44did': {
      'es': 'Ver recibo',
      'ar': 'انظر الإيصال',
      'de': 'Siehe Quittung',
      'en': 'See receipt',
    },
    '6vnb1b10': {
      'es': 'Devolver',
      'ar': 'يعود',
      'de': 'Zurückkehren',
      'en': 'Return',
    },
    '1qvcs3aw': {
      'es': 'Detalles de SMS',
      'ar': 'تفاصيل الرسائل القصيرة',
      'de': 'SMS-Details',
      'en': 'SMS details',
    },
    'hwivc9g6': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_32_solicitarSMS
  {
    '1zhgv5kn': {
      'es': 'Solicitar pago con SMS',
      'ar': 'طلب الدفع عن طريق الرسائل القصيرة',
      'de': 'Fordern Sie die Zahlung per SMS an',
      'en': 'Request payment with SMS',
    },
    '7san7g2x': {
      'es': 'Celular',
      'ar': 'الهاتف الخلوي',
      'de': 'Handy',
      'en': 'Cell phone',
    },
    'lyand98w': {
      'es': 'Ingresa tu celular...',
      'ar': 'أدخل رقم جوالك...',
      'de': 'Geben Sie Ihre Handynummer ein...',
      'en': 'Enter your cell phone...',
    },
    'gfgx0fmt': {
      'es': 'Concepto',
      'ar': 'مفهوم',
      'de': 'Konzept',
      'en': 'Concept',
    },
    'yx2uphsl': {
      'es': 'Ingresa el concepto de pago...',
      'ar': 'أدخل مفهوم الدفع...',
      'de': 'Geben Sie das Zahlungskonzept ein...',
      'en': 'Enter the payment concept...',
    },
    'mo62ss3j': {
      'es': 'Importe',
      'ar': 'كمية',
      'de': 'Menge',
      'en': 'Amount',
    },
    'h6uk3ee8': {
      'es': 'Ingresa el importe...',
      'ar': 'أدخل المبلغ...',
      'de': 'Geben Sie den Betrag ein...',
      'en': 'Enter the amount...',
    },
    '33dkmjdy': {
      'es': 'Solicitar Pago con SMS',
      'ar': 'طلب الدفع عن طريق الرسائل القصيرة',
      'de': 'Fordern Sie die Zahlung per SMS an',
      'en': 'Request Payment with SMS',
    },
    'oswmnqih': {
      'es': 'El número de teléfono es requerido',
      'ar': 'رقم الهاتف مطلوب',
      'de': 'Telefonnummer ist erforderlich',
      'en': 'Phone number is required',
    },
    '4qzi2ek3': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    '2ibrbcw9': {
      'es': 'El concepto es requerido',
      'ar': 'المفهوم مطلوب',
      'de': 'Das Konzept ist erforderlich',
      'en': 'The concept is required',
    },
    'aolg84gz': {
      'es': 'El concepto debe contener al menos 10 caracteres',
      'ar': 'يجب أن يحتوي المفهوم على 10 أحرف على الأقل',
      'de': 'Das Konzept muss mindestens 10 Zeichen enthalten',
      'en': 'The concept must contain at least 10 characters',
    },
    'th7icb6g': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'kdktdy1a': {
      'es': 'El importe es requerido',
      'ar': 'المبلغ مطلوب',
      'de': 'Der Betrag ist erforderlich',
      'en': 'The amount is required',
    },
    'uow59z27': {
      'es': 'El formato del importe es inválido',
      'ar': 'تنسيق المبلغ غير صالح',
      'de': 'Das Betragsformat ist ungültig',
      'en': 'The amount format is invalid',
    },
    'kpdqcmen': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'aushueu6': {
      'es': 'Más opciones de SMS',
      'ar': 'المزيد من خيارات الرسائل القصيرة',
      'de': 'Weitere SMS-Optionen',
      'en': 'More SMS options',
    },
    't4vjc0p6': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_40_Notificaciones
  {
    'zz9ezmgq': {
      'es': 'Notificaciones',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'en': 'Notifications',
    },
    'yxssjqod': {
      'es': 'QR Pagado',
      'ar': 'ريال قطري مدفوع',
      'de': 'Bezahlter QR',
      'en': 'Paid QR',
    },
    'o1tsw3y0': {
      'es': '10 feb, 2023 a las 12:36 PM',
      'ar': '10 فبراير 2023 الساعة 12:36 مساءً',
      'de': '10. Februar 2023 um 12:36 Uhr',
      'en': 'Feb 10, 2023 at 12:36 PM',
    },
    'lvpogo1i': {
      'es': 'Marcar como leido',
      'ar': 'ضع إشارة مقروء',
      'de': 'als gelesen markieren',
      'en': 'Mark as read',
    },
    '2hm03918': {
      'es': 'El usuario ha aceptado la invitación',
      'ar': 'لقد قبل المستخدم الدعوة',
      'de': 'Der Benutzer hat die Einladung angenommen',
      'en': 'The user has accepted the invitation',
    },
    '06o6ezzz': {
      'es':
          'Alejandro Barba ha aceptado su invitación para colaborar en la cuenta de Tecnologías de la Información KINCE IT S.A. de C.V.',
      'ar':
          'لقد قبل Alejandro Barba دعوتك للتعاون في حساب تكنولوجيا المعلومات KINCE IT S.A. من السيرة الذاتية',
      'de':
          'Alejandro Barba hat Ihre Einladung zur Zusammenarbeit am Informationstechnologiekonto von KINCE IT S.A. angenommen. des Lebenslaufs',
      'en':
          'Alejandro Barba has accepted your invitation to collaborate on the KINCE IT S.A. Information Technology account. of C.V.',
    },
    'lxmxzzhw': {
      'es': '10 feb, 2023 a las 12:36 PM',
      'ar': '10 فبراير 2023 الساعة 12:36 مساءً',
      'de': '10. Februar 2023 um 12:36 Uhr',
      'en': 'Feb 10, 2023 at 12:36 PM',
    },
    '9suhtl73': {
      'es': 'Marcar como leido',
      'ar': 'ضع إشارة مقروء',
      'de': 'als gelesen markieren',
      'en': 'Mark as read',
    },
    'vy3785vt': {
      'es': 'SMS Cancelado',
      'ar': 'تم إلغاء الرسائل القصيرة',
      'de': 'Abgebrochene SMS',
      'en': 'Canceled SMS',
    },
    '0xto6t5p': {
      'es': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'ar': 'لوريم إيبسوم دولور سيت أميت، consectetur adipiscing إيليت.',
      'de': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    'xz5p8asu': {
      'es': '31 ene, 2023 a las 13:22 PM',
      'ar': '31 يناير 2023 الساعة 1:22 مساءً',
      'de': '31. Januar 2023 um 13:22 Uhr',
      'en': 'Jan 31, 2023 at 1:22 PM',
    },
    '1so18z2a': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_41_FAQs
  {
    'lz7rys0u': {
      'es': 'FAQ\'s',
      'ar': 'الأسئلة الشائعة',
      'de': 'FAQs',
      'en': 'FAQ\'s',
    },
    'o9e7iujt': {
      'es': '¿Cómo genero un código QR para realizar un pago?',
      'ar': 'كيف أقوم بإنشاء رمز الاستجابة السريعة لإجراء الدفع؟',
      'de': 'Wie erstelle ich einen QR-Code, um eine Zahlung durchzuführen?',
      'en': 'How do I generate a QR code to make a payment?',
    },
    'xjrhgb5x': {
      'es':
          'En la sección de pagos de la app, elige la opción \"Generar QR\" e ingresa el monto. El código QR se creará automáticamente.',
      'ar':
          'في قسم المدفوعات في التطبيق، اختر خيار \"إنشاء QR\" وأدخل المبلغ. سيتم إنشاء رمز الاستجابة السريعة تلقائيًا.',
      'de':
          'Wählen Sie im Zahlungsbereich der App die Option „QR generieren“ und geben Sie den Betrag ein. Der QR-Code wird automatisch erstellt.',
      'en':
          'In the payments section of the app, choose the \"Generate QR\" option and enter the amount. The QR code will be created automatically.',
    },
    'bgvtu57d': {
      'es': '¿Qué información contiene el código QR de pago? ',
      'ar': 'ما هي المعلومات التي يحتوي عليها رمز الاستجابة السريعة للدفع؟',
      'de': 'Welche Informationen enthält der Zahlungs-QR-Code?',
      'en': 'What information does the payment QR code contain?',
    },
    'vdfzx8fe': {
      'es':
          'El código QR incluye detalles como el monto a pagar y el concepto.',
      'ar':
          'يتضمن رمز الاستجابة السريعة تفاصيل مثل المبلغ المطلوب دفعه والمفهوم.',
      'de':
          'Der QR-Code enthält Details wie den zu zahlenden Betrag und das Konzept.',
      'en':
          'The QR code includes details such as the amount to pay and the concept.',
    },
    'jq46oauo': {
      'es': '¿Cómo puedo verificar mis transacciones diarias? ',
      'ar': 'كيف يمكنني التحقق من معاملاتي اليومية؟',
      'de': 'Wie kann ich meine täglichen Transaktionen überprüfen?',
      'en': 'How can I check my daily transactions?',
    },
    'wyvfqz8l': {
      'es':
          'Accede a la sección de historial de transacciones en la app para revisar todas las operaciones realizadas durante el día.',
      'ar':
          'قم بالدخول إلى قسم سجل المعاملات في التطبيق لمراجعة جميع العمليات التي تم تنفيذها خلال اليوم.',
      'de':
          'Greifen Sie auf den Abschnitt „Transaktionsverlauf“ in der App zu, um alle im Laufe des Tages durchgeführten Vorgänge einzusehen.',
      'en':
          'Access the transaction history section in the app to review all the operations carried out during the day.',
    },
    '9advjk19': {
      'es': '¿Cuándo se envían las transacciones a mi banco?',
      'ar': 'متى يتم إرسال المعاملات إلى البنك الذي أتعامل معه؟',
      'de': 'Wann werden Transaktionen an meine Bank gesendet?',
      'en': 'When are transactions sent to my bank?',
    },
    '1shpmtdu': {
      'es':
          'Todas las transacciones se revisan al final del día y se envían al banco al siguiente día hábil para su procesamiento.',
      'ar':
          'تتم مراجعة جميع المعاملات في نهاية اليوم وإرسالها إلى البنك في يوم العمل التالي للمعالجة.',
      'de':
          'Alle Transaktionen werden am Ende des Tages überprüft und am nächsten Werktag zur Bearbeitung an die Bank gesendet.',
      'en':
          'All transactions are reviewed at the end of the day and sent to the bank the next business day for processing.',
    },
    'cfbc5lhp': {
      'es': '¿Puedo cancelar un pago realizado por error? ',
      'ar': 'هل يمكنني إلغاء عملية دفع تمت عن طريق الخطأ؟',
      'de': 'Kann ich eine irrtümlich getätigte Zahlung stornieren?',
      'en': 'Can I cancel a payment made in error?',
    },
    'nukg4wus': {
      'es':
          'Claro, sin embargo, para poder cancelarlo, es estrictamente necesario que la transacción aún no haya sido autorizada por el usuario final, de otro modo no será posible cancelar la solicitud. Te recomendamos verificar los detalles antes de confirmar la transacción.',
      'ar':
          'ومع ذلك، بالطبع، من أجل إلغائه، من الضروري للغاية ألا يتم ترخيص المعاملة بعد من قبل المستخدم النهائي، وإلا فلن يكون من الممكن إلغاء الطلب. ننصحك بالتحقق من التفاصيل قبل تأكيد المعاملة.',
      'de':
          'Um die Transaktion abzubrechen, ist es jedoch unbedingt erforderlich, dass die Transaktion noch nicht vom Endbenutzer autorisiert wurde, andernfalls ist es nicht möglich, die Anfrage abzubrechen. Wir empfehlen Ihnen, die Details zu überprüfen, bevor Sie die Transaktion bestätigen.',
      'en':
          'Of course, however, in order to cancel it, it is strictly necessary that the transaction has not yet been authorized by the end user, otherwise it will not be possible to cancel the request. We recommend that you verify the details before confirming the transaction.',
    },
    'pqtdppve': {
      'es': '¿Cómo sé si mi solicitud de pago fue exitosa?',
      'ar': 'كيف أعرف إذا كان طلب الدفع الخاص بي ناجحًا؟',
      'de': 'Woher weiß ich, ob meine Zahlungsanfrage erfolgreich war?',
      'en': 'How do I know if my payment request was successful?',
    },
    'z5hi6l5k': {
      'es':
          'Recibirás una notificación inmediata en la app confirmando que la transacción se completó con éxito.',
      'ar': 'ستتلقى إشعارًا فوريًا في التطبيق يؤكد إتمام المعاملة بنجاح.',
      'de':
          'Sie erhalten in der App umgehend eine Benachrichtigung, dass die Transaktion erfolgreich abgeschlossen wurde.',
      'en':
          'You will receive an immediate notification in the app confirming that the transaction was completed successfully.',
    },
    'rtqzzacn': {
      'es': '¿Es seguro realizar pagos con la app? ',
      'ar': 'هل من الآمن إجراء الدفعات باستخدام التطبيق؟',
      'de': 'Ist es sicher, mit der App zu bezahlen?',
      'en': 'Is it safe to make payments with the app?',
    },
    'udcwdhgl': {
      'es':
          'Sí, utilizamos medidas de seguridad avanzadas para proteger tus datos y garantizar transacciones seguras.',
      'ar':
          'نعم، نحن نستخدم إجراءات أمنية متقدمة لحماية بياناتك وضمان المعاملات الآمنة.',
      'de':
          'Ja, wir nutzen fortschrittliche Sicherheitsmaßnahmen, um Ihre Daten zu schützen und sichere Transaktionen zu gewährleisten.',
      'en':
          'Yes, we use advanced security measures to protect your data and ensure secure transactions.',
    },
    'n4dd4b9c': {
      'es': '¿Puedo revisar mis saldos y movimientos en tiempo real?',
      'ar': 'هل يمكنني مراجعة أرصدتي وحركاتي في الوقت الحقيقي؟',
      'de':
          'Kann ich mein Gleichgewicht und meine Bewegungen in Echtzeit überprüfen?',
      'en': 'Can I review my balances and movements in real time?',
    },
    'uk6mnuya': {
      'es':
          'Sí, la app te permite consultar tus saldos y movimientos en tiempo real para mantener un control preciso de tus transacciones.',
      'ar':
          'نعم، يتيح لك التطبيق التحقق من أرصدتك وحركاتك في الوقت الفعلي للحفاظ على التحكم الدقيق في معاملاتك.',
      'de':
          'Ja, mit der App können Sie Ihre Salden und Bewegungen in Echtzeit überprüfen, um eine genaue Kontrolle über Ihre Transaktionen zu behalten.',
      'en':
          'Yes, the app allows you to check your balances and movements in real time to maintain precise control of your transactions.',
    },
    'wi407dvr': {
      'es': '¿Qué debo hacer si no recibo la confirmación de mi pago? ',
      'ar': 'ماذا يجب أن أفعل إذا لم أتلق تأكيدًا لدفعتي؟',
      'de':
          'Was soll ich tun, wenn ich keine Bestätigung meiner Zahlung erhalte?',
      'en': 'What should I do if I do not receive confirmation of my payment?',
    },
    'wz5ctdph': {
      'es':
          'Verifica tu historial de transacciones y, si no encuentras la confirmación, ponte en contacto con nuestro servicio de atención al cliente para obtener asistencia.',
      'ar':
          'يرجى التحقق من سجل معاملاتك وإذا لم تتمكن من العثور على تأكيد، فيرجى الاتصال بخدمة العملاء لدينا للحصول على المساعدة.',
      'de':
          'Bitte überprüfen Sie Ihren Transaktionsverlauf. Wenn Sie keine Bestätigung finden, wenden Sie sich bitte an unseren Kundenservice.',
      'en':
          'Please check your transaction history and if you cannot find confirmation, please contact our customer service for assistance.',
    },
    'ydd7oj1o': {
      'es': '¿Hay alguna tarifa por el uso de la app? ',
      'ar': 'هل هناك رسوم لاستخدام التطبيق؟',
      'de': 'Ist die Nutzung der App kostenpflichtig?',
      'en': 'Is there a fee for using the app?',
    },
    'vbzofzac': {
      'es':
          'Las funciones dentro de la app son gratuitas, sin embargo, PAYRY cobra una pequeña comisión de \$5.00 por transacción.',
      'ar':
          'الميزات الموجودة داخل التطبيق مجانية، ومع ذلك، تفرض PAYRY رسومًا بسيطة قدرها 5.00 دولارات لكل معاملة.',
      'de':
          'Die Funktionen der App sind kostenlos, PAYRY erhebt jedoch eine geringe Gebühr von 5,00 \$ pro Transaktion.',
      'en':
          'The features within the app are free, however, PAYRY charges a small fee of \$5.00 per transaction.',
    },
    'xwmhvd2f': {
      'es': '¿Existe un límite para el monto de pago con la app? ',
      'ar': 'هل هناك حد لمبلغ الدفع مع التطبيق؟',
      'de': 'Gibt es eine Begrenzung des Zahlungsbetrags mit der App?',
      'en': 'Is there a limit to the payment amount with the app?',
    },
    '7m42ppp5': {
      'es': 'Sí, el límite es de \$8,000.00 por transacción.',
      'ar': 'نعم، الحد الأقصى هو 8,000.00 دولار لكل معاملة.',
      'de': 'Ja, das Limit beträgt 8.000,00 \$ pro Transaktion.',
      'en': 'Yes, the limit is \$8,000.00 per transaction.',
    },
    '0kdoyh66': {
      'es':
          '¿Cómo puedo actualizar la información de mi cuenta bancaria vinculada? ',
      'ar': 'كيف يمكنني تحديث معلومات حسابي البنكي المرتبط؟',
      'de':
          'Wie kann ich meine verknüpften Bankkontoinformationen aktualisieren?',
      'en': 'How can I update my linked bank account information?',
    },
    'r3jwcj3m': {
      'es':
          'Desde su aplicación en el apartado de cuenta bancaria, podría editar la información y solicitar nuevamente la verificación. ',
      'ar':
          'من طلبك في قسم الحساب البنكي، يمكنك تعديل المعلومات وطلب التحقق مرة أخرى.',
      'de':
          'In Ihrem Antrag im Bereich „Bankkonto“ können Sie die Informationen bearbeiten und eine erneute Verifizierung anfordern.',
      'en':
          'From your application in the bank account section, you could edit the information and request verification again.',
    },
    '17y3nw41': {
      'es': '¿Qué debo hacer si pierdo mi teléfono? ',
      'ar': 'ماذا يجب أن أفعل إذا فقدت هاتفي؟',
      'de': 'Was soll ich tun, wenn ich mein Telefon verliere?',
      'en': 'What should I do if I lose my phone?',
    },
    'xams6ty1': {
      'es':
          'Debes informar de inmediato a nuestro servicio de atención al cliente para desactivar tu cuenta temporalmente y evitar transacciones no autorizadas.',
      'ar':
          'يجب عليك إبلاغ خدمة العملاء لدينا على الفور لإلغاء تنشيط حسابك مؤقتًا ومنع المعاملات غير المصرح بها.',
      'de':
          'Sie müssen unseren Kundenservice unverzüglich informieren, um Ihr Konto vorübergehend zu deaktivieren und unbefugte Transaktionen zu verhindern.',
      'en':
          'You must immediately inform our customer service to temporarily deactivate your account and prevent unauthorized transactions.',
    },
    'a89mqdx6': {
      'es': '¿Puedo recibir notificaciones por cada transacción realizada? ',
      'ar': 'هل يمكنني تلقي إشعارات لكل معاملة تتم؟',
      'de':
          'Kann ich Benachrichtigungen für jede getätigte Transaktion erhalten?',
      'en': 'Can I receive notifications for each transaction made?',
    },
    'hcgowpnz': {
      'es':
          'Sí, actualmente recibirás notificaciones por cada transacción realizada.',
      'ar': 'نعم، ستتلقى حاليًا إشعارات لكل معاملة تتم.',
      'de':
          'Ja, derzeit erhalten Sie Benachrichtigungen für jede getätigte Transaktion.',
      'en':
          'Yes, currently you will receive notifications for each transaction made.',
    },
    '3wzc6llv': {
      'es':
          '¿Cómo puedo realizar devoluciones de productos pagados con la app?  ',
      'ar': 'كيف يمكنني إرجاع المنتجات المدفوعة عبر التطبيق؟',
      'de': 'Wie kann ich mit der App bezahlte Produkte zurückgeben?',
      'en': 'How can I return products paid for with the app?',
    },
    '1kn3mp3i': {
      'es':
          'Para devoluciones, sigue el procedimiento establecido por el comercio. En caso de problemas, comunícate con el servicio de atención al cliente.',
      'ar':
          'بالنسبة للمرتجعات، اتبع الإجراء الذي حددته الشركة. في حالة وجود مشاكل، يرجى الاتصال بخدمة العملاء.',
      'de':
          'Befolgen Sie für Rücksendungen das vom Unternehmen festgelegte Verfahren. Bei Problemen wenden Sie sich bitte an den Kundendienst.',
      'en':
          'For returns, follow the procedure established by the business. In case of problems, please contact customer service.',
    },
    'ftdwl4yd': {
      'es': '¿Cómo añado usuarios invitados para realizar cobros desde la app',
      'ar': 'كيف يمكنني إضافة مستخدمين ضيوف لإجراء الدفعات من التطبيق',
      'de':
          'Wie füge ich Gastbenutzer hinzu, um Zahlungen über die App zu tätigen?',
      'en': 'How do I add guest users to make payments from the app',
    },
    'lo4a4493': {
      'es':
          'Dirígete a la sección de configuración de usuarios en la app y sigue las instrucciones para añadir empleados como usuarios invitados.',
      'ar':
          'انتقل إلى قسم إعدادات المستخدم في التطبيق واتبع التعليمات لإضافة الموظفين كمستخدمين ضيوف.',
      'de':
          'Gehen Sie in der App zum Abschnitt „Benutzereinstellungen“ und befolgen Sie die Anweisungen, um Mitarbeiter als Gastbenutzer hinzuzufügen.',
      'en':
          'Go to the user settings section in the app and follow the instructions to add employees as guest users.',
    },
    'zis0g4g2': {
      'es':
          '¿Puedo limitar las funciones que un usuario invitado puede realizar? ',
      'ar': 'هل يمكنني تحديد الوظائف التي يمكن للمستخدم الضيف القيام بها؟',
      'de':
          'Kann ich die Funktionen, die ein Gastbenutzer ausführen kann, einschränken?',
      'en': 'Can I limit the functions that a guest user can perform?',
    },
    'zmpvb0zn': {
      'es':
          'Sí, puedes establecer permisos específicos para los empleados invitados.',
      'ar': 'نعم، يمكنك تعيين أذونات محددة للموظفين الضيوف.',
      'de':
          'Ja, Sie können spezifische Berechtigungen für Gastmitarbeiter festlegen.',
      'en': 'Yes, you can set specific permissions for guest employees.',
    },
    '0edibzd3': {
      'es':
          '¿Puedo cambiar los permisos de un empleado invitado en cualquier momento? ',
      'ar': 'هل يمكنني تغيير أذونات الموظف الضيف في أي وقت؟',
      'de':
          'Kann ich die Berechtigungen eines Gastmitarbeiters jederzeit ändern?',
      'en': 'Can I change a guest employee\'s permissions at any time?',
    },
    '3xgy3t47': {
      'es':
          'Sí, como propietario del comercio, puedes ajustar los permisos de los empleados invitados en cualquier momento desde la sección de configuración.',
      'ar':
          'نعم، باعتبارك مالك عمل، يمكنك تعديل أذونات الموظفين الضيوف في أي وقت من قسم الإعدادات.',
      'de':
          'Ja, als Geschäftsinhaber können Sie die Berechtigungen von Gastmitarbeitern jederzeit im Abschnitt „Einstellungen“ anpassen.',
      'en':
          'Yes, as a business owner, you can adjust guest employee permissions at any time from the settings section.',
    },
    'vn30860t': {
      'es':
          '¿Hay un límite en la cantidad de empleados invitados que puedo añadir?  ',
      'ar': 'هل هناك حد لعدد الموظفين الضيوف الذين يمكنني إضافتهم؟',
      'de':
          'Gibt es eine Begrenzung für die Anzahl der Gastmitarbeiter, die ich hinzufügen kann?',
      'en': 'Is there a limit to the number of guest employees I can add?',
    },
    '84c8w126': {
      'es':
          'No, puedes dar de alta a todos los usuarios invitados que necesites',
      'ar': 'لا، يمكنك تسجيل جميع المستخدمين الضيوف الذين تحتاجهم',
      'de': 'Nein, Sie können alle benötigten Gastbenutzer registrieren',
      'en': 'No, you can register all the guest users you need',
    },
    '2xrmtzfg': {
      'es':
          '¿Cómo desactivo el acceso de un empleado invitado que ya no trabaja en el comercio',
      'ar': 'كيف أقوم بإلغاء تنشيط الوصول لموظف ضيف لم يعد يعمل في الشركة؟',
      'de':
          'Wie deaktiviere ich den Zugang für einen Gastmitarbeiter, der nicht mehr im Betrieb arbeitet?',
      'en':
          'How do I deactivate access for a guest employee who no longer works at the business?',
    },
    'lns5cjwa': {
      'es':
          'Ve a la sección de configuración de usuarios, selecciona al empleado y utiliza la opción para desactivar.',
      'ar':
          'انتقل إلى قسم إعدادات المستخدم، ثم حدد الموظف واستخدم خيار التعطيل.',
      'de':
          'Gehen Sie zum Abschnitt „Benutzereinstellungen“, wählen Sie den Mitarbeiter aus und verwenden Sie die Option „Deaktivieren“.',
      'en':
          'Go to the user settings section, select the employee and use the deactivate option.',
    },
    'oxavi1de': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_38_Estadisticas
  {
    'pt7kb0ix': {
      'es': 'Estadísticas',
      'ar': 'إحصائيات',
      'de': 'Statistiken',
      'en': 'Statistics',
    },
    'ghhdyb74': {
      'es': 'Pagos con QR',
      'ar': 'المدفوعات مع QR',
      'de': 'Zahlungen mit QR',
      'en': 'Payments with QR',
    },
    'dc1j9r69': {
      'es': 'Pagos con SMS',
      'ar': 'المدفوعات عن طريق الرسائل القصيرة',
      'de': 'Zahlungen per SMS',
      'en': 'Payments with SMS',
    },
    '4lc74aso': {
      'es': 'Cobros realizados',
      'ar': 'المجموعات المصنوعة',
      'de': 'Sammlungen gemacht',
      'en': 'Collections made',
    },
    'ljaw7bau': {
      'es': '100',
      'ar': '100',
      'de': '100',
      'en': '100',
    },
    'wiotdgzr': {
      'es': 'Importe total de cobros',
      'ar': 'المبلغ الإجمالي للمجموعات',
      'de': 'Gesamtzahl der Sammlungen',
      'en': 'Total amount of collections',
    },
    '936byz2v': {
      'es': '\$73,215.67',
      'ar': '73,215.67 دولار',
      'de': '73.215,67 \$',
      'en': '\$73,215.67',
    },
    'znpugkpb': {
      'es': 'Transferencias Payry',
      'ar': 'تحويلات الرواتب',
      'de': 'Payry-Überweisungen',
      'en': 'Payry Transfers',
    },
    'nwle6ien': {
      'es': '\$70,937.07',
      'ar': '70,937.07 دولار',
      'de': '70.937,07 \$',
      'en': '\$70,937.07',
    },
    '4t9507td': {
      'es': 'Costo en comisiones',
      'ar': 'التكلفة في العمولات',
      'de': 'Kosten in Provisionen',
      'en': 'Cost in commissions',
    },
    'xxkclka3': {
      'es': '\$2,278.60',
      'ar': '2,278.60 دولار',
      'de': '2.278,60 \$',
      'en': '\$2,278.60',
    },
    'm3svvc6k': {
      'es': 'Pagos con QR\n63 transacciones',
      'ar': 'المدفوعات مع QR\n63 معاملة',
      'de': 'Zahlungen mit QR\n63 Transaktionen',
      'en': 'Payments with QR\n63 transactions',
    },
    '7l9f0acb': {
      'es': '\$48,272.30\n63.2%',
      'ar': '48,272.30 دولارًا\n63.2%',
      'de': '48.272,30 \$\n63,2 %',
      'en': '\$48,272.30\n63.2%',
    },
    'rb74ik6y': {
      'es': 'Pagos con SMS\n37 transacciones',
      'ar': 'المدفوعات عن طريق الرسائل القصيرة\n37 صفقة',
      'de': 'Zahlungen per SMS\n37 Transaktionen',
      'en': 'Payments with SMS\n37 transactions',
    },
    'y1ft1k17': {
      'es': '\$26,943.37\n36.8%',
      'ar': '26,943.37 دولار\n36.8%',
      'de': '26.943,37 \$\n36,8 %',
      'en': '\$26,943.37\n36.8%',
    },
    '451t3snv': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_03_onboarding2
  {
    '4pqvv0rw': {
      'es': 'Puede solicitar pagos vía\nQR o SMS en segundos',
      'ar': 'يمكنك طلب الدفع عبر\nQR أو الرسائل القصيرة في ثوان',
      'de': 'Sie können Zahlungen anfordern über\nQR oder SMS in Sekunden',
      'en': 'You can request payments via\nQR or SMS in seconds',
    },
    'rnen10ap': {
      'es': 'Comenzar',
      'ar': 'يبدأ',
      'de': 'Beginnen',
      'en': 'Begin',
    },
    '5qamurs2': {
      'es': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie den Überblick über Ihre Ausgaben',
      'en': 'Keep Track of Spending',
    },
    'zi52g9ub': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
    },
    'w3ywj458': {
      'es': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'en': 'Budget Analysis',
    },
    'v2eh9rvn': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'اعرف أين توجد ميزانياتك وكيف يمكن تعديلها.',
      'de':
          'Erfahren Sie, wo sich Ihre Budgets befinden und wie diese angepasst werden können.',
      'en': 'Know where your budgets are and how they can be adjusted.',
    },
    '14iuataz': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_04_onboarding3
  {
    'jaqz6tor': {
      'es': 'Tu dinero el mismo\ndía en tu cuenta',
      'ar': 'أموالك نفس الشيء\nيوم في حسابك',
      'de': 'Dein Geld ist das Gleiche\nTag auf Ihrem Konto',
      'en': 'Your money the same\nday in your account',
    },
    'jyobkk41': {
      'es': 'Comenzar',
      'ar': 'يبدأ',
      'de': 'Beginnen',
      'en': 'Begin',
    },
    'j50svm7p': {
      'es': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie den Überblick über Ihre Ausgaben',
      'en': 'Keep Track of Spending',
    },
    'z0dk0tg3': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
    },
    'pe5tyzlj': {
      'es': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'en': 'Budget Analysis',
    },
    '6qa5wuj8': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'اعرف أين توجد ميزانياتك وكيف يمكن تعديلها.',
      'de':
          'Erfahren Sie, wo sich Ihre Budgets befinden und wie diese angepasst werden können.',
      'en': 'Know where your budgets are and how they can be adjusted.',
    },
    '23qa8lww': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_07_confirmacionCorreoEnviadoRegister
  {
    'gxcp25z4': {
      'es': 'Tu correo ha\nsido verificado',
      'ar': 'البريد الإلكتروني الخاص بك لديه\nتم التحقق منها',
      'de': 'Ihre E-Mail hat\nverifiziert worden',
      'en': 'Your email has\nbeen verified',
    },
    '6k5b4d50': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'luqbeqpu': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_10_confirmacionCorreoEnviadoContrasena
  {
    '5x6fpdkf': {
      'es': 'Tu enviamos un\ncorreo de verificación',
      'ar': 'قمت بإرسال أ\nالبريد الإلكتروني للتحقق',
      'de': 'Sie senden eine\nBestätigungs-E-Mail',
      'en': 'You send a\nverification email',
    },
    'qqgf59jb': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'taruew0o': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_12_confirmacionContrasenaActualizada
  {
    '14qn7rqg': {
      'es': 'Tu contraseña ha\nsido actualizada',
      'ar': 'كلمة المرور الخاصة بك لديها\nتم تحديثه',
      'de': 'Ihr Passwort hat\naktualisiert worden',
      'en': 'Your password has\nbeen updated',
    },
    'tdf98upf': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'sxg3foim': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_18_confirmacionTelefono
  {
    'dkxyekg8': {
      'es': 'Tu número de teléfono\nse ha confirmado',
      'ar': 'رقم تليفونك\nتم التاكيد',
      'de': 'Deine Telefonnummer\nwurde bestätigt',
      'en': 'Your phone number\nhas been confirmed',
    },
    'osqjz8x9': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'cboqjaaq': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_21_confirmacionDatosBancarios
  {
    'xq7g2uwa': {
      'es': 'Datos bancarios\nvalidados correctamente',
      'ar': 'بيانات البنك\nالتحقق من صحتها بشكل صحيح',
      'de': 'Bankdaten\nrichtig validiert',
      'en': 'Bank data\ncorrectly validated',
    },
    'pvo8oijo': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'b1xkg868': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_33_SMSenviado
  {
    '1sxqn53f': {
      'es': 'SMS enviado a\nsu app bancaria',
      'ar': 'تم إرسال الرسائل القصيرة إلى\nالتطبيق المصرفي الخاص بك',
      'de': 'SMS gesendet an\nIhre Banking-App',
      'en': 'SMS sent to\nyour banking app',
    },
    'wj2zg5qw': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'jehuz6s3': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_13_Menumas
  {
    'esga664l': {
      'es': 'Más opciones',
      'ar': 'المزيد من الخيارات',
      'de': 'Mehr Optionen',
      'en': 'More options',
    },
    'p9ate2i2': {
      'es': 'Generar QR',
      'ar': 'توليد ريال قطري',
      'de': 'QR generieren',
      'en': 'Generate QR',
    },
    '29nnciuq': {
      'es': 'Generar SMS',
      'ar': 'توليد الرسائل القصيرة',
      'de': 'SMS generieren',
      'en': 'Generate SMS',
    },
    'koikslds': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
    },
    '4p0c69un': {
      'es': 'Empresas',
      'ar': 'شركات',
      'de': 'Firmen',
      'en': 'Companies',
    },
    'rhn9kile': {
      'es': 'Estadísticas',
      'ar': 'إحصائيات',
      'de': 'Statistiken',
      'en': 'Statistics',
    },
    'mn3tvowu': {
      'es': 'Usuarios',
      'ar': 'المستخدمين',
      'de': 'Benutzer',
      'en': 'Users',
    },
    'nu9pixgd': {
      'es': 'Documentación ',
      'ar': 'توثيق',
      'de': 'Dokumentation',
      'en': 'Documentation',
    },
    'tb7vkk44': {
      'es': 'Facturas',
      'ar': 'فواتير',
      'de': 'Rechnungen',
      'en': 'Bills',
    },
    'godnzxow': {
      'es': 'FAQ\'s',
      'ar': 'الأسئلة الشائعة',
      'de': 'FAQs',
      'en': 'FAQ\'s',
    },
    'n526vfir': {
      'es': 'Términos y\ncondiciones',
      'ar': 'الشروط و\nشروط',
      'de': 'Bedingungen und\nBedingungen',
      'en': 'Terms and\nconditions',
    },
    '8kp21r03': {
      'es': 'Política de\nprivacidad',
      'ar': 'سياسة\nخصوصية',
      'de': 'Politik von\nPrivatsphäre',
      'en': 'Politics of\nprivacy',
    },
    'dgvmgchh': {
      'es': 'Cambiar a\nversión clara',
      'ar': 'التبديل إلى\nنسخة واضحة',
      'de': 'Wechseln zu\nklare Version',
      'en': 'Switch to\nclear version',
    },
    'j9i35xfz': {
      'es': 'Transacciones',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'en': 'Transactions',
    },
    'g9m5ylqw': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_43_Politicadeprivacidad
  {
    'e2i7edc8': {
      'es': 'Política de privacidad',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutzrichtlinie',
      'en': 'Privacy Policy',
    },
    '9k0o8kdf': {
      'es':
          'Aviso de Privacidad - Clientes\n\nEl objetivo de este documento es darte a conocer de la manera más fácil posible nuestro Aviso de Privacidad, en caso de que tengas cualquier duda, existen canales de comunicación que siempre están disponibles para ti.\n\nEn este Aviso de Privacidad (“ADP”) describimos la forma en que recabamos y tratamos tus datos personales a partir del momento en el que creas tu cuenta e ingresas los datos para el uso de los productos de Tecnologías de la información Kince S. de R.L. de C.V. (en adelante indistintamente “Payry” o el “Responsable”) y durante todo el tiempo que seas cliente de Payry.\n\nEn Payry estamos completamente comprometidos con la protección de tus datos personales y cumplimos con lo dispuesto en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (la “LFPD”) y el resto de regulación aplicable en materia de protección de datos. Por esto, te informamos que Payry, con domicilio para oír y recibir notificaciones en Avenida Américas 1545 Piso 5E, colonia Providencia, CP 44630, Guadalajara, Jalisco es el responsable de recabar y dar el tratamiento a todos tus datos personales.\n\nPara cumplir con las finalidades de tratamiento de tus datos personales, en Payry recabamos las siguientes categorías de tus datos personales:\nDatos de carácter identificativo y de contacto.\nDatos fiscales.\nDatos de transacción.\nDatos de ubicación geográfica.\nPara las finalidades descritas en el presente Aviso, Payry no recaba datos personales considerados como sensibles.\n\n\n\nEstas son las finalidades principales por las cuales recabamos tus datos personales:\nFacilitar la contratación de nuestros productos y/o servicios financieros a través de los medios tecnológicos disponibles. Analizar tu perfil para determinar el grado de riesgo para el otorgamiento de los productos financieros que ofrecemos o podamos llegar a ofrecer.\n\nRealizar la verificación de los datos contenidos en la Credencial para Votar y el biométrico facial a través del servicio de verificación del Instituto Nacional Electoral.\nGestionar, administrar y mantener actualizadas nuestras bases de datos de clientes.\nGestionar y comunicar estados de cuenta y cualquier otra información relacionada con los productos y/o servicios financieros adquiridos por nuestros clientes.\nGestionar, administrar y mantener actualizada la información relacionada con los cobros/pagos que realizas por los productos y/o servicios adquiridos.\nFacilitar atención de servicio al cliente.\nRegistrar las transacciones que se realizan con nuestros productos.\nRegistrar la ubicación al momento de realizar transacciones con nuestros productos.\nFacilitar nuestros productos y/o servicios utilizando los datos del dispositivo móvil.\nGestionar y administrar las comunicaciones con nuestros clientes. Estadística y registro histórico de nuestros clientes.\nSalvo que nos indiques lo contrario al darte de alta como prospecto, usaremos algunos datos para enviarte comunicaciones, por ejemplo, mediante SMS y/o correo electrónico, con novedades o información comercial sobre productos y servicios de Payry, así como campañas publicitarias y participación en dinámicas y programas que ofrece Payry; esta es una finalidad secundaria y puedes oponerte a ella, en cualquier momento.\nPayry podrá compartir tus datos dentro o fuera de México con (i) sus compañías controladoras, afiliadas, subsidiarias o cualquier sociedad del mismo grupo corporativo que operen bajo los mismos procesos y políticas internas, para finalidades de resguardo centralizado de la información, para documentar y formalizar operaciones de reestructuración operativa y/o corporativa, y para fines estadísticos y de registro histórico de clientes; (ii) sociedades de información crediticia, para solicitar información sobre tu historial crediticio e información de contacto; (iii) autoridades, organismos o entidades gubernamentales, para realizar verificaciones de información, para el cumplimiento de obligaciones previstas en la legislación aplicable y/o para cumplir con requerimientos efectuados por autoridades competentes en su caso; (iv) empresas de cobranza, para realizar cobros judiciales o extrajudiciales de créditos impagados, y (v) terceros no relacionados (prestadores de servicios), con la finalidad exclusiva de asistir a Payry en la prestación de sus servicios.\nTe comentamos que, conforme al artículo 37 de la LFPD, no requerimos de tu consentimiento para compartir tus datos en los términos establecidos en el párrafo anterior.\nPuedes ejercer en todo momento tus derechos de acceso, rectificación, cancelación y oposición (derechos ARCO), enviando una solicitud a\nnuestro Departamento de Datos Personales al correo electrónico: hola@payry.mx . El asunto de la solicitud debe ir señalada como “Derechos ARCO” o “Revocación del Consentimiento” y debe contener lo siguiente:\nTu nombre y domicilio o correo electrónico al que podremos comunicarte la respuesta a tu solicitud;\nLos documentos que acrediten tu identidad o, en su caso, la representación legal de aquella persona que ejerza el derecho en tu nombre;\nLa descripción clara y precisa de los datos personales respecto de los que se busca ejercer alguno de los derechos ARCO, y Cualquier otro elemento o documento que facilite la localización de tus datos personales.\nPayry te comunicará la determinación adoptada en un plazo máximo de veinte (20) días hábiles, contados a partir de la fecha en la que se reciba tu solicitud. Cuando tu solicitud proceda, se hará efectiva dentro de los quince (15) días hábiles siguientes a la fecha en que te comuniquemos la respuesta. En caso de que la información que proporciones sea incorrecta, insuficiente, o no cumplas con los requisitos antes mencionados, te comunicaremos dentro de los cinco (5) días hábiles siguientes a la recepción de tu solicitud para que realices los cambios pertinentes o cumplas con todos los requisitos. En este caso, tendrás diez (10) días hábiles para subsanar tu solicitud de lo contrario se tendrá por no presentada y será desechada.\nAl enviar tu solicitud a hola@payry.com , autorizas a Payry para dar respuesta por ese mismo medio, salvo que nos indiques otro medio de comunicación.\nComo cliente, puedes revocar tu consentimiento para el tratamiento, transferencia de tus datos personales o limitar el uso o divulgación de tus datos personales siguiendo este mismo procedimiento, siempre que no suponga la imposibilidad de cumplir con alguna obligación por parte de Payry.\nEs tu responsabilidad comunicar cualquier cambio en tus datos personales para que sea tomado en cuenta y mantener tus datos debidamente actualizados, con la finalidad de asegurar la calidad de los datos personales y garantizar que sean exactos.\nEn el sitio web www.payry.mx usamos cookies funcionales. Las cookies utilizadas por Payry nos permiten recopilar, analizar y conservar información electrónica relacionada con las visitas a nuestro sitio web. Las cookies que usamos permiten recabar esta información de forma automática en el momento mismo en que accedes a nuestro sitio web y a nuestros servicios electrónicos; sin embargo, éstas no permiten identificar individualmente a las personas que nos visitan. Si navegas en nuestra web y/o envías información a través de la misma, nos otorgas tu consentimiento expreso para la instalación de nuestras cookies. Para obtener información más detallada acerca de las cookies y la forma en que puedes deshabilitarlas en función de tu navegador y sistema operativo, te recomendamos que visites el sitio web allaboutcookies.org, en el que explican paso a paso cómo deshabilitarlas. Toma en cuenta que, si desactivas las cookies o impides su instalación, es posible que no puedas usar de manera completa algunas funciones de nuestra web.\nNos reservamos el derecho de modificar, actualizar, extender o de cualquier otra forma cambiar el contenido y alcance del presente Aviso de Privacidad, en cualquier momento y bajo nuestra completa discreción. En todo momento, podrás solicitar la última versión de este Aviso de Privacidad a nuestro Departamento de Datos Personales, a través de la dirección electrónica hola@payry.com.',
      'ar':
          'إشعار الخصوصية - العملاء\n\nالهدف من هذه الوثيقة هو إعلامك بإشعار الخصوصية الخاص بنا بأسهل طريقة ممكنة، وفي حال كانت لديك أي أسئلة، فهناك قنوات اتصال متاحة لك دائمًا.\n\nفي إشعار الخصوصية هذا (\"ADP\") نوضح الطريقة التي نجمع بها بياناتك الشخصية ونعالجها منذ لحظة إنشاء حسابك وإدخال البيانات لاستخدام منتجات Kince S. de Information Technologies. من السيرة الذاتية (يشار إليها فيما بعد باسم \"Payry\" أو \"المسؤول\") وطالما أنك أحد عملاء Payry.\n\nفي Payry، نحن ملتزمون تمامًا بحماية بياناتك الشخصية ونلتزم بأحكام القانون الاتحادي بشأن حماية البيانات الشخصية التي تحتفظ بها الأطراف الخاصة (\"LFPD\") وبقية اللوائح المعمول بها بشأن حماية البيانات. لهذا السبب، نعلمك أن Payry، التي يقع عنوانها لسماع الإخطارات وتلقيها في Avenida Américas 1545 Piso 5E, Colonia Providencia, CP 44630, Guadalajara, Jalisco، مسؤولة عن جمع ومعالجة جميع بياناتك الشخصية.\n\nلتحقيق أغراض معالجة بياناتك الشخصية، نقوم في Payry بجمع الفئات التالية من بياناتك الشخصية:\nبيانات التعريف والاتصال.\nالبيانات الضريبية.\nبيانات المعاملات.\nبيانات الموقع الجغرافي.\nللأغراض الموضحة في هذا الإشعار، لا تقوم Payry بجمع البيانات الشخصية التي تعتبر حساسة.\n\n\n\nهذه هي الأغراض الرئيسية التي نجمع بياناتك الشخصية من أجلها:\nتسهيل التعاقد على منتجاتنا و/أو خدماتنا المالية من خلال الوسائل التكنولوجية المتاحة. قم بتحليل ملفك الشخصي لتحديد درجة المخاطرة المتعلقة بمنح المنتجات المالية التي نقدمها أو قد نقدمها.\n\nإجراء التحقق من البيانات الواردة في أوراق اعتماد التصويت والبيومترية للوجه من خلال خدمة التحقق من المعهد الانتخابي الوطني.\nإدارة وإدارة وتحديث قواعد بيانات العملاء لدينا.\nإدارة وتوصيل كشوفات الحساب وأي معلومات أخرى تتعلق بالمنتجات و/أو الخدمات المالية التي حصل عليها عملاؤنا.\nإدارة وإدارة وتحديث المعلومات المتعلقة بالتحصيلات/المدفوعات التي تقوم بها للمنتجات و/أو الخدمات المشتراة.\nتسهيل اهتمام خدمة العملاء.\nتسجيل المعاملات التي تتم مع منتجاتنا.\nسجل الموقع عند التعامل مع منتجاتنا.\nتسهيل منتجاتنا و/أو خدماتنا باستخدام بيانات الجهاز المحمول.\nإدارة وإدارة الاتصالات مع عملائنا. الإحصائيات والسجل التاريخي لعملائنا.\nما لم تخبرنا بخلاف ذلك عند التسجيل كعميل محتمل، سنستخدم بعض البيانات لإرسال اتصالات إليك، على سبيل المثال، عبر الرسائل القصيرة و/أو البريد الإلكتروني، تحتوي على أخبار أو معلومات تجارية حول منتجات وخدمات Payry، بالإضافة إلى الحملات الإعلانية والمشاركة. في الديناميكيات والبرامج التي تقدمها Payry؛ وهذا غرض ثانوي ويمكنك الاعتراض عليه في أي وقت.\nيجوز لشركة Payry مشاركة بياناتك داخل المكسيك أو خارجها مع (1) الشركات المسيطرة أو الشركات التابعة لها أو الشركات التابعة لها أو أي شركة من نفس مجموعة الشركات التي تعمل بموجب نفس العمليات والسياسات الداخلية، لأغراض الحماية المركزية للمعلومات، لتوثيق و إضفاء الطابع الرسمي على العمليات التشغيلية و/أو إعادة الهيكلة المؤسسية، ولأغراض تسجيل العملاء الإحصائية والتاريخية؛ (2) شركات المعلومات الائتمانية، لطلب معلومات حول تاريخك الائتماني ومعلومات الاتصال الخاصة بك؛ (3) السلطات أو المنظمات أو الهيئات الحكومية، لإجراء عمليات التحقق من المعلومات، والامتثال للالتزامات المنصوص عليها في التشريعات المعمول بها و/أو الامتثال للمتطلبات التي وضعتها السلطات المختصة حيثما ينطبق ذلك؛ (4) شركات التحصيل، لتنفيذ عمليات تحصيل قضائية أو غير قضائية للاعتمادات غير المدفوعة، و(5) أطراف ثالثة غير ذات صلة (مقدمي الخدمات)، لغرض حصري هو مساعدة Payry في تقديم خدماتها.\nنخبرك أنه وفقًا للمادة 37 من قانون LFPD، فإننا لا نطلب موافقتك على مشاركة بياناتك وفقًا للشروط المنصوص عليها في الفقرة السابقة.\nيمكنك ممارسة حقوقك في الوصول والتصحيح والإلغاء والمعارضة (حقوق ARCO) في أي وقت عن طريق إرسال طلب إلى\nقسم البيانات الشخصية لدينا على البريد الإلكتروني: hola@payry.mx. يجب الإشارة إلى موضوع الطلب باسم \"حقوق ARCO\" أو \"إلغاء الموافقة\" ويجب أن يحتوي على ما يلي:\nاسمك وعنوانك أو عنوان بريدك الإلكتروني الذي يمكننا إرسال الرد على طلبك إليه؛\nالمستندات التي تثبت هويتك أو، حيثما ينطبق ذلك، التمثيل القانوني للشخص الذي يمارس الحق نيابة عنك؛\nالوصف الواضح والدقيق للبيانات الشخصية التي تسعى بشأنها إلى ممارسة أي من حقوق ARCO، وأي عنصر أو مستند آخر يسهل تحديد موقع بياناتك الشخصية.\nستبلغك Payry بالقرار الذي تم اتخاذه خلال فترة أقصاها عشرين (20) يوم عمل، تحسب من تاريخ استلام طلبك. عندما يكون طلبك مناسبًا، سيكون ساريًا خلال خمسة عشر (15) يوم عمل بعد تاريخ إرسال الرد. في حالة أن المعلومات التي تقدمها غير صحيحة أو غير كافية أو لا تفي بالمتطلبات المذكورة أعلاه، فسنبلغك في غضون خمسة (5) أيام عمل بعد استلام طلبك حتى تتمكن من إجراء التغييرات ذات الصلة أو الامتثال لجميع متطلبات. في هذه الحالة، سيكون لديك عشرة (10) أيام عمل لتصحيح طلبك، وإلا فسيتم اعتباره غير مقدم وسيتم رفضه.\nمن خلال إرسال طلبك إلى hola@payry.com، فإنك تأذن لـ Payry بالرد بنفس الوسيلة، ما لم تشير إلى وسيلة اتصال أخرى.\nكعميل، يمكنك إلغاء موافقتك على معالجة بياناتك الشخصية أو نقلها أو تقييد استخدام بياناتك الشخصية أو الكشف عنها عن طريق اتباع هذا الإجراء نفسه، طالما أن ذلك لا يجعل من المستحيل على Payry الامتثال لأي التزام .\nوتقع على عاتقك مسؤولية إبلاغ أي تغييرات تطرأ على بياناتك الشخصية حتى يتم أخذها بعين الاعتبار والحفاظ على تحديث بياناتك حسب الأصول، وذلك لضمان جودة البيانات الشخصية وضمان دقتها.\nعلى الموقع الإلكتروني www.payry.mx نستخدم ملفات تعريف الارتباط الوظيفية. تسمح لنا ملفات تعريف الارتباط التي تستخدمها Payry بجمع وتحليل والاحتفاظ بالمعلومات الإلكترونية المتعلقة بزيارات موقعنا. تسمح لنا ملفات تعريف الارتباط التي نستخدمها بجمع هذه المعلومات تلقائيًا في لحظة دخولك إلى موقعنا الإلكتروني وخدماتنا الإلكترونية؛ ومع ذلك، فإن ذلك لا يسمح لنا بالتعرف بشكل فردي على الأشخاص الذين يزوروننا. إذا كنت تتصفح موقعنا الإلكتروني و/أو ترسل معلومات من خلاله، فإنك تمنحنا موافقتك الصريحة على تثبيت ملفات تعريف الارتباط الخاصة بنا. للحصول على معلومات أكثر تفصيلاً حول ملفات تعريف الارتباط وكيف يمكنك تعطيلها اعتمادًا على المتصفح ونظام التشغيل لديك، نوصي بزيارة موقع allaboutcookies.org الذي يشرح خطوة بخطوة كيفية تعطيلها. يرجى ملاحظة أنه إذا قمت بتعطيل ملفات تعريف الارتباط أو منعت تثبيتها، فقد لا تتمكن من استخدام بعض وظائف موقعنا بشكل كامل.\nنحن نحتفظ بالحق في تعديل أو تحديث أو تمديد أو تغيير محتوى ونطاق إشعار الخصوصية هذا، في أي وقت ووفقًا لتقديرنا الخاص. يمكنك، في أي وقت، طلب أحدث إصدار من إشعار الخصوصية هذا من قسم البيانات الشخصية لدينا، عبر عنوان البريد الإلكتروني hola@payry.com.',
      'de':
          'Datenschutzhinweis – Kunden\n\nZiel dieses Dokuments ist es, Sie auf einfachste Weise auf unsere Datenschutzerklärung aufmerksam zu machen. Für den Fall, dass Sie Fragen haben, stehen Ihnen jederzeit Kommunikationskanäle zur Verfügung.\n\nIn dieser Datenschutzerklärung („ADP“) beschreiben wir die Art und Weise, wie wir Ihre personenbezogenen Daten ab dem Zeitpunkt der Erstellung Ihres Kontos und der Eingabe der Daten für die Nutzung der Produkte von Kince S. de Information Technologies erfassen und verarbeiten. R.L. des Lebenslaufs (im Folgenden austauschbar „Payry“ oder der „Verantwortliche“) und solange Sie Payry-Kunde sind.\n\nBei Payry sind wir dem Schutz Ihrer personenbezogenen Daten voll und ganz verpflichtet und halten uns an die Bestimmungen des Bundesgesetzes zum Schutz personenbezogener Daten im Besitz privater Parteien (das „LFPD“) sowie die übrigen geltenden Datenschutzbestimmungen. Aus diesem Grund informieren wir Sie darüber, dass Payry mit der Anschrift Avenida Américas 1545 Piso 5E, Colonia Providencia, CP 44630, Guadalajara, Jalisco zum Anhören und Empfangen von Benachrichtigungen für die Erhebung und Verarbeitung aller Ihrer personenbezogenen Daten verantwortlich ist.\n\nUm die Zwecke der Verarbeitung Ihrer personenbezogenen Daten zu erfüllen, erfassen wir bei Payry die folgenden Kategorien Ihrer personenbezogenen Daten:\nIdentifikations- und Kontaktdaten.\nSteuerdaten.\nTransaktionsdaten.\nGeografische Standortdaten.\nFür die in dieser Mitteilung beschriebenen Zwecke erhebt Payry keine personenbezogenen Daten, die als vertraulich gelten.\n\n\n\nDies sind die Hauptzwecke, für die wir Ihre personenbezogenen Daten erheben:\nErleichtern Sie den Abschluss unserer Finanzprodukte und/oder -dienstleistungen durch die verfügbaren technischen Mittel. Analysieren Sie Ihr Profil, um den Grad des Risikos für die Gewährung der Finanzprodukte zu ermitteln, die wir anbieten oder anbieten könnten.\n\nFühren Sie die Überprüfung der im Wahlausweis und der Gesichtsbiometrie enthaltenen Daten durch den Überprüfungsdienst des Nationalen Wahlinstituts durch.\nVerwalten, verwalten und aktualisieren Sie unsere Kundendatenbanken.\nVerwalten und kommunizieren Sie Kontoauszüge und alle anderen Informationen im Zusammenhang mit den von unseren Kunden erworbenen Finanzprodukten und/oder -dienstleistungen.\nVerwalten, verwalten und aktualisieren Sie die Informationen im Zusammenhang mit den Einzügen/Zahlungen, die Sie für die gekauften Produkte und/oder Dienstleistungen vornehmen.\nErleichtern Sie die Aufmerksamkeit des Kundendienstes.\nErfassen Sie die Transaktionen, die mit unseren Produkten getätigt werden.\nNotieren Sie den Standort, wenn Sie Transaktionen mit unseren Produkten tätigen.\nErmöglichen Sie unsere Produkte und/oder Dienstleistungen mithilfe mobiler Gerätedaten.\nVerwalten und verwalten Sie die Kommunikation mit unseren Kunden. Statistiken und historische Aufzeichnungen unserer Kunden.\nSofern Sie uns bei der Registrierung als Interessent nichts anderes mitteilen, verwenden wir einige Daten, um Ihnen Mitteilungen, beispielsweise per SMS und/oder E-Mail, mit Neuigkeiten oder kommerziellen Informationen über Produkte und Dienstleistungen von Payry sowie Werbekampagnen und Teilnahme zu senden in den von Payry angebotenen Dynamiken und Programmen; Hierbei handelt es sich um einen Nebenzweck, dem Sie jederzeit widersprechen können.\nPayry kann Ihre Daten innerhalb oder außerhalb Mexikos an (i) seine kontrollierenden Unternehmen, verbundenen Unternehmen, Tochtergesellschaften oder jedes Unternehmen derselben Unternehmensgruppe weitergeben, die nach denselben internen Prozessen und Richtlinien arbeiten, zum Zweck der zentralen Sicherung von Informationen, zur Dokumentation und Formalisierung betrieblicher und/oder unternehmensbezogener Umstrukturierungsmaßnahmen sowie für statistische und historische Kundenregistrierungszwecke; (ii) Kreditauskunfteien, um Informationen über Ihre Kredithistorie und Kontaktinformationen anzufordern; (iii) Behörden, Organisationen oder staatliche Stellen, um Informationsüberprüfungen durchzuführen, um den in der geltenden Gesetzgebung vorgesehenen Verpflichtungen nachzukommen und/oder um gegebenenfalls die Anforderungen der zuständigen Behörden zu erfüllen; (iv) Inkassounternehmen, um gerichtliche oder außergerichtliche Eintreibungen unbezahlter Kredite durchzuführen, und (v) unabhängige Dritte (Dienstleister), mit dem ausschließlichen Zweck, Payry bei der Erbringung seiner Dienstleistungen zu unterstützen.\nWir weisen Sie darauf hin, dass wir gemäß Artikel 37 des LFPD nicht Ihre Zustimmung zur Weitergabe Ihrer Daten gemäß den im vorherigen Absatz festgelegten Bedingungen benötigen.\nSie können Ihr Recht auf Zugang, Berichtigung, Löschung und Widerspruch (ARCO-Rechte) jederzeit ausüben, indem Sie eine Anfrage an senden\nunsere Abteilung für personenbezogene Daten unter der E-Mail-Adresse: hola@payry.mx. Der Betreff des Antrags muss als „ARCO-Rechte“ oder „Widerruf der Einwilligung“ angegeben werden und Folgendes enthalten:\nIhr Name und Ihre Adresse oder E-Mail-Adresse, an die wir die Antwort auf Ihre Anfrage übermitteln können;\nDie Dokumente, die Ihre Identität belegen, oder gegebenenfalls die gesetzliche Vertretung der Person, die das Recht in Ihrem Namen ausübt;\nDie klare und präzise Beschreibung der personenbezogenen Daten, in Bezug auf die Sie eines der ARCO-Rechte ausüben möchten, sowie jedes andere Element oder Dokument, das die Lokalisierung Ihrer personenbezogenen Daten erleichtert.\nPayry wird Sie innerhalb von maximal zwanzig (20) Werktagen, gerechnet ab dem Datum des Eingangs Ihrer Anfrage, über die getroffene Entscheidung informieren. Wenn Ihre Anfrage angemessen ist, wird sie innerhalb von fünfzehn (15) Werktagen nach dem Datum wirksam, an dem wir die Antwort mitteilen. Für den Fall, dass die von Ihnen bereitgestellten Informationen falsch oder unzureichend sind oder die oben genannten Anforderungen nicht erfüllen, werden wir Sie innerhalb von fünf (5) Werktagen nach Eingang Ihrer Anfrage informieren, damit Sie die entsprechenden Änderungen vornehmen oder allen Anforderungen nachkommen können Anforderungen. In diesem Fall haben Sie zehn (10) Werktage Zeit, um Ihre Anfrage zu korrigieren, andernfalls gilt sie als nicht eingereicht und wird abgelehnt.\nIndem Sie Ihre Anfrage an hola@payry.com senden, ermächtigen Sie Payry, auf demselben Weg zu antworten, es sei denn, Sie geben ein anderes Kommunikationsmittel an.\nAls Kunde können Sie Ihre Einwilligung zur Verarbeitung und Übermittlung Ihrer personenbezogenen Daten widerrufen oder die Nutzung oder Offenlegung Ihrer personenbezogenen Daten einschränken, indem Sie dasselbe Verfahren befolgen, sofern dadurch Payry nicht daran gehindert wird, einer Verpflichtung nachzukommen .\nEs liegt in Ihrer Verantwortung, etwaige Änderungen Ihrer personenbezogenen Daten mitzuteilen, damit diese berücksichtigt werden, und Ihre Daten ordnungsgemäß auf dem neuesten Stand zu halten, um die Qualität der personenbezogenen Daten sicherzustellen und deren Richtigkeit zu gewährleisten.\nAuf der Website www.payry.mx verwenden wir funktionale Cookies. Die von Payry verwendeten Cookies ermöglichen es uns, elektronische Informationen im Zusammenhang mit Besuchen auf unserer Website zu sammeln, zu analysieren und zu speichern. Die von uns verwendeten Cookies ermöglichen es uns, diese Informationen automatisch zu erfassen, sobald Sie auf unsere Website und unsere elektronischen Dienste zugreifen. Diese ermöglichen es uns jedoch nicht, die Personen, die uns besuchen, individuell zu identifizieren. Wenn Sie auf unserer Website surfen und/oder Informationen darüber senden, erteilen Sie uns Ihre ausdrückliche Zustimmung zur Installation unserer Cookies. Für detailliertere Informationen über Cookies und wie Sie diese je nach Browser und Betriebssystem deaktivieren können, empfehlen wir Ihnen den Besuch der Website allaboutcookies.org, auf der Schritt für Schritt erklärt wird, wie Sie sie deaktivieren können. Bitte beachten Sie, dass Sie einige Funktionen unserer Website möglicherweise nicht vollständig nutzen können, wenn Sie Cookies deaktivieren oder deren Installation verhindern.\nWir behalten uns das Recht vor, den Inhalt und Umfang dieser Datenschutzerklärung jederzeit und nach unserem alleinigen Ermessen zu ändern, zu aktualisieren, zu erweitern oder anderweitig zu ändern. Sie können jederzeit die neueste Version dieser Datenschutzerklärung von unserer Abteilung für personenbezogene Daten über die E-Mail-Adresse hola@payry.com anfordern.',
      'en':
          'Privacy Notice - Clients\n\nThe objective of this document is to make you aware of our Privacy Notice in the easiest way possible. In case you have any questions, there are communication channels that are always available to you.\n\nIn this Privacy Notice (“ADP”) we describe the way in which we collect and process your personal data from the moment you create your account and enter the data for the use of Kince S. de Information Technologies products. R.L. of C.V. (hereinafter interchangeably “Payry” or the “Responsible”) and for as long as you are a Payry customer.\n\nAt Payry we are completely committed to the protection of your personal data and we comply with the provisions of the Federal Law on Protection of Personal Data Held by Private Parties (the “LFPD”) and the rest of the applicable regulations on data protection. For this reason, we inform you that Payry, with address to hear and receive notifications at Avenida Américas 1545 Piso 5E, Colonia Providencia, CP 44630, Guadalajara, Jalisco, is responsible for collecting and processing all your personal data.\n\nTo fulfill the purposes of processing your personal data, at Payry we collect the following categories of your personal data:\nIdentification and contact data.\nTax data.\nTransaction data.\nGeographic location data.\nFor the purposes described in this Notice, Payry does not collect personal data considered sensitive.\n\n\n\nThese are the main purposes for which we collect your personal data:\nFacilitate the contracting of our financial products and/or services through the technological means available. Analyze your profile to determine the degree of risk for the granting of the financial products that we offer or may offer.\n\nCarry out the verification of the data contained in the Voting Credential and the facial biometric through the verification service of the National Electoral Institute.\nManage, administer and keep our customer databases updated.\nManage and communicate account statements and any other information related to the financial products and/or services acquired by our clients.\nManage, administer and keep updated the information related to the collections/payments you make for the products and/or services purchased.\nFacilitate customer service attention.\nRecord the transactions that are made with our products.\nRecord the location when transacting with our products.\nFacilitate our products and/or services using mobile device data.\nManage and administer communications with our clients. Statistics and historical record of our clients.\nUnless you tell us otherwise when you register as a prospect, we will use some data to send you communications, for example, by SMS and/or email, with news or commercial information about Payry products and services, as well as advertising campaigns and participation in dynamics and programs offered by Payry; This is a secondary purpose and you can object to it at any time.\nPayry may share your data inside or outside of Mexico with (i) its controlling companies, affiliates, subsidiaries or any company of the same corporate group that operate under the same internal processes and policies, for purposes of centralized safeguarding of information, to document and formalize operational and/or corporate restructuring operations, and for statistical and historical customer registration purposes; (ii) credit information companies, to request information about your credit history and contact information; (iii) authorities, organizations or government entities, to carry out information verifications, to comply with obligations provided for in the applicable legislation and/or to comply with requirements made by competent authorities where applicable; (iv) collection companies, to carry out judicial or extrajudicial collections of unpaid credits, and (v) unrelated third parties (service providers), with the exclusive purpose of assisting Payry in the provision of its services.\nWe tell you that, in accordance with article 37 of the LFPD, we do not require your consent to share your data in the terms established in the previous paragraph.\nYou can exercise your rights of access, rectification, cancellation and opposition (ARCO rights) at any time by sending a request to\nour Personal Data Department at the email: hola@payry.mx. The subject of the request must be indicated as “ARCO Rights” or “Revocation of Consent” and must contain the following:\nYour name and address or email address to which we can communicate the response to your request;\nThe documents that prove your identity or, where applicable, the legal representation of the person who exercises the right on your behalf;\nThe clear and precise description of the personal data with respect to which you seek to exercise any of the ARCO rights, and Any other element or document that facilitates the location of your personal data.\nPayry will inform you of the determination made within a maximum period of twenty (20) business days, counted from the date on which your request is received. When your request is appropriate, it will be effective within fifteen (15) business days following the date on which we communicate the response. In the event that the information you provide is incorrect, insufficient, or does not meet the aforementioned requirements, we will inform you within five (5) business days following receipt of your request so that you can make the pertinent changes or comply with all the requirements. In this case, you will have ten (10) business days to correct your request, otherwise it will be considered not submitted and will be rejected.\nBy sending your request to hola@payry.com, you authorize Payry to respond by that same means, unless you indicate another means of communication.\nAs a client, you can revoke your consent for the processing, transfer of your personal data or limit the use or disclosure of your personal data by following this same procedure, as long as it does not make it impossible for Payry to comply with any obligation.\nIt is your responsibility to communicate any changes to your personal data so that it is taken into account and to keep your data duly updated, in order to ensure the quality of the personal data and guarantee that it is accurate.\nOn the website www.payry.mx we use functional cookies. The cookies used by Payry allow us to collect, analyze and retain electronic information related to visits to our website. The cookies we use allow us to collect this information automatically at the moment you access our website and our electronic services; However, these do not allow us to individually identify the people who visit us. If you browse our website and/or send information through it, you give us your express consent to install our cookies. For more detailed information about cookies and how you can disable them depending on your browser and operating system, we recommend that you visit the allaboutcookies.org website, which explains step by step how to disable them. Please note that if you disable cookies or prevent their installation, you may not be able to fully use some functions of our website.\nWe reserve the right to modify, update, extend or otherwise change the content and scope of this Privacy Notice, at any time and under our sole discretion. At any time, you can request the latest version of this Privacy Notice from our Personal Data Department, through the email address hola@payry.com.',
    },
    'esd1wi70': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_26_Dashboard
  {
    'rb4o0vmg': {
      'es': 'Dashboard',
      'ar': 'لوحة القيادة',
      'de': 'Armaturenbrett',
      'en': 'Dashboard',
    },
    'ligecgv4': {
      'es': 'BALANCE',
      'ar': 'توازن',
      'de': 'GLEICHGEWICHT',
      'en': 'BALANCE',
    },
    'x29fkeoz': {
      'es': '3,941.48',
      'ar': '3,941.48',
      'de': '3.941,48',
      'en': '3,941.48',
    },
    'k3ourelr': {
      'es': 'MXN',
      'ar': 'بيزو مكسيكي',
      'de': 'MXN',
      'en': 'MXN',
    },
    '3lc6ioqs': {
      'es': ' QR\'s',
      'ar': 'QR',
      'de': 'QRs',
      'en': 'QR\'s',
    },
    'lil6mu5q': {
      'es': 'Últimas transacciones',
      'ar': 'أحدث المعاملات',
      'de': 'Neueste Transaktionen',
      'en': 'Latest transactions',
    },
    'jheml2fs': {
      'es': 'Ver todas',
      'ar': 'اظهار الكل',
      'de': 'Alles sehen',
      'en': 'See all',
    },
    'tkx5d9iy': {
      'es': 'QR',
      'ar': 'ريال قطري',
      'de': 'QR',
      'en': 'QR',
    },
    '9242n7wx': {
      'es': ' SMS\'s',
      'ar': 'الرسائل القصيرة',
      'de': 'SMS',
      'en': 'SMS\'s',
    },
    'ydu2jm73': {
      'es': 'Últimas transacciones',
      'ar': 'أحدث المعاملات',
      'de': 'Neueste Transaktionen',
      'en': 'Latest transactions',
    },
    'ccvvq21t': {
      'es': 'Ver todas',
      'ar': 'اظهار الكل',
      'de': 'Alles sehen',
      'en': 'See all',
    },
    'm1x7kmqj': {
      'es': 'SMS',
      'ar': 'رسالة قصيرة',
      'de': 'SMS',
      'en': 'SMS',
    },
    '297xzvua': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_05_RegisterInv
  {
    'ku9xunaq': {
      'es': 'Crea una cuenta',
      'ar': 'إنشاء حساب',
      'de': 'Ein Konto erstellen',
      'en': 'Create an account',
    },
    '1b0qy5kd': {
      'es': 'Nombre',
      'ar': 'اسم',
      'de': 'Name',
      'en': 'Name',
    },
    'qg5l1gt2': {
      'es': 'Ingresa el nombre...',
      'ar': 'أدخل الاسم...',
      'de': 'Geben Sie den Namen ein...',
      'en': 'Enter the name...',
    },
    'vnnbnh24': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    '9a1dhus4': {
      'es': 'Ingresa tu email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'a9le7705': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    'yr5v3hjj': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    'c73xsit2': {
      'es': 'Confirma Contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Bestätige das Passwort',
      'en': 'Confirm Password',
    },
    '4vy5gxo0': {
      'es': 'Confirma tu contraseña...',
      'ar': 'أكد رقمك السري...',
      'de': 'Bestätigen Sie Ihr Passwort...',
      'en': 'Confirm your password...',
    },
    'bpwboi6x': {
      'es': 'Crea tu cuenta',
      'ar': 'أنشئ حسابك',
      'de': 'Erstellen Sie Ihr Konto',
      'en': 'creat your account',
    },
    'j2rtf1if': {
      'es': '¿Ya tienes una cuenta?',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Haben Sie bereits ein Konto?',
      'en': 'Do you already have an account?',
    },
    '46e7nbu9': {
      'es': 'Inicia sesión',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'en': 'Log in',
    },
    '48vmj85m': {
      'es': 'El nombre es requerido',
      'ar': 'الاسم مطلوب',
      'de': 'Der Name ist erforderlich',
      'en': 'The name is required',
    },
    'j0iew1fr': {
      'es': 'El ',
      'ar': 'هو',
      'de': 'Er',
      'en': 'He',
    },
    'xm509d3e': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'chx264kf': {
      'es': 'El correo electrónico es requerido',
      'ar': 'البريد الالكتروني مطلوب',
      'de': 'E-Mail ist erforderlich',
      'en': 'Email is required',
    },
    'k0zqevz1': {
      'es': 'El correo electrónico es inválido',
      'ar': 'البريد الإلكتروني غير صالح',
      'de': 'E-Mail ist ungültig',
      'en': 'Email is invalid',
    },
    'bewlsian': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'z8ohjpoj': {
      'es': 'La contraseña es requerida',
      'ar': 'كلمة المرور مطلوبة',
      'de': 'Passwort wird benötigt',
      'en': 'Password is required',
    },
    'iqars6to': {
      'es': 'La contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': 'الرقم السري يجب الا يقل عن 6 احرف على الاقل',
      'de': 'Das Passwort muss mindestens 6 Zeichen lang sein',
      'en': 'Password must be at least 6 characters long',
    },
    'ov823dj4': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'tqroezi2': {
      'es': 'La confirmación de contraseña es requerida',
      'ar': 'مطلوب تأكيد كلمة المرور',
      'de': 'Eine Passwortbestätigung ist erforderlich',
      'en': 'Password confirmation is required',
    },
    '25c2bcby': {
      'es':
          'La confirmación de contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': 'يجب أن يتكون تأكيد كلمة المرور من 6 أحرف على الأقل',
      'de': 'Die Passwortbestätigung muss mindestens 6 Zeichen lang sein',
      'en': 'Password confirmation must be at least 6 characters long',
    },
    'lvllhto1': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
    },
    'l79zuk9t': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // OK_FN_Payry_44_historialTransactions
  {
    'olwt8i64': {
      'es': 'Historial de Transacciones',
      'ar': 'تاريخ المعاملات',
      'de': 'Verlauf der Transaktionen',
      'en': 'Transaction History',
    },
    'r83tq64q': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'heim',
      'en': 'home',
    },
  },
  // StatusDropdown
  {
    '3m8txdau': {
      'es': 'Alta',
      'ar': 'عالي',
      'de': 'hoch',
      'en': 'high',
    },
    'v8rlzlwt': {
      'es': 'Baja',
      'ar': 'قليل',
      'de': 'Niedrig',
      'en': 'Low',
    },
    'gps9u0n0': {
      'es': 'Please select...',
      'ar': 'الرجاء التحديد...',
      'de': 'Bitte auswählen...',
      'en': 'Please select...',
    },
    'wm4szvpn': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
  },
  // Miscellaneous
  {
    'a9j78va9': {
      'es': 'LABEL',
      'ar': 'ملصق',
      'de': 'ETIKETT',
      'en': 'LABEL',
    },
    'i7f18cve': {
      'es': 'Ingresa tu valor del campo...',
      'ar': 'أدخل قيمة الحقل الخاص بك...',
      'de': 'Geben Sie Ihren Feldwert ein...',
      'en': 'Enter your field value...',
    },
    'wztjmbn8': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    'lw1jpm1f': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    'qbmoi1av': {
      'es': 'Inicio',
      'ar': 'البدء',
      'de': 'Start',
      'en': 'Start',
    },
    'bfc1mwlc': {
      'es': 'fwefwef',
      'ar': 'com.fwefwef',
      'de': 'fwefwef',
      'en': 'fwefwef',
    },
    'u44irnjh': {
      'es': 'wfwefewfwef',
      'ar': 'wfwefewfwef',
      'de': 'wfwefewfwef',
      'en': 'wfwefewfwef',
    },
    'a5kn86sf': {
      'es': 'Please select...',
      'ar': 'الرجاء التحديد...',
      'de': 'Bitte auswählen...',
      'en': 'Please select...',
    },
    '464z4iqf': {
      'es': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'de': 'Nach einem Artikel suchen...',
      'en': 'Search for an item...',
    },
    'ym57p3wz': {
      'es': 'Button',
      'ar': 'زر',
      'de': 'Taste',
      'en': 'button',
    },
    'lzyb73wy': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kx9cdks4': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'efvtwj7k': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ec5hfa1e': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'q5ljwvfo': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'j4rmwb3h': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6ah1b18f': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2kos1hen': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '85za9ga8': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'io1uy427': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'njgtkapm': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '368u7j5b': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'aox3s4fb': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'l8hv5a7z': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '4pjwb70a': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '0xlokf4y': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8twlwiwt': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'i2w3xx7f': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kkb43b79': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'eolx0pxf': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '7wi3vrbh': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'mi9sfsyi': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'x61uopg4': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    't4xzlq9q': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '513nj4m0': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'a1jxfgju': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
