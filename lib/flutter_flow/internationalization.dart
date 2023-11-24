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
    'uznk89q3': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    '1tpe0m3n': {
      'es': 'Ingresa tu email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'he9c7fyw': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    '7v8neg1r': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    'cmb82twz': {
      'es': 'Recordarme',
      'ar': 'تذكرنى',
      'de': 'erinnere dich an mich',
      'en': 'remember me',
    },
    'm2xyjvuf': {
      'es': '¿Olvidaste tu contraseña?',
      'ar': 'هل نسيت كلمة المرور الخاصة بك؟',
      'de': 'Haben Sie Ihr Passwort vergessen?',
      'en': 'Did you forget your password?',
    },
    'pphkhqmv': {
      'es': 'Iniciar sesión',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'en': 'Log in',
    },
    'cjqb8ial': {
      'es': '¿Aún no tienes cuenta?',
      'ar': 'لا تملك حسابا حتى الآن؟',
      'de': 'Sie haben noch kein Konto?',
      'en': 'Don\'t have an account yet?',
    },
    'a0iimirx': {
      'es': 'Regístrate ahora',
      'ar': 'سجل الان',
      'de': 'Jetzt registrieren',
      'en': 'Register now',
    },
    '03sv3kno': {
      'es': 'El correo electrónico es requerido...',
      'ar': '',
      'de': '',
      'en': '',
    },
    '9caxtr9n': {
      'es': 'El correo electrónico es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'mmx2micy': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qcfvsnyn': {
      'es': 'La contraseña es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vflagspg': {
      'es': 'La contraseña debe ser de al menos 6 caracteres',
      'ar': '',
      'de': '',
      'en': '',
    },
    '79r0a2a6': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2bb3vct7': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_05_Registrate
  {
    'gpokmd81': {
      'es': 'Crea una cuenta',
      'ar': 'إنشاء حساب',
      'de': 'Ein Konto erstellen',
      'en': 'Create an account',
    },
    'pmd51114': {
      'es': 'Nombre',
      'ar': 'اسم',
      'de': 'Name',
      'en': 'Name',
    },
    '9obxrfsj': {
      'es': 'Ingresa el nombre...',
      'ar': 'أدخل الاسم...',
      'de': 'Geben Sie den Namen ein...',
      'en': 'Enter the name...',
    },
    'oveogi7c': {
      'es': 'Correo electrónico',
      'ar': 'بريد الكتروني',
      'de': 'Email',
      'en': 'Email',
    },
    'r97l0zz1': {
      'es': 'Ingresa tu email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'en': 'Enter your email...',
    },
    'elbpjfvc': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
    },
    'v93oi4a3': {
      'es': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'en': 'Enter your password...',
    },
    '1r82hx9g': {
      'es': 'Confirma Contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Bestätige das Passwort',
      'en': 'Confirm Password',
    },
    '0d3ljp8k': {
      'es': 'Confirma tu contraseña...',
      'ar': 'أكد رقمك السري...',
      'de': 'Bestätigen Sie Ihr Passwort...',
      'en': 'Confirm your password...',
    },
    'nud4ktuz': {
      'es': 'Crea tu cuenta',
      'ar': 'أنشئ حسابك',
      'de': 'Erstellen Sie Ihr Konto',
      'en': 'creat your account',
    },
    '9ssznj0g': {
      'es': '¿Ya tienes una cuenta?',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Haben Sie bereits ein Konto?',
      'en': 'Do you already have an account?',
    },
    '3twynvfz': {
      'es': 'Inicia sesión',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'en': 'Log in',
    },
    'yszj7mhz': {
      'es': 'El nombre es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6jq6lh39': {
      'es': 'El ',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kll2yrsx': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'h495oirp': {
      'es': 'El correo electrónico es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'zm1uxn9n': {
      'es': 'El correo electrónico es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6xkyza7x': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6vf8psrm': {
      'es': 'La contraseña es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xfn6hfg9': {
      'es': 'La contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': '',
      'de': '',
      'en': '',
    },
    'l2cff2op': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'motqavr4': {
      'es': 'La confirmación de contraseña es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jljcw2pc': {
      'es':
          'La confirmación de contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': '',
      'de': '',
      'en': '',
    },
    'p5z728qt': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'momge5oj': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // Payry_60_NotifConfig
  {
    'sc4ff4ce': {
      'es': 'Notificaciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    'r72zvrv5': {
      'es':
          'Elige el tipo de notificaciones que quieres recibir y actualizaremos la configuración.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'gjygkr0n': {
      'es': 'Notificaciones Push',
      'ar': '',
      'de': '',
      'en': '',
    },
    '3y3yhxbk': {
      'es': 'Recibe notificaciones push de payry.',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1ytebj35': {
      'es': 'Email Notifications',
      'ar': '',
      'de': '',
      'en': '',
    },
    '9lvh5nst': {
      'es':
          'Recine notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funcionalidades.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'isgrgbfs': {
      'es': 'Guardar cambios',
      'ar': '',
      'de': '',
      'en': '',
    },
    'a96mlyeh': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_01_Splash
  {
    '6s3130nh': {
      'es': 'Keep Track of Spending',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jboge2qk': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lfc5cotg': {
      'es': 'Budget Analysis',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fa4remdf': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'hs3po7j0': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_02_onboarding1
  {
    'j3w8zg1b': {
      'es': 'Te damos la bienvenida a Payry, tu app de pagos',
      'ar': '',
      'de': '',
      'en': '',
    },
    'r5isq1nm': {
      'es': 'Keep Track of Spending',
      'ar': '',
      'de': '',
      'en': '',
    },
    'v468ysj8': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'x58dl2ne': {
      'es': 'Budget Analysis',
      'ar': '',
      'de': '',
      'en': '',
    },
    'yhrplehs': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'rk4skmz3': {
      'es': 'Comenzar',
      'ar': '',
      'de': '',
      'en': '',
    },
    'l1xtbhh4': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_14_Perfil_PENDSW
  {
    'z1ujavtg': {
      'es': 'Información personal',
      'ar': 'معلومات شخصية',
      'de': 'Persönliche Angaben',
      'en': 'Personal information',
    },
    'fcfe1ibo': {
      'es': 'Empresa',
      'ar': 'شركة',
      'de': 'Unternehmen',
      'en': 'Company',
    },
    '2lpa9baa': {
      'es': 'Verificar email',
      'ar': '',
      'de': '',
      'en': '',
    },
    'phzcs2ky': {
      'es': 'Notificaciones',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'en': 'Notifications',
    },
    'w8lkg9yx': {
      'es': 'Cerrar sesión',
      'ar': 'تسجيل خروج',
      'de': 'abmelden',
      'en': 'Sign off',
    },
    'u9x4uw1l': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
    },
    '9sck8j18': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    '8w1emfrl': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    '7zgk5aqm': {
      'es': 'El nombre es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    's8g227zo': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'afkqo1mv': {
      'es': 'Field is required',
      'ar': '',
      'de': '',
      'en': '',
    },
    '33sy0rs1': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '4ysxke82': {
      'es': 'Field is required',
      'ar': '',
      'de': '',
      'en': '',
    },
    'bifwrifl': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'mijkkrqs': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': 'كواهويلا دي سرقسطة',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    'cqiy6sv1': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': 'أدخل RFC كما في ملف CSF الخاص بك...',
      'de': 'Geben Sie den RFC wie in Ihrem CSF ein...',
      'en': 'Enter the RFC as in your CSF...',
    },
    'cgs36prp': {
      'es': 'Régimen Fiscal',
      'ar': 'النظام الضريبي',
      'de': 'Steuerregelung',
      'en': 'Tax Regime',
    },
    'rfj4s9lf': {
      'es': 'Selecciona tu régimen fiscal...',
      'ar': 'اختر نظامك الضريبي...',
      'de': 'Wählen Sie Ihr Steuersystem...',
      'en': 'Select your tax regime...',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    '8a4kvhmg': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'nb8qhyyv': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    '519tf078': {
      'es': 'Datos bancarios',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8mhw9j38': {
      'es': 'API',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ywefvk2q': {
      'es': 'El nombre es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'e9uwq3ln': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ojg5b58u': {
      'es': 'Field is required',
      'ar': '',
      'de': '',
      'en': '',
    },
    'sdhk9jy7': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'tp3wowqm': {
      'es': 'El correo electrónico es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fpf8iioc': {
      'es': 'El correo electrónico es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kftaqk6c': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jqf4gofj': {
      'es': 'La calle es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    '3bcoaxfl': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'bn5m7502': {
      'es': 'El número de calle es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'gsxcxvb0': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'o0w310ve': {
      'es': 'La colonia es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vc91ilvw': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'la4d1fmp': {
      'es': 'La ciudad es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'w2yg9p4k': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '7dht57pp': {
      'es': 'El código postal es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6qfdmdr8': {
      'es': 'El código postal debe contener exactamente 5 dígitos',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wwsm4d49': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1e8m9n58': {
      'es': 'El RFC es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ipuqaog2': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'n3ppdc0z': {
      'es': 'El régimen físcal es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jeu90uz3': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xb4ro7ev': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    '1jp6ppa3': {
      'es': 'Guardar',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
    },
    'l7wp2gbp': {
      'es': 'La CLABE es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    'bqt618xs': {
      'es': 'La CLABE debe contener 18 caracteres',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ej4p7bia': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8m8nisg8': {
      'es': 'Field is required',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xqtt572a': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1e5muyr7': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_22_conexionAPI
  {
    'd33inlx3': {
      'es': 'Conexión (API)',
      'ar': 'اتصال (واجهة برمجة التطبيقات)',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    'zbm4lg3a': {
      'es': 'Correo electrónico inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'y1ru9g9v': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'g7akq31o': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    'pwrztfxc': {
      'es': 'El concepto debe contener al menos 10 caracteres',
      'ar': '',
      'de': '',
      'en': '',
    },
    'mid5m10r': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fqxgivzu': {
      'es': 'El importe es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'aa4xq3ih': {
      'es': 'El formato del importe es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'pn4cpqxm': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'erb0b90p': {
      'es': 'Más opciones de QR',
      'ar': 'المزيد من خيارات QR',
      'de': 'Weitere QR-Optionen',
      'en': 'More QR options',
    },
    '5uxuvkt1': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': 'بحث مفهوم QR',
      'de': 'Suchen Sie nach QR-Konzept',
      'en': 'Search QR concept',
    },
    'bag8pw7e': {
      'es': 'Buscar...',
      'ar': 'بحث...',
      'de': 'Suche...',
      'en': 'Look for...',
    },
    'xbz9cmrs': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_37_facturas
  {
    '4bjqyvsl': {
      'es': 'Facturas y solicitudes',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lp64r26g': {
      'es': '2023',
      'ar': '',
      'de': '',
      'en': '',
    },
    'pq92bcmx': {
      'es': 'Agosto',
      'ar': '',
      'de': '',
      'en': '',
    },
    'nxgzminm': {
      'es': 'STATUS',
      'ar': '',
      'de': '',
      'en': '',
    },
    '05sty2wn': {
      'es': '\$3,169.14',
      'ar': '',
      'de': '',
      'en': '',
    },
    'me4wl4p3': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_42_Terminosycondiciones
  {
    'bt8srygl': {
      'es': 'Términos y condiciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lv9mqnhn': {
      'es': '1. Términos',
      'ar': '',
      'de': '',
      'en': '',
    },
    'x9at1eqx': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1h2ffv7r': {
      'es': '2. Licencia de uso',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6d8oivfd': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2m8t6tbr': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    '5hzdia0z': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    '4qzi2ek3': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2ibrbcw9': {
      'es': 'El concepto es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'aolg84gz': {
      'es': 'El concepto debe contener al menos 10 caracteres',
      'ar': '',
      'de': '',
      'en': '',
    },
    'th7icb6g': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kdktdy1a': {
      'es': 'El importe es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'uow59z27': {
      'es': 'El formato del importe es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kpdqcmen': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'aushueu6': {
      'es': 'Más opciones de SMS',
      'ar': 'المزيد من خيارات الرسائل القصيرة',
      'de': 'Weitere SMS-Optionen',
      'en': 'More SMS options',
    },
    't4vjc0p6': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_40_Notificaciones
  {
    'zz9ezmgq': {
      'es': 'Notificaciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    'yxssjqod': {
      'es': 'QR Pagado',
      'ar': '',
      'de': '',
      'en': '',
    },
    'o1tsw3y0': {
      'es': '10 feb, 2023 a las 12:36 PM',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lvpogo1i': {
      'es': 'Marcar como leido',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2hm03918': {
      'es': 'El usuario ha aceptado la invitación',
      'ar': '',
      'de': '',
      'en': '',
    },
    '06o6ezzz': {
      'es':
          'Alejandro Barba ha aceptado su invitación para colaborar en la cuenta de Tecnologías de la Información KINCE IT S.A. de C.V.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lxmxzzhw': {
      'es': '10 feb, 2023 a las 12:36 PM',
      'ar': '',
      'de': '',
      'en': '',
    },
    '9suhtl73': {
      'es': 'Marcar como leido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vy3785vt': {
      'es': 'SMS Cancelado',
      'ar': '',
      'de': '',
      'en': '',
    },
    '0xto6t5p': {
      'es': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xz5p8asu': {
      'es': '31 ene, 2023 a las 13:22 PM',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1so18z2a': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_41_FAQs
  {
    'lz7rys0u': {
      'es': 'FAQ\'s',
      'ar': '',
      'de': '',
      'en': '',
    },
    'e7p0pbfk': {
      'es': '¿Cuánto tarda en caducar un código QR?',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1xit30e7': {
      'es': '¿Cuánto tarda en caducar un código QR?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kdhd57wq': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'nfd4j9et': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vcnygt3s': {
      'es': '¿Cuántas veces puedo usar un código QR?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'djpay7lx': {
      'es': '¿Cuántas veces puedo usar un código QR?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xy60f63n': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'h1rcf7bx': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'v4kp0n63': {
      'es': '¿Cómo funciona el pago por SMS?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'zypd5hao': {
      'es': '¿Cómo funciona el pago por SMS?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vwjc7hp3': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'eaqtk9uu': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'v6ah7ity': {
      'es': '¿Cómo puedo configurar las notificaciones?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'mq7k43r5': {
      'es': '¿Cómo puedo configurar las notificaciones?',
      'ar': '',
      'de': '',
      'en': '',
    },
    '58t7215e': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'uva9f1w1': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ha6xptzu': {
      'es': '¿En cuánto tiempo veré reflejado el dinero a mi cuenta bancaria?',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8vkddhdx': {
      'es': '¿En cuánto tiempo veré reflejado el dinero a mi cuenta bancaria?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lu3f9cjw': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qpwvo6k4': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'oxavi1de': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_38_Estadisticas
  {
    'pt7kb0ix': {
      'es': 'Estadísticas',
      'ar': '',
      'de': '',
      'en': '',
    },
    'cy3cawqt': {
      'es': 'Pagos con QR',
      'ar': '',
      'de': '',
      'en': '',
    },
    'dc1j9r69': {
      'es': 'Pagos con SMS',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vexu9om5': {
      'es': 'Modificar fechas',
      'ar': '',
      'de': '',
      'en': '',
    },
    'de8f8uhm': {
      'es': 'Cobros realizados',
      'ar': '',
      'de': '',
      'en': '',
    },
    '96g4huhs': {
      'es': '100',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wiotdgzr': {
      'es': 'Importe total de cobros',
      'ar': '',
      'de': '',
      'en': '',
    },
    '936byz2v': {
      'es': '\$73,215.67',
      'ar': '',
      'de': '',
      'en': '',
    },
    'znpugkpb': {
      'es': 'Transferencias Payry',
      'ar': '',
      'de': '',
      'en': '',
    },
    'nwle6ien': {
      'es': '\$70,937.07',
      'ar': '',
      'de': '',
      'en': '',
    },
    '4t9507td': {
      'es': 'Costo en comisiones',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xxkclka3': {
      'es': '\$2,278.60',
      'ar': '',
      'de': '',
      'en': '',
    },
    'm3svvc6k': {
      'es': 'Pagos con QR\n63 transacciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    '7l9f0acb': {
      'es': '\$48,272.30\n63.2%',
      'ar': '',
      'de': '',
      'en': '',
    },
    'rb74ik6y': {
      'es': 'Pagos con SMS\n37 transacciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    'y1ft1k17': {
      'es': '\$26,943.37\n36.8%',
      'ar': '',
      'de': '',
      'en': '',
    },
    '451t3snv': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_03_onboarding2
  {
    '4pqvv0rw': {
      'es': 'Puede solicitar pagos vía\nQR o SMS en segundos',
      'ar': '',
      'de': '',
      'en': '',
    },
    '5qamurs2': {
      'es': 'Keep Track of Spending',
      'ar': '',
      'de': '',
      'en': '',
    },
    'zi52g9ub': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'w3ywj458': {
      'es': 'Budget Analysis',
      'ar': '',
      'de': '',
      'en': '',
    },
    'v2eh9rvn': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ou05eu27': {
      'es': 'Comenzar',
      'ar': '',
      'de': '',
      'en': '',
    },
    '14iuataz': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_04_onboarding3
  {
    'jaqz6tor': {
      'es': 'Tu dinero el mismo\ndía en tu cuenta',
      'ar': '',
      'de': '',
      'en': '',
    },
    'j50svm7p': {
      'es': 'Keep Track of Spending',
      'ar': '',
      'de': '',
      'en': '',
    },
    'z0dk0tg3': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'pe5tyzlj': {
      'es': 'Budget Analysis',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6qa5wuj8': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'y80s8mv5': {
      'es': 'Comenzar',
      'ar': '',
      'de': '',
      'en': '',
    },
    '23qa8lww': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
    'u8fp0ov2': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'luqbeqpu': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_10_confirmacionCorreoEnviadoContrasena
  {
    'vpsl1xzk': {
      'es': 'Tu enviamos un\ncorreo de verificación',
      'ar': 'قمت بإرسال أ\nالبريد الإلكتروني للتحقق',
      'de': 'Sie senden eine\nBestätigungs-E-Mail',
      'en': 'You send a\nverification email',
    },
    '66ooi8ge': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'taruew0o': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
    'b7vnlh38': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'sxg3foim': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
    '321iluww': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'cboqjaaq': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_21_confirmacionDatosBancarios
  {
    'xq7g2uwa': {
      'es': 'Datos bancarios\nvalidados correctamente',
      'ar': 'بيانات البنك\nالتحقق من صحتها بشكل صحيح',
      'de': 'Bankdaten\nkorrekt validiert',
      'en': 'Bank data\ncorrectly validated',
    },
    'gb6gl5n8': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'b1xkg868': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
    't86ityzs': {
      'es': 'Aceptar',
      'ar': 'يقبل',
      'de': 'Akzeptieren',
      'en': 'Accept',
    },
    'jehuz6s3': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
    '53z7a0gu': {
      'es': 'Generar QR',
      'ar': 'توليد ريال قطري',
      'de': 'QR generieren',
      'en': 'Generate QR',
    },
    'zp1agpy7': {
      'es': 'Generar SMS',
      'ar': 'توليد الرسائل القصيرة',
      'de': 'SMS generieren',
      'en': 'Generate SMS',
    },
    'b7egkfho': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
    },
    'zuycolhf': {
      'es': 'Empresas',
      'ar': 'شركات',
      'de': 'Firmen',
      'en': 'Companies',
    },
    'xp5wp64p': {
      'es': 'Estadísticas',
      'ar': 'إحصائيات',
      'de': 'Statistiken',
      'en': 'Statistics',
    },
    'a4nxegd0': {
      'es': 'Usuarios',
      'ar': 'المستخدمين',
      'de': 'Benutzer',
      'en': 'Users',
    },
    '0thro8sa': {
      'es': 'Documentación',
      'ar': 'توثيق',
      'de': 'Dokumentation',
      'en': 'Documentation',
    },
    'pcq6t117': {
      'es': 'Facturas',
      'ar': 'فواتير',
      'de': 'Rechnungen',
      'en': 'Bills',
    },
    'newh7oq2': {
      'es': 'FAQ\'s',
      'ar': 'الأسئلة الشائعة',
      'de': 'FAQs',
      'en': 'FAQ\'s',
    },
    'i2gzudsk': {
      'es': 'Términos y\ncondiciones',
      'ar': 'الشروط و\nشروط',
      'de': 'Bedingungen und\nBedingungen',
      'en': 'Terms and\nconditions',
    },
    'n5vt2ta4': {
      'es': 'Política de\nprivacidad',
      'ar': 'سياسة\nخصوصية',
      'de': 'Politik von\nPrivatsphäre',
      'en': 'Politics of\nprivacy',
    },
    'd1tz84dp': {
      'es': 'Cambiar a\nversión clara',
      'ar': 'التبديل إلى\nنسخة واضحة',
      'de': 'Wechseln zu\nklare Version',
      'en': 'Switch to\nclear version',
    },
    'g9m5ylqw': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_43_Politicadeprivacidad
  {
    'e2i7edc8': {
      'es': 'Política de privacidad',
      'ar': '',
      'de': '',
      'en': '',
    },
    'iaych08v': {
      'es': '1. Términos',
      'ar': '',
      'de': '',
      'en': '',
    },
    '9k0o8kdf': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'tvlu88zl': {
      'es': '2. Licencia de uso',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wjvlggwe': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'laz0fjwg': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.',
      'ar': '',
      'de': '',
      'en': '',
    },
    'esd1wi70': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // OK_FN_Payry_05_RegisterInv
  {
    'tdr1ov5j': {
      'es': 'Crea una cuenta',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1x8i4zjm': {
      'es': 'Nombre',
      'ar': '',
      'de': '',
      'en': '',
    },
    'r0lmpls5': {
      'es': 'Ingresa el nombre...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'k8e0j4qp': {
      'es': 'Correo electrónico',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jsqdktrn': {
      'es': 'Ingresa tu email...',
      'ar': '',
      'de': '',
      'en': '',
    },
    '10zz8so8': {
      'es': 'Contraseña',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8o3zjabn': {
      'es': 'Ingresa tu contraseña...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'gy2e6nur': {
      'es': 'Confirma Contraseña',
      'ar': '',
      'de': '',
      'en': '',
    },
    '7dkqvcqp': {
      'es': 'Confirma tu contraseña...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kj1wcrkp': {
      'es': 'Crea tu cuenta',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wj97hdfr': {
      'es': '¿Ya tienes una cuenta?',
      'ar': '',
      'de': '',
      'en': '',
    },
    'zo8szlbk': {
      'es': 'Inicia sesión',
      'ar': '',
      'de': '',
      'en': '',
    },
    'vdemu107': {
      'es': 'El nombre es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qid04xu5': {
      'es': 'El ',
      'ar': '',
      'de': '',
      'en': '',
    },
    'oq19cilf': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wms8q5aq': {
      'es': 'El correo electrónico es requerido',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2yjme7ql': {
      'es': 'El correo electrónico es inválido',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fc7r9j45': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'abd5c3py': {
      'es': 'La contraseña es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    '3jcojhp1': {
      'es': 'La contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': '',
      'de': '',
      'en': '',
    },
    'hliae86u': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'rdks7h03': {
      'es': 'La confirmación de contraseña es requerida',
      'ar': '',
      'de': '',
      'en': '',
    },
    's4522nkx': {
      'es':
          'La confirmación de contraseña debe ser de almenos 6 carácteres de longitud',
      'ar': '',
      'de': '',
      'en': '',
    },
    'gm4m9p50': {
      'es': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'en': '',
    },
    'l79zuk9t': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': '',
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
      'ar': '',
      'de': '',
      'en': '',
    },
    'wm4szvpn': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'a9j78va9': {
      'es': 'LABEL',
      'ar': '',
      'de': '',
      'en': '',
    },
    'i7f18cve': {
      'es': 'Ingresa tu valor del campo...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'wztjmbn8': {
      'es': 'Contraseña',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lw1jpm1f': {
      'es': 'Ingresa tu contraseña...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qbmoi1av': {
      'es': 'Inicio',
      'ar': '',
      'de': '',
      'en': '',
    },
    'bfc1mwlc': {
      'es': 'fwefwef',
      'ar': '',
      'de': '',
      'en': '',
    },
    'u44irnjh': {
      'es': 'wfwefewfwef',
      'ar': '',
      'de': '',
      'en': '',
    },
    'a5kn86sf': {
      'es': 'Please select...',
      'ar': '',
      'de': '',
      'en': '',
    },
    '464z4iqf': {
      'es': 'Search for an item...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ym57p3wz': {
      'es': 'Button',
      'ar': '',
      'de': '',
      'en': '',
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
