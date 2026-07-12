
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math'; 


// ==================== 1. ADVANCED TRANSLATION (4 LANGUAGES) ====================
class L10n {
  static String locale = 'en';
  static final Map<String, Map<String, String>> _v = {
    'en': {
      'app': 'Tuuka', 'explore': 'Explore', 'dashboard': 'Dashboard', 'profile': 'Profile',
      'admin': 'Admin Panel', 'phone': 'Phone Number', 'sendOtp': 'Send Code', 'verify': 'Verify',
      'name': 'Full Name', 'role': 'I am a...', 'user': 'Earner', 'sponsor': 'Sponsor',
      'finish': 'Complete Setup', 'join': 'Join Challenge', 'submit': 'Submit Proof',
      'success': 'Submitted Successfully!', 'earnings': 'Total Earnings', 'wallet': 'My Wallet',
      'withdraw': 'Withdraw', 'socials': 'Social Media', 'share': 'Share', 'demo': 'Quick Demo',
      'logout': 'Logout', 'lang': 'Language', 'darkMode': 'Dark Mode', 'notifications': 'Notifications',
      'achievements': 'Achievements', 'leaderboard': 'Leaderboard', 'referrals': 'Referrals',
      'settings': 'Settings', 'help': 'Help & Support', 'terms': 'Terms of Service',
      'privacy': 'Privacy Policy', 'search': 'Search Challenges', 'filter': 'Filter',
      'categories': 'Categories', 'nearby': 'Near Me', 'remote': 'Remote', 'physical': 'Physical',
      'reward': 'Reward', 'sponsor_name': 'Sponsor', 'instructions': 'Instructions',
      'description': 'Description', 'budget': 'Budget', 'participants': 'Participants',
      'deadline': 'Deadline', 'status': 'Status', 'pending': 'Pending', 'approved': 'Approved',
      'rejected': 'Rejected', 'completed': 'Completed', 'active': 'Active', 'paused': 'Paused',
      'create': 'Create Challenge', 'edit': 'Edit', 'delete': 'Delete', 'save': 'Save',
      'cancel': 'Cancel', 'confirm': 'Confirm', 'yes': 'Yes', 'no': 'No',
      'amount': 'Amount', 'ugx': 'UGX', 'momo': 'Mobile Money', 'airtel': 'Airtel Money',
      'transaction': 'Transaction', 'history': 'History', 'balance': 'Balance',
      'available': 'Available', 'processing': 'Processing', 'paid': 'Paid',
      'analytics': 'Analytics', 'revenue': 'Revenue', 'users': 'Users', 'challenges': 'Challenges',
      'submissions': 'Submissions', 'performance': 'Performance', 'insights': 'Insights',
      'welcome': 'Welcome to Tuuka', 'getStarted': 'Get Started', 'login': 'Login',
      'signup': 'Sign Up', 'forgotPassword': 'Forgot Password?', 'reset': 'Reset Password',
      'email': 'Email Address', 'password': 'Password', 'confirmPassword': 'Confirm Password',
      'dob': 'Date of Birth', 'gender': 'Gender', 'male': 'Male', 'female': 'Female',
      'location': 'Location', 'address': 'Address', 'city': 'City', 'country': 'Country',
      'upload': 'Upload', 'camera': 'Camera', 'gallery': 'Gallery', 'photo': 'Photo',
      'video': 'Video', 'document': 'Document', 'file': 'File', 'download': 'Download',
      'refresh': 'Refresh', 'loadMore': 'Load More', 'noData': 'No Data Available',
      'error': 'Error Occurred', 'retry': 'Retry', 'ok': 'OK', 'close': 'Close',
      'back': 'Back', 'next': 'Next', 'previous': 'Previous', 'done': 'Done',
      'skip': 'Skip', 'continue': 'Continue', 'apply': 'Apply', 'submit_now': 'Submit Now',
    },
    'lg': {
      'app': 'Tuuka', 'explore': 'Noonya', 'dashboard': 'Daashiboodi', 'profile': 'Profailo',
      'admin': 'Admin', 'phone': 'Ennamba y\'essimu', 'sendOtp': 'Weereza Koodi', 'verify': 'Kakasa',
      'name': 'Erinnya', 'role': 'Ndi...', 'user': 'Mufunizi', 'sponsor': 'Kampuni',
      'finish': 'Maliriza', 'join': 'Ddira', 'submit': 'Weereza', 'success': 'Biweereddwa!',
      'earnings': 'Ssente Zonna', 'wallet': 'Ekisawo', 'withdraw': 'Funa Ssente',
      'socials': 'Mitimbagano', 'share': 'Gabana', 'demo': 'Yingira Mangu', 'logout': 'Fuluma',
      'lang': 'Olulimi', 'darkMode': 'Ekizikiza', 'notifications': 'Obubaka',
      'achievements': 'Obuwanguzi', 'leaderboard': 'Abasinga', 'referrals': 'Abagenyi',
      'settings': 'Entegeka', 'help': 'Nyamba', 'terms': 'Embeera', 'privacy': 'Obukuumi',
      'search': 'Noonya', 'filter': 'Sengeka', 'categories': 'Ebika', 'nearby': 'Okumpi',
      'remote': 'Oku Wala', 'physical': 'Wano', 'reward': 'Empooza', 'sponsor_name': 'Omuwandiisi',
      'instructions': 'Endagiriro', 'description': 'Okutegeera', 'budget': 'Ssente',
      'participants': 'Abanonyi', 'deadline': 'Enkomerero', 'status': 'Mbeera',
      'pending': 'Birindirira', 'approved': 'Kakasiddwa', 'rejected': 'Kegaaniddwa',
      'completed': 'Kakomezeddwa', 'active': 'Biramu', 'paused': 'Biyimiriddwa',
      'create': 'Tandika', 'edit': 'Kyusa', 'delete': 'Gyawo', 'save': 'Bika',
      'cancel': 'Sazaamu', 'confirm': 'Kakasa', 'yes': 'We', 'no': 'Nedda',
      'amount': 'Omutindo', 'ugx': 'UGX', 'momo': 'MoMo', 'airtel': 'Airtel',
      'transaction': 'Ensonga', 'history': 'Ebyayita', 'balance': 'Kakasiddwa',
      'available': 'Kiriiwo', 'processing': 'Bikola', 'paid': 'Bisasuddwa',
      'analytics': 'Obunonyereza', 'revenue': 'Ssente', 'users': 'Abakozesa',
      'challenges': 'Emirimu', 'submissions': 'Ebiweereddwa', 'performance': 'Ddamu',
      'insights': 'Okutegeera', 'welcome': 'Tukutuse', 'getStarted': 'Tandika',
      'login': 'Yingira', 'signup': 'Wewandiise', 'forgotPassword': 'Weggayize?',
      'reset': 'Zzamu', 'email': 'Emeero', 'password': 'Kasumuluzo',
      'confirmPassword': 'Kakasa Kasumuluzo', 'dob': 'Olunaku', 'gender': 'Kika',
      'male': 'Musajja', 'female': 'Mukazi', 'location': 'Wali', 'address': 'Adiresi',
      'city': 'Kibuga', 'country': 'Gwanga', 'upload': 'Teeka', 'camera': 'Kamera',
      'gallery': 'Ebifaananyi', 'photo': 'Ekifaananyi', 'video': 'Vidiyo',
      'document': 'Kawandiiko', 'file': 'Fayiro', 'download': 'Tikula',
      'refresh': 'Ddamu', 'loadMore': 'Ongerako', 'noData': 'Tewali Data',
      'error': 'Kiremye', 'retry': 'Gezaako', 'ok': 'Kale', 'close': 'Ddamu',
      'back': 'Ddayo', 'next': 'Ddira', 'previous': 'Kyasooka', 'done': 'Kakomeza',
      'skip': 'Yitako', 'continue': 'Ddira', 'apply': 'Saba', 'submit_now': 'Weereza Kati',
    },
    'am': {
      'app': 'ቱካ', 'explore': 'ፈል', 'dashboard': 'ዳሽቦርድ', 'profile': 'መገለጫ',
      'admin': 'አስተዳር', 'phone': 'ስልክ ጥር', 'sendOtp': 'ኮድ ላክ', 'verify': 'አረጋግጥ',
      'name': 'ሙሉ ስም', 'role': 'እኔ...', 'user': 'ተቋሚ', 'sponsor': 'ስፖንሰር',
      'finish': 'ጨርስ', 'join': 'ተቀላቀል', 'submit': 'አስረ ላክ', 'success': 'ተል኷ል!',
      'earnings': 'ጠቅላላ ገቢ', 'wallet': 'ኪስ', 'withdraw': 'ውሰድ', 'socials': 'ማህበራዊ',
      'share': 'አጋራ', 'demo': 'ፈጣን መግቢያ', 'logout': 'ውጣ', 'lang': 'ንቋ',
      'darkMode': 'ጨለማ', 'notifications': 'ማሳወቂያዎች', 'achievements': 'ስኬቶች',
      'leaderboard': 'ሰንጠረዥ', 'referrals': 'ተጋባዥ', 'settings': 'ቅንብሮች',
      'help': 'እርዳታ', 'terms': 'ንቦች', 'privacy': 'ግላዊነት', 'search': 'ፈልግ',
      'filter': 'አጣራ', 'categories': 'ምድቦች', 'nearby': 'በአቅቢያ', 'remote': 'ቅ',
      'physical': 'አካላዊ', 'reward': 'ምንዳ', 'sponsor_name': 'ስፖንሰር',
      'instructions': 'መመያዎች', 'description': 'መግለጫ', 'budget': 'በጀት',
      'participants': 'ተታፊዎች', 'deadline': 'ጊዜ ገደብ', 'status': 'ሁኔታ',
      'pending': 'በጥበቃ', 'approved': 'ድቋል', 'rejected': 'ተቀብሏል',
      'completed': 'ተናቅቋል', 'active': 'ነቅቷል', 'paused': 'ቆሟል', 'create': 'ፍጠር',
      'edit': 'አስተካክል', 'delete': 'ርዝ', 'save': 'አስቀምጥ', 'cancel': 'ሰርዝ',
      'confirm': 'አረጋግጥ', 'yes': 'አዎ', 'no': 'አይ', 'amount': 'መጠን', 'ugx': 'UGX',
      'momo': 'ሞል ማኒ', 'airtel': 'አርቴል', 'transaction': 'ግብይት',
      'history': 'ታሪ', 'balance': 'ቀ ሂሳብ', 'available': 'ዝግጁ',
      'processing': 'በሂደት', 'paid': 'ተከፍሏል', 'analytics': 'ትንተና',
      'revenue': 'ገቢ', 'users': 'ተጠቃሚዎች', 'challenges': 'ፈተናዎች',
      'submissions': 'ማስረጃዎች', 'performance': 'አፈጻጸም', 'insights': 'ግንዛቤዎች',
      'welcome': 'እንኳን ደህና መጡ', 'getStarted': 'ምር', 'login': 'ባ',
      'signup': 'ተመዝግብ', 'forgotPassword': 'የስምምነት ቃል?', 'reset': 'እንደገና አስባ',
      'email': 'ሜይል', 'password': 'የስምምነት ቃል', 'confirmPassword': 'ያረጋግጡ',
      'dob': 'የልደት ቀን', 'gender': 'ጾታ', 'male': 'ወንድ', 'female': 'ሴት',
      'location': 'ቦታ', 'address': 'አድራሻ', 'city': 'ከተማ', 'country': 'አገር',
      'upload': 'ስቀም', 'camera': 'ካራ', 'gallery': 'ለሪ', 'photo': 'ፎቶ',
      'video': 'ቪዲዮ', 'document': 'ሰነድ', 'file': 'ፋይል', 'download': 'አውርድ',
      'refresh': 'አድስ', 'loadMore': 'ተጨማሪ', 'noData': 'ታ የለም',
      'error': 'ስህተት', 'retry': 'እንደገና ሞክር', 'ok': 'እሺ', 'close': 'ጋ',
      'back': 'ተመለስ', 'next': 'ጥል', 'previous': 'ደመ', 'done': 'ተናቅቋል',
      'skip': 'ዝለል', 'continue': 'ቀጥል', 'apply': 'ተግበር', 'submit_now': 'አሁን ክ',
    },
    'ti': {
      'app': 'ቱካ', 'explore': 'ድለ', 'dashboard': 'ዳሽቦርድ', 'profile': 'መለለዪ',
      'admin': 'ኣመራርሓ', 'phone': 'ቁጽ ስልኪ', 'sendOtp': 'ኮድ ስደድ', 'verify': 'ረጋግጽ',
      'name': 'ምሉእ ስም', 'role': 'ኣነ...', 'user': 'ተቃሚ', 'sponsor': 'ስፖንሰር',
      'finish': 'ወድእ', 'join': 'ተወሃሃ', 'submit': 'ምስር ስደድ', 'success': 'ተላኺኹ!',
      'earnings': 'ጠቕላላ ኣታ', 'wallet': 'ኪስ', 'withdraw': 'ውሰድ',
      'socials': 'ማበራዊ ሚድያ', 'share': 'ኣካፍል', 'demo': 'ልጡፍ መእተዊ',
      'logout': 'ውጻእ', 'lang': 'ቋንቋ', 'darkMode': 'ጸልማት',
      'notifications': 'ሓበታታት', 'achievements': 'ዓወታት', 'leaderboard': 'ሰንጠረዥ',
      'referrals': 'ተመመርቲ', 'settings': 'ቅንብራት', 'help': 'ሓዝ',
      'terms': 'ውዕላት', 'privacy': 'ስጉምቲ', 'search': 'ድለ', 'filter': 'ረግ',
      'categories': 'ምድባት', 'nearby': 'ብቐረባ', 'remote': 'ቕ',
      'physical': 'ኣካላዊ', 'reward': 'ምንዳ', 'sponsor_name': 'ስፖንሰር',
      'instructions': 'መምርሒታት', 'description': 'መግለጺ', 'budget': 'በጀት',
      'participants': 'ተሳተፍቲ', 'deadline': 'ዜ ደረት', 'status': 'ኩነታት',
      'pending': 'ብ ጽባ', 'approved': 'ጸቑ', 'rejected': 'ተነጺጉ',
      'completed': 'ተወዲኡ', 'active': 'ነፉ', 'paused': 'ው ኢሉ',
      'create': 'ፍጠር', 'edit': 'ኣርም', 'delete': 'ምሰስ', 'save': 'ዓቅብ',
      'cancel': 'ሰርዝ', 'confirm': 'ኣረጋግጽ', 'yes': 'እወ', 'no': 'ይፋልን',
      'amount': 'መጠን', 'ugx': 'UGX', 'momo': 'ሞቢል ኒ', 'airtel': 'ኣርቴል',
      'transaction': 'ስግግር', 'history': 'ታኽ', 'balance': 'ሪ ሒሳብ',
      'available': 'ድልው', 'processing': 'ኣብ ስራሕ', 'paid': 'ተኸፊሉ',
      'analytics': 'ትንተና', 'revenue': 'ታዊ', 'users': 'ተጠቀምቲ',
      'challenges': 'ፈተነታት', 'submissions': 'ምስክርነታት', 'performance': 'ኣፈጻጽማ',
      'insights': 'ርድኢታት', 'welcome': 'እንዕ ደሓን መጻእኩም',
      'getStarted': 'ጀምር', 'login': 'ቱ', 'signup': 'ተመዝገብ',
      'forgotPassword': 'ሓቲትካዮ?', 'reset': 'ጊምካ ኣእቱ', 'email': 'ኢመይል',
      'password': 'ሓለፋ', 'confirmPassword': 'ኣረጋግጽ', 'dob': 'ዕለት ልደት',
      'gender': 'ጾታ', 'male': 'ተባዕታይ', 'female': 'ኣንስተይቲ',
      'location': 'ቦ', 'address': 'ኣድሻ', 'city': 'ተማ', 'country': 'ገር',
      'upload': 'ስቀም', 'camera': 'ካራ', 'gallery': 'ለሪ', 'photo': 'ስእሊ',
      'video': 'ቪድዮ', 'document': 'ሰነድ', 'file': 'ፋይል', 'download': 'ኣውርድ',
      'refresh': 'ሓድሽ', 'loadMore': 'ተወሳኺ', 'noData': 'ዳታ የለን',
      'error': 'ጌጋ', 'retry': 'ደጊምካ ፈትን', 'ok': 'እሺ', 'close': 'ድሓን',
      'back': 'ተመለስ', 'next': 'ጽል', 'previous': 'ቅድሚ', 'done': 'ተዲኡ',
      'skip': 'ሓልፍ', 'continue': 'ቀጽል', 'apply': 'ተግብር', 'submit_now': 'ሕ ስደድ',
    },
  };
  static String t(String key) => _v[locale]?[key] ?? _v['en']![key] ?? key;
}

// ==================== 2. COMPREHENSIVE DATABASE ====================
class AppData {
  static final AppData _i = AppData._();
  factory AppData() => _i;
  AppData._();

  User? user;
  String otp = '', tempPhone = '';
  bool darkMode = false;
  List<String> notifications = [];

  // Mock Database
  List<User> users = [
    User(name: 'Demo User', phone: '+256711111111', role: 'user', momo: '0711111111', earnings: 150000),
    User(name: 'Demo Sponsor', phone: '+256722222222', role: 'sponsor', momo: '', earnings: 0),
    User(name: 'System Admin', phone: '+256708844136', role: 'admin', momo: '', earnings: 0),
    User(name: 'Test Earner', phone: '+256733333333', role: 'user', momo: '0733333333', earnings: 75000),
  ];

  List<Challenge> challenges = [
    Challenge(id: '1', title: 'Share Tuuka on Twitter', sponsor: 'BrandBoost', reward: 50000, type: 'remote', desc: 'Post a tweet with #TuukaApp', budget: 5000000, maxParticipants: 100, currentParticipants: 45, deadline: '2026-08-01', category: 'Social Media'),
    Challenge(id: '2', title: 'Visit Kampala Store', sponsor: 'ShopMax', reward: 30000, type: 'physical', desc: 'Take a photo at the store', budget: 2000000, maxParticipants: 50, currentParticipants: 23, deadline: '2026-07-30', category: 'Visit', location: 'Kampala Road'),
    Challenge(id: '3', title: 'Review New App', sponsor: 'TechHub', reward: 75000, type: 'remote', desc: 'Download and review for 5 mins', budget: 3000000, maxParticipants: 40, currentParticipants: 12, deadline: '2026-08-15', category: 'Review'),
    Challenge(id: '4', title: 'Product Survey', sponsor: 'Research Co', reward: 40000, type: 'remote', desc: 'Complete 10-minute survey', budget: 1500000, maxParticipants: 60, currentParticipants: 38, deadline: '2026-07-25', category: 'Survey'),
  ];

  List<Submission> subs = [];
  List<Transaction> transactions = [];
  Map<String, int> userAchievements = {};
  Map<String, int> referrals = {};

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('logged_phone');
    darkMode = prefs.getBool('dark_mode') ?? false;
    if (phone != null) {
      user = users.firstWhere((u) => u.phone == phone, orElse: () => users[0]);
    }
  }

  Future<void> login(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('logged_phone', phone);
    user = users.firstWhere((u) => u.phone == phone, orElse: () => users[0]);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('logged_phone');
    user = null;
  }

  Future<void> toggleDarkMode() async {
    darkMode = !darkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', darkMode);
  }

  void addNotification(String msg) {
    notifications.insert(0, msg);
    if (notifications.length > 50) notifications.removeLast();
  }

  void addAchievement(String userId, String achievement) {
    if (!userAchievements.containsKey(userId)) userAchievements[userId] = 0;
    userAchievements[userId] = userAchievements[userId]! + 1;
  }

  int getAchievementCount(String userId) => userAchievements[userId] ?? 0;
}

class User {
  final String name, phone, role;
  String momo, whatsapp, facebook, tiktok, instagram;
  int earnings, level, streak;
  double rating;
  List<String> badges;
  DateTime joinedAt;

  User({
    required this.name, required this.phone, required this.role,
    this.momo = '', this.whatsapp = '', this.facebook = '',
    this.tiktok = '', this.instagram = '', this.earnings = 0,
    this.level = 1, this.streak = 0, this.rating = 0.0,
    List<String>? badges, DateTime? joinedAt,
  }) : badges = badges ?? [], joinedAt = joinedAt ?? DateTime.now();
}

class Challenge {
  final String id, title, sponsor, desc, type, category;
  final int reward, budget, maxParticipants, currentParticipants;
  final String deadline, location;
  bool isActive;

  Challenge({
    required this.id, required this.title, required this.sponsor,
    required this.reward, required this.type, required this.desc,
    this.category = 'General', this.budget = 1000000,
    this.maxParticipants = 100, this.currentParticipants = 0,
    this.deadline = '', this.location = '', this.isActive = true,
  });
}

class Submission {
  final String id, challengeId, userId, proof;
  String status;
  DateTime submittedAt;
  String? reviewedBy;
  DateTime? reviewedAt;
  String? rejectionReason;

  Submission({
    required this.id, required this.challengeId, required this.userId,
    required this.proof, this.status = 'Pending',
    DateTime? submittedAt, this.reviewedBy, this.reviewedAt, this.rejectionReason,
  }) : submittedAt = submittedAt ?? DateTime.now();
}

class Transaction {
  final String id, userId, challengeId;
  final int amount;
  final String type; // earning, withdrawal, bonus
  final String status; // pending, completed, failed
  final DateTime createdAt;
  String? momoReference;

  Transaction({
    required this.id, required this.userId, required this.challengeId,
    required this.amount, required this.type, required this.status,
    DateTime? createdAt, this.momoReference,
  }) : createdAt = createdAt ?? DateTime.now();
}

// ==================== 3. MAIN APP ====================
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppData().init();
  runApp(const TuukaApp());
}

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuuka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: AppData().darkMode ? Brightness.dark : Brightness.light,
        ),
      ),
      home: AppData().user == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}

// ==================== 4. LOGIN SCREEN ====================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();

  void _sendOtp() {
    if (_phone.text.length < 10) return;
    AppData().tempPhone = _phone.text;
    AppData().otp = (Random().nextInt(9000) + 1000).toString();
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen()));
  }

  void _demoLogin(String phone) async {
    await AppData().login(phone);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.account_balance_wallet, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              Text(L10n.t('welcome'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              TextField(controller: _phone, decoration: InputDecoration(labelText: L10n.t('phone'), border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.phone)), keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _sendOtp, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)), child: Text(L10n.t('sendOtp'), style: const TextStyle(fontSize: 18))),
              const Divider(height: 40),
              Text(L10n.t('demo'), textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.center, children: [
                ActionChip(label: const Text('User'), onPressed: () => _demoLogin('+256711111111')),
                ActionChip(label: const Text('Sponsor'), onPressed: () => _demoLogin('+256722222222')),
                ActionChip(label: const Text('Admin'), backgroundColor: Colors.red[100], onPressed: () => _demoLogin('+256708844136')),
                ActionChip(label: const Text('Test'), onPressed: () => _demoLogin('+256733333333')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 5. OTP & SETUP SCREENS ====================
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otp = TextEditingController();
  String err = '';

  void _verify() {
    if (_otp.text == AppData().otp) {
      final exists = AppData().users.any((u) => u.phone == AppData().tempPhone);
      if (exists) { _finishLogin(AppData().tempPhone); }
      else { Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SetupScreen())); }
    } else { setState(() => err = 'Wrong code!'); }
  }

  void _finishLogin(String phone) async {
    await AppData().login(phone);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('verify'))),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: Colors.amber[100], padding: const EdgeInsets.all(12), child: Text(' Code: ${AppData().otp}', style: const TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            TextField(controller: _otp, decoration: InputDecoration(labelText: L10n.t('enterOtp'), errorText: err.isEmpty ? null : err), textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, letterSpacing: 8)),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _verify, child: Text(L10n.t('verify')))),
          ],
        ),
      ),
    );
  }
}

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});
  @override State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final _name = TextEditingController();
  String role = 'user';

  void _finish() async {
    if (_name.text.isEmpty) return;
    final newUser = User(name: _name.text, phone: AppData().tempPhone, role: role);
    AppData().users.add(newUser);
    await AppData().login(AppData().tempPhone);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('finish'))),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _name, decoration: InputDecoration(labelText: L10n.t('name'), border: const OutlineInputBorder())),
            const SizedBox(height: 20),
            Text(L10n.t('role')),
            Row(children: [
              Expanded(child: ChoiceChip(label: Text(L10n.t('user')), selected: role == 'user', onSelected: (_) => setState(() => role = 'user'))),
              const SizedBox(width: 8),
              Expanded(child: ChoiceChip(label: Text(L10n.t('sponsor')), selected: role == 'sponsor', onSelected: (_) => setState(() => role = 'sponsor'))),
            ]),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _finish, child: Text(L10n.t('finish')))),
          ],
        ),
      ),
    );
  }
}

// ==================== 6. HOME SCREEN WITH NAVIGATION ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    final u = AppData().user!;
    final screens = [
      const ExploreScreen(),
      u.role == 'admin' ? const AdminDash() : u.role == 'sponsor' ? const SponsorDash() : const UserDash(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.explore), label: L10n.t('explore')),
          NavigationDestination(icon: Icon(u.role == 'admin' ? Icons.admin_panel_settings : Icons.dashboard), label: u.role == 'admin' ? L10n.t('admin') : L10n.t('dashboard')),
          NavigationDestination(icon: const Icon(Icons.person), label: L10n.t('profile')),
        ],
      ),
    );
  }
}

// ==================== 7. EXPLORE SCREEN WITH SEARCH & FILTER ====================
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _search = '';
  String _filterType = 'all';
  String _category = 'all';

  List<Challenge> get filteredChallenges {
    return AppData().challenges.where((c) {
      final matchesSearch = c.title.toLowerCase().contains(_search.toLowerCase()) || c.sponsor.toLowerCase().contains(_search.toLowerCase());
      final matchesType = _filterType == 'all' || c.type == _filterType;
      final matchesCategory = _category == 'all' || c.category == _category;
      return matchesSearch && matchesType && matchesCategory && c.isActive;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.t('explore')),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Notifications: ${AppData().notifications.length}')));
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(labelText: L10n.t('search'), prefixIcon: const Icon(Icons.search), border: const OutlineInputBorder()),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                FilterChip(label: const Text('All'), selected: _filterType == 'all', onSelected: (_) => setState(() => _filterType = 'all')),
                const SizedBox(width: 8),
                FilterChip(label: const Text('Remote'), selected: _filterType == 'remote', onSelected: (_) => setState(() => _filterType = 'remote')),
                const SizedBox(width: 8),
                FilterChip(label: const Text('Physical'), selected: _filterType == 'physical', onSelected: (_) => setState(() => _filterType = 'physical')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredChallenges.length,
              itemBuilder: (c, i) {
                final ch = filteredChallenges[i];
                final progress = ch.currentParticipants / ch.maxParticipants;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ch.type == 'remote' ? Colors.blue[100] : Colors.orange[100],
                      child: Icon(ch.type == 'remote' ? Icons.cloud : Icons.location_on, color: ch.type == 'remote' ? Colors.blue : Colors.orange),
                    ),
                    title: Text(ch.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${ch.sponsor} • ${L10n.t('ugx')} ${ch.reward}'),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(value: progress, minHeight: 4),
                        Text('${ch.currentParticipants}/${ch.maxParticipants} ${L10n.t('participants')}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => ChallengeDetail(ch: ch))),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== 8. CHALLENGE DETAIL & SUBMISSION ====================
class ChallengeDetail extends StatelessWidget {
  final Challenge ch;
  const ChallengeDetail({super.key, required this.ch});

  void _join(BuildContext c) {
    Navigator.push(c, MaterialPageRoute(builder: (_) => SubmitScreen(ch: ch)));
  }

  @override
  Widget build(BuildContext context) {
    final progress = ch.currentParticipants / ch.maxParticipants;
    return Scaffold(
      appBar: AppBar(title: Text(ch.title), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(L10n.t('reward'), style: TextStyle(color: Colors.grey[600])),
                    Text('${L10n.t('ugx')} ${ch.reward}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)),
                    const SizedBox(height: 8),
                    Text('${L10n.t('sponsor_name')}: ${ch.sponsor}'),
                    Text('${L10n.t('type')}: ${ch.type.toUpperCase()}'),
                    Text('${L10n.t('category')}: ${ch.category}'),
                    if (ch.location.isNotEmpty) Text('${L10n.t('location')}: ${ch.location}'),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(value: progress),
                    Text('${ch.currentParticipants}/${ch.maxParticipants} ${L10n.t('participants')}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(L10n.t('instructions'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(ch.desc),
            const SizedBox(height: 16),
            Text('${L10n.t('deadline')}: ${ch.deadline}'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _join(context),
                icon: const Icon(Icons.upload),
                label: Text(L10n.t('join'), style: const TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitScreen extends StatefulWidget {
  final Challenge ch;
  const SubmitScreen({super.key, required this.ch});

  @override State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final _proof = TextEditingController();

  void _submit() {
    if (_proof.text.isEmpty) return;
    AppData().subs.add(Submission(
      id: DateTime.now().toString(),
      challengeId: widget.ch.id,
      userId: AppData().user!.name,
      proof: _proof.text,
    ));
    AppData().addNotification('New submission for ${widget.ch.title}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('success')), backgroundColor: Colors.green));
    Navigator.popUntil(context, (r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('submit'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _proof, maxLines: 5, decoration: InputDecoration(labelText: 'Describe proof or paste link', border: const OutlineInputBorder())),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _submit, child: Text(L10n.t('submit')))),
          ],
        ),
      ),
    );
  }
}

// ==================== 9. USER DASHBOARD ====================
class UserDash extends StatelessWidget {
  const UserDash({super.key});

  @override
  Widget build(BuildContext context) {
    final mySubs = AppData().subs.where((s) => s.userId == AppData().user!.name).toList();
    final earned = AppData().user!.earnings;
    final approved = mySubs.where((s) => s.status == 'Approved').length;
    final pending = mySubs.where((s) => s.status == 'Pending').length;

    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('dashboard')), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(L10n.t('earnings'), style: TextStyle(color: Colors.grey[600])),
                    Text('${L10n.t('ugx')} $earned', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2,
              children: [
                _statCard('Completed', '$approved', Colors.green),
                _statCard('Pending', '$pending', Colors.orange),
                _statCard('Level', '${AppData().user!.level}', Colors.blue),
                _statCard('Streak', '${AppData().user!.streak}🔥', Colors.red),
              ],
            ),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.centerLeft, child: Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8),
            ...mySubs.take(5).map((s) => Card(child: ListTile(
              title: Text('Challenge #${s.challengeId}'),
              subtitle: Text(s.proof),
              trailing: Text(s.status, style: TextStyle(color: s.status == 'Approved' ? Colors.green : s.status == 'Rejected' ? Colors.red : Colors.orange, fontWeight: FontWeight.bold)),
            ))),
          ],
        ),
      ),
    );
  }

  static Widget _statCard(String title, String val, Color col) {
    return Card(color: col.withOpacity(0.1), child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(val, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: col)), Text(title)])));
  }
}

// ==================== 10. SPONSOR DASHBOARD ====================
class SponsorDash extends StatelessWidget {
  const SponsorDash({super.key});

  @override
  Widget build(BuildContext context) {
    final myChallenges = AppData().challenges.where((c) => c.sponsor == AppData().user!.name).toList();
    final totalBudget = myChallenges.fold<int>(0, (sum, c) => sum + c.budget);
    final totalSpent = AppData().subs.where((s) => myChallenges.any((c) => c.id == s.challengeId && s.status == 'Approved')).length * 30000;

    return Scaffold(
      appBar: AppBar(title: Text('Sponsor Hub'), backgroundColor: Colors.blue),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _infoColumn('Active', '${myChallenges.where((c) => c.isActive).length}', Colors.blue),
                    _infoColumn('Budget', '${L10n.t('ugx')} ${(totalBudget / 1000000).toStringAsFixed(1)}M', Colors.green),
                    _infoColumn('Spent', '${L10n.t('ugx')} ${(totalSpent / 1000000).toStringAsFixed(1)}M', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.centerLeft, child: Text('Pending Approvals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8),
            ...AppData().subs.where((s) => s.status == 'Pending').map((s) => Card(
              child: ListTile(
                title: Text('User: ${s.userId}'),
                subtitle: Text(s.proof),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: const Icon(Icons.check_circle, color: Colors.green), onPressed: () {
                      s.status = 'Approved';
                      AppData().addNotification('Submission approved!');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Approved & Paid!'), backgroundColor: Colors.green));
                      (context as Element).markNeedsBuild();
                    }),
                    IconButton(icon: const Icon(Icons.cancel, color: Colors.red), onPressed: () {
                      s.status = 'Rejected';
                      AppData().addNotification('Submission rejected');
                      (context as Element).markNeedsBuild();
                    }),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  static Widget _infoColumn(String label, String val, Color col) {
    return Column(children: [Text(val, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: col)), Text(label)]);
  }
}

// ==================== 11. ADMIN DASHBOARD ====================
class AdminDash extends StatelessWidget {
  const AdminDash({super.key});

  @override
  Widget build(BuildContext context) {
    final totalUsers = AppData().users.length;
    final totalChallenges = AppData().challenges.length;
    final totalSubs = AppData().subs.length;
    final totalRevenue = totalSubs * 1500; // 5% of avg 30k reward

    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('admin')), backgroundColor: Colors.red),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              children: [
                _statCard('Total Users', '$totalUsers', Colors.blue),
                _statCard('Challenges', '$totalChallenges', Colors.green),
                _statCard('Submissions', '$totalSubs', Colors.orange),
                _statCard('Revenue (5%)', '${L10n.t('ugx')} $totalRevenue', Colors.purple),
              ],
            ),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: Text('System Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8),
            ...AppData().users.map((u) => Card(
              child: ListTile(
                leading: CircleAvatar(child: Text(u.name[0])),
                title: Text(u.name),
                subtitle: Text('${u.phone} • ${u.role.toUpperCase()}'),
                trailing: u.role == 'admin' ? const Icon(Icons.verified_user, color: Colors.red) : null,
              ),
            )),
          ],
        ),
      ),
    );
  }

  static Widget _statCard(String title, String val, Color col) {
    return Card(color: col.withOpacity(0.1), child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(val, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: col)), Text(title)])));
  }
}

// ==================== 12. PROFILE SCREEN WITH ALL SETTINGS ====================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _momo = TextEditingController(), _wa = TextEditingController(), _fb = TextEditingController(), _tiktok = TextEditingController(), _insta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final u = AppData().user!;
    _momo.text = u.momo;
    _wa.text = u.whatsapp;
    _fb.text = u.facebook;
    _tiktok.text = u.tiktok;
    _insta.text = u.instagram;

    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('profile')), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40))),
            const SizedBox(height: 16),
            Center(child: Text(u.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            Center(child: Text(u.phone, style: TextStyle(color: Colors.grey[600]))),
            Center(child: Text('Role: ${u.role.toUpperCase()}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
            const Divider(height: 32),

            // Language Selector
            Text(L10n.t('lang'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: ['en', 'lg', 'am', 'ti'].map((l) => ChoiceChip(
                label: Text(l.toUpperCase()),
                selected: L10n.locale == l,
                onSelected: (s) { if (s) { L10n.locale = l; setState(() {}); } },
              )).toList(),
            ),
            const SizedBox(height: 16),

            // Dark Mode Toggle
            SwitchListTile(
              title: Text(L10n.t('darkMode')),
              value: AppData().darkMode,
              onChanged: (_) async {
                await AppData().toggleDarkMode();
                setState(() {});
              },
            ),

            // Social Media
            Text(L10n.t('socials'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(controller: _wa, decoration: const InputDecoration(labelText: 'WhatsApp', border: OutlineInputBorder(), prefixIcon: Icon(Icons.chat))),
            const SizedBox(height: 8),
            TextField(controller: _fb, decoration: const InputDecoration(labelText: 'Facebook', border: OutlineInputBorder(), prefixIcon: Icon(Icons.facebook))),
            const SizedBox(height: 8),
            TextField(controller: _tiktok, decoration: const InputDecoration(labelText: 'TikTok', border: OutlineInputBorder(), prefixIcon: Icon(Icons.video_library))),
            const SizedBox(height: 8),
            TextField(controller: _insta, decoration: const InputDecoration(labelText: 'Instagram', border: OutlineInputBorder(), prefixIcon: Icon(Icons.camera_alt))),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: () {
                u.momo = _momo.text;
                u.whatsapp = _wa.text;
                u.facebook = _fb.text;
                u.tiktok = _tiktok.text;
                u.instagram = _insta.text;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Social media saved!'), backgroundColor: Colors.green));
              },
              child: const Text('Save Social Media'),
            )),
            const SizedBox(height: 24),

            // MoMo Setup
            Text(L10n.t('wallet'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(controller: _momo, decoration: const InputDecoration(labelText: 'MoMo Number', border: OutlineInputBorder(), prefixText: '+256 '), keyboardType: TextInputType.phone),
            const SizedBox(height: 16),

            // Achievements
            Text('Achievements: ${AppData().getAchievementCount(u.phone)} 🏆', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            // Logout
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await AppData().logout();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: Text(L10n.t('logout'), style: const TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}