import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Login Page
          'welcome': 'Welcome to Stockify',
          'welcome_to': 'Welcome to',
          'stockify': 'Stockify',
          'login_with_email': 'Login to your account using your email',
          'email': 'Email',
          'password': 'Password',
          'log_in': 'Log In',
          'forgot_password': 'Forgot your password? ',
          'reset_password': 'Reset password',
          'remember_me': 'Remember Me',

          // Splash pages
          'splash_1_title': 'Track. Analyze. Succeed',
          'splash_1_phrase':
              'Unlock the power of precise stock tracking. Master your entries and exits with confidence.',
          'splash_2_title': 'Streamline your business processes',
          'splash_2_phrase':
              'Effortlessly manage purchase orders and invoices for seamless operations.',
          'splash_3_title': 'Empower Your Stock Management Journey',
          'splash_3_phrase':
              'Seamlessly visualize and analyze your stock data, enabling you to make informed decisions and take your business to greater heights.',
          'skip': 'SKIP',
          'next': 'NEXT',
          'finish': 'FINISH',

          // Home page
          'dashboard': 'Dashboard',
          'entries_commands_to_treat': 'Entries commands to treat',
          'exits_commands_to_treat': 'Exits commands to treat',
          'invoices_to_pay': 'Invoices to pay',
          'invoices_to_validate': 'Invoices to validate',
          'expired_articles': 'Expired articles',
          'articles_close_to_threshold': 'Articles close to threshold',
          'articles': 'Articles',
          'clients': 'Clients',
          'suppliers': 'Suppliers',
          'departments': 'Departments',
          'stocks': 'Stocks',
          'companies': 'Companies',
          'sites': 'Sites',
          'banks': 'Banks',
          'families': 'Families',
          'currencies': 'Currencies',
          'services': 'Services',

          // Settings page
          'general': 'General',
          'account': 'Account',
          'language': 'Language A / أ',
          'about_us': 'About Us',
          'change_password': 'Change Password',
          'sign_out': 'Sign out',

          // Side bar & bottom bar
          'home': 'Home',
          'notifications': 'Notifications',
          'settings': 'Settings',
          'profil': 'Profile',
          'entries': 'Entries',
          'exits': 'Exits',
          'log_out': 'Log out',
          'commands': 'Commands',

          // Change language page
          'arabic': 'Arabic',
          'french': 'French',
          'english': 'English',

          // Change Password page
          'enter_current_password': 'Enter your current password',
          'enter_new_password': 'Enter your new password',
          'retype_new_password': 'Retype your new password',
          'existing_password': 'Existing Password',
          'new_password': 'New Password',
          'retype_password': 'Retype Password',
          'confirm_change': 'Confirm Change',

          // Entries commands page
          'entries_commands': 'Entries Commands',
          'search': 'Search for something',

          // Purchase orders page
          'purchase_orders': 'Purchase Orders',

          // Invoices page
          'invoices': 'Invoices',
        },
        'fr_FR': {
          // Login Page
          'welcome': 'Bienvenue dans Stockify',
          'welcome_to': 'Bienvenue à',
          'stockify': 'Stockify',
          'login_with_email':
              'Connectez-vous à votre compte en utilisant votre e-mail',
          'email': 'Email',
          'password': 'Mot de passe',
          'log_in': 'Se connecter',
          'forgot_password': 'Mot de passe oublié ? ',
          'reset_password': 'Réinitialiser le mot de passe',
          'remember_me': 'Se souvenir de moi',

          // Splash pages
          'splash_1_title': 'Suivre. Analyser. Réussir',
          'splash_1_phrase':
              'Déverrouillez la puissance d\'un suivi précis des stocks. Maîtrisez vos entrées et sorties en toute confiance.',
          'splash_2_title': 'Optimisez vos processus métier',
          'splash_2_phrase':
              'Gérez facilement les bons de commande et les factures pour des opérations fluides.',
          'splash_3_title': 'Donnez de l\'élan à votre gestion de stock',
          'splash_3_phrase':
              'Visualisez et analysez facilement vos données de stock, vous permettant de prendre des décisions éclairées et d\'emmener votre entreprise vers de nouveaux sommets.',
          'skip': 'PASSER',
          'next': 'SUIVANT',
          'finish': 'TERMINER',

          // Home page
          'dashboard': 'Tableau de bord',
          'entries_commands_to_treat': 'Commandes d\'entrées à traiter',
          'exits_commands_to_treat': 'Commandes de sorties à traiter',
          'invoices_to_pay': 'Factures à payer',
          'invoices_to_validate': 'Factures à valider',
          'expired_articles': 'Articles expirés',
          'articles_close_to_threshold': 'Articles proches du seuil',
          'articles': 'Articles',
          'clients': 'Clients',
          'suppliers': 'Fournisseurs',
          'departments': 'Départements',
          'stocks': 'Stocks',
          'companies': 'Entreprises',
          'sites': 'Sites',
          'banks': 'Banques',
          'families': 'Familles',
          'currencies': 'Devises',
          'services': 'Services',

          // Settings page
          'general': 'Général',
          'account': 'Compte',
          'language': 'Langue A / أ',
          'about_us': 'À propos de nous',
          'change_password': 'Changer le mot de passe',
          'sign_out': 'Déconnexion',

          // Side bar & bottom bar
          'home': 'Accueil',
          'notifications': 'Notifications',
          'settings': 'Paramètres',
          'profil': 'Profil',
          'entries': 'Entrées',
          'exits': 'Sorties',
          'log_out': 'Se déconnecter',
          'commands': 'Commandes',

          // Change language page
          'arabic': 'Arabe',
          'french': 'Français',
          'english': 'Anglais',

          // Change Password page
          'enter_current_password': 'Entrez votre mot de passe actuel',
          'enter_new_password': 'Entrez votre nouveau mot de passe',
          'retype_new_password': 'Retapez votre nouveau mot de passe',
          'existing_password': 'Mot de passe actuel',
          'new_password': 'Nouveau mot de passe',
          'retype_password': 'Retaper le mot de passe',
          'confirm_change': 'Confirmer le changement',

          // Entries commands page
          'entries_commands': 'Commandes d\'entrée',
          'search': 'Rechercher quelque chose',

          // Purchase orders page
          'purchase_orders': 'Bons d\'achat',

          // Invoices page
          'invoices': 'Factures',
        },
        'ar_MA': {
          // Login Page
          'welcome': 'مرحبًا بك في ستوكيفاي',
          'welcome_to': 'مرحبًا بك في',
          'stockify': 'ستوكيفاي',
          'login_with_email':
              'تسجيل الدخول إلى حسابك باستخدام البريد الإلكتروني',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'log_in': 'تسجيل الدخول',
          'forgot_password': ' هل نسيت كلمة المرور؟',
          'reset_password': 'إعادة تعيين كلمة المرور',
          'remember_me': 'تذكرنى',

          // Splash pages
          'splash_1_title': 'تتبع. تحليل. نجاح',
          'splash_1_phrase':
              'فتح قوة تتبع المخزون الدقيق. تقنين إجراءات الدخول والخروج بثقة.',
          'splash_2_title': 'جعل عمليات الأعمال أكثر سلاسة',
          'splash_2_phrase':
              'إدارة طلبات الشراء والفواتير بسهولة لتحقيق التشغيل المتسق.',
          'splash_3_title': 'منح طاقم إدارة المخزون تمكينًا أكبر',
          'splash_3_phrase':
              'تصور وتحليل بيانات المخزون بسلاسة، مما يمكّنك من اتخاذ قرارات مدروسة والارتقاء بأعمالك إلى آفاق أكبر.',
          'skip': 'تخطى',
          'next': 'التالي',
          'finish': 'إنهاء',

          // Home page
          'dashboard': 'لوحة التحكم',
          'entries_commands_to_treat': 'الأوامر الواردة للمعالجة',
          'exits_commands_to_treat': 'الأوامر الصادرة للمعالجة',
          'invoices_to_pay': 'الفواتير الواجب دفعها',
          'invoices_to_validate': 'الفواتير الواجب التحقق منها',
          'expired_articles': 'المواد منتهية الصلاحية',
          'articles_close_to_threshold': 'المواد قريبة من الحد الأدنى',
          'articles': 'المواد',
          'clients': 'العملاء',
          'suppliers': 'الموردين',
          'departments': 'الأقسام',
          'stocks': 'المخزونات',
          'companies': 'الشركات',
          'sites': 'المواقع',
          'banks': 'البنوك',
          'families': 'الفئات',
          'currencies': 'العملات',
          'services': 'الخدمات',

          // Settings page
          'general': 'عام',
          'account': 'حساب',
          'language': 'لغة A / أ',
          'about_us': 'معلومات عنا',
          'change_password': 'تغيير كلمة المرور',
          'sign_out': 'تسجيل الخروج',

          // Side bar & bottom bar
          'home': 'الصفحة الرئيسية',
          'notifications': 'الإشعارات',
          'settings': 'الإعدادات',
          'profil': 'الملف الشخصي',
          'entries': 'المدخلات',
          'exits': 'المخارج',
          'log_out': 'تسجيل الخروج',
          'commands': 'الطلبات',

          // Change language page
          'arabic': 'العربية',
          'french': 'الفرنسية',
          'english': 'الإنجليزية',

          // Change Password page
          'enter_current_password': 'أدخل كلمة المرور الحالية',
          'enter_new_password': 'أدخل كلمة المرور الجديدة',
          'retype_new_password': 'أعد كتابة كلمة المرور الجديدة',
          'existing_password': 'كلمة المرور الحالية',
          'new_password': 'كلمة المرور الجديدة',
          'retype_password': 'أعد كتابة كلمة المرور',
          'confirm_change': 'تأكيد التغيير',

          // Entries commands page
          'entries_commands': 'أوامر المدخلات',
          'search': 'البحث عن شيء',

          // Purchase orders page
          'purchase_orders': 'أوامر الشراء',

          // Invoices page
          'invoices': 'الفواتير',
        },
      };
}
