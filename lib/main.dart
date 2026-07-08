import 'package:flutter/material.dart';
import 'dart:math';

// ==================== TRANSLATION ENGINE ====================
class L10n {
  static String locale = 'en';
  static final Map<String, Map<String, String>> _values = {
    'en': {
      'appTitle': 'Tuuka', 'explore': 'Explore', 'dashboard': 'Dashboard', 'profile': 'Profile',
      'availChallenges': 'Available Challenges', 'reward': 'Reward', 'sponsor': 'Sponsor', 'instructions': 'Instructions',
      'joinBtn': 'Join Challenge', 'loginToJoin': 'Please login to join this challenge and earn rewards.',
      'loginRequired': 'Login Required', 'loginNow': 'Login Now', 'guestMode': 'Guest Mode',
      'enterPhone': 'Enter your phone number', 'phoneHint': '+256 7...', 'sendOtp': 'Send OTP Code',
      'enterOtp': 'Enter the 4-digit code sent to your phone', 'otpHint': '1 2 3 4', 'verifyOtp': 'Verify & Continue',
      'wrongOtp': 'Wrong code! Try again.', 'simulatedOtp': '📱 Simulated SMS: Your code is ',
      'setupProfile': 'Setup Your Profile', 'nameHint': 'Full Name', 'selectRole': 'I am a...',
      'roleUser': 'Earner (User)', 'roleSponsor': 'Business (Sponsor)', 'finishSetup': 'Finish Setup',
      'submitProof': 'Submit Proof', 'proofHint': 'Describe your proof or paste link', 'submitBtn': 'Submit for Review',
      'successMsg': '✅ Submitted! Waiting for approval.', 'myStats': 'My Dashboard', 'totalEarned': 'Total Earned',
      'mySubs': 'My Submissions', 'noSubs': 'No submissions yet. Join a challenge!', 'sponsorHub': 'Sponsor Hub',
      'pending': 'Pending Approvals', 'newChallenge': 'New Challenge', 'approvedMsg': 'Approved & Paid!',
      'createTitle': 'Create Challenge', 'titleHint': 'Challenge Title', 'rewardHint': 'Reward (UGX)',
      'descHint': 'Instructions', 'publishBtn': 'Publish', 'createdMsg': 'Challenge Created!',
      'myProfile': 'My Profile', 'payout': 'Payout Method (MoMo)', 'momoHint': 'MTN/Airtel Number',
      'saveBtn': 'Save Details', 'savedMsg': 'Saved!', 'logout': 'Logout', 'language': 'Language',
      'english': 'English', 'luganda': 'Luganda', 'loginToAccess': 'Please login to access this feature.',
    },
    'lg': {
      'appTitle': 'Tuuka', 'explore': 'Noonya', 'dashboard': 'Daashiboodi', 'profile': 'Profailo',
      'availChallenges': 'Emirimu Egiriwo', 'reward': 'Empooza', 'sponsor': 'Omuwandiisi', 'instructions': 'Endagiriro',
      'joinBtn': 'Ddira Omulumu', 'loginToJoin': 'Nsaba oyingire okusobola okuddira omulumu guno.',
      'loginRequired': 'Oyetaaga Okuyingira', 'loginNow': 'Yingira Kati', 'guestMode': 'Omuyingizi',
      'enterPhone': 'Teeka ennamba y\'essimu', 'phoneHint': '+256 7...', 'sendOtp': 'Weereza Koodi',
      'enterOtp': 'Teeka koodi ya digito 4 eweereddwa', 'otpHint': '1 2 3 4', 'verifyOtp': 'Kakasa Ddayo',
      'wrongOtp': 'Koodi enkyamu! Gezaako nate.', 'simulatedOtp': '📱 Obubaka: Koodi yo ye ',
      'setupProfile': 'Teekawo Profailo', 'nameHint': 'Erinnya Eryamatuufu', 'selectRole': 'Ndi...',
      'roleUser': 'Mufunizi (User)', 'roleSponsor': 'Kampuni (Sponsor)', 'finishSetup': 'Maliriza',
      'submitProof': 'Weereza Obujulizi', 'proofHint': 'Nyweza obujulizi oba teeka link', 'submitBtn': 'Weereza',
      'successMsg': '✅ Biweereddwa! Tulindirira okukakasibwa.', 'myStats': 'Daashiboodi Yanze', 'totalEarned': 'Ssente Zonna',
      'mySubs': 'Ebyo Nze Bye Naweereza', 'noSubs': 'Tewali bintu by\'oyogeddeko. Ddira omulumu!', 'sponsorHub': 'Ekifo ky\'Omusuubuzi',
      'pending': 'Ebikyasabibwa Okukakasibwa', 'newChallenge': 'Omulumu Omupya', 'approvedMsg': 'Kakasiddwa & Oliweereddwa!',
      'createTitle': 'Tandika Omulumu', 'titleHint': 'Omutwe gw\'Omulumu', 'rewardHint': 'Empooza (UGX)',
      'descHint': 'Endagiriro', 'publishBtn': 'Tandika', 'createdMsg': 'Omulumu Gutandikiddwa!',
      'myProfile': 'Profailo Yanze', 'payout': 'Enkola y\'Okusasula (MoMo)', 'momoHint': 'Ennamba ya MTN/Airtel',
      'saveBtn': 'Bika', 'savedMsg': 'Ebikiddwa!', 'logout': 'Fuluma', 'language': 'Olulimi',
      'english': 'English', 'luganda': 'Luganda', 'loginToAccess': 'Nsaba oyingire okusobola okulaba kino.',
    },
  };
  static String t(String key) => _values[locale]?[key] ?? _values['en']![key] ?? key;
}

// ==================== APP STATE & MODELS ====================
class AppData {
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  User? currentUser;
  String generatedOtp = '';
  String tempPhone = '';
  VoidCallback? pendingAction; // Remembers what to do after login

  List<Challenge> challenges = [
    Challenge(id: '1', title: 'Share Tuuka on Twitter', sponsor: 'BrandBoost', reward: 50000, participants: 234, type: 'remote', description: 'Post a tweet with #TuukaApp and screenshot it.'),
    Challenge(id: '2', title: 'Visit Kampala Store', sponsor: 'ShopMax', reward: 30000, participants: 89, type: 'physical', description: 'Go to the ShopMax store on Kampala Rd and take a photo.'),
  ];
  List<Submission> submissions = [];

  void login(User user) { currentUser = user; }
  void logout() { currentUser = null; pendingAction = null; }
  void addChallenge(Challenge c) => challenges.add(c);
  void addSubmission(Submission s) => submissions.add(s);
  void approveSubmission(String id) { submissions.firstWhere((s) => s.id == id).status = 'Approved'; }
}

class User { final String name; final String phone; final String role; String momoNumber; User({required this.name, required this.phone, required this.role, this.momoNumber = ''}); }
class Challenge { final String id; final String title; final String sponsor; final int reward; final int participants; final String type; final String description; Challenge({required this.id, required this.title, required this.sponsor, required this.reward, required this.participants, required this.type, required this.description}); }
class Submission { final String id; final String challengeId; final String userId; final String proofText; String status; Submission({required this.id, required this.challengeId, required this.userId, required this.proofText, this.status = 'Pending'}); }

// ==================== MAIN APP ====================
void main() => runApp(const TuukaApp());

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});
  @override Widget build(BuildContext context) {
    return MaterialApp(title: L10n.t('appTitle'), debugShowCheckedModeBanner: false, theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false), home: const HomeScreen());
  }
}

// ==================== HOME SCREEN (List First!) ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override Widget build(BuildContext context) {
    final isLoggedIn = AppData().currentUser != null;
    final user = AppData().currentUser;

    // Tab 0: Always Challenge List (Guest or Logged In)
    // Tab 1: Dashboard (Locked if guest)
    // Tab 2: Profile (Locked if guest)
    final screens = [
      const ChallengeListScreen(),
      isLoggedIn ? (user!.role == 'sponsor' ? const SponsorDashboard() : const UserDashboard()) : const LoginRequiredScreen(featureName: 'Dashboard'),
      isLoggedIn ? const ProfileScreen() : const LoginRequiredScreen(featureName: 'Profile'),
    ];

    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.explore), label: L10n.t('explore')),
          BottomNavigationBarItem(icon: const Icon(Icons.dashboard), label: user?.role == 'sponsor' ? L10n.t('sponsorHub') : L10n.t('dashboard')),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: L10n.t('profile')),
        ],
      ),
    );
  }
}

// ==================== LOGIN REQUIRED PLACEHOLDER ====================
class LoginRequiredScreen extends StatelessWidget {
  final String featureName;
  const LoginRequiredScreen({super.key, required this.featureName});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(featureName), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.lock_outline, size: 80, color: Colors.grey),
        const SizedBox(height: 20),
        Text('$featureName is locked', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(L10n.t('loginToAccess'), textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 30),
        ElevatedButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PhoneLoginScreen())), icon: const Icon(Icons.login), label: Text(L10n.t('loginNow')), style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15))),
      ]))),
    );
  }
}

// ==================== 1. PHONE LOGIN SCREEN ====================
class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});
  @override State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}
class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _phoneCtrl = TextEditingController();
  void _sendOtp() {
    if (_phoneCtrl.text.length < 10) return;
    AppData().tempPhone = _phoneCtrl.text;
    AppData().generatedOtp = (Random().nextInt(9000) + 1000).toString();
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpVerificationScreen()));
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('loginRequired')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Icon(Icons.lock_outline, size: 80, color: Colors.blue), const SizedBox(height: 20),
        Text(L10n.t('enterPhone'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), const SizedBox(height: 40),
        TextField(controller: _phoneCtrl, decoration: InputDecoration(labelText: L10n.t('phoneHint'), border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.phone)), keyboardType: TextInputType.phone), const SizedBox(height: 24),
        ElevatedButton(onPressed: _sendOtp, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)), child: Text(L10n.t('sendOtp'), style: const TextStyle(fontSize: 18))),
      ]))),
    );
  }
}

// ==================== 2. OTP VERIFICATION SCREEN ====================
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  @override State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpCtrl = TextEditingController(); String _error = '';
  void _verify() {
    if (_otpCtrl.text == AppData().generatedOtp) {
      // Check if user exists (mock: if name is empty, they are new)
      // For simplicity, we always go to profile setup if they haven't set a name yet.
      // We'll use a temporary flag in AppData if needed, but let's just go to ProfileSetup.
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileSetupScreen()));
    } else { setState(() => _error = L10n.t('wrongOtp')); }
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('verifyOtp')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Icon(Icons.sms, size: 60, color: Colors.green), const SizedBox(height: 20),
        Text(L10n.t('enterOtp'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)), const SizedBox(height: 10),
        Container(color: Colors.amber[100], padding: const EdgeInsets.all(12), child: Text('${L10n.t('simulatedOtp')}${AppData().generatedOtp}', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))), const SizedBox(height: 20),
        TextField(controller: _otpCtrl, decoration: InputDecoration(labelText: L10n.t('otpHint'), border: const OutlineInputBorder(), errorText: _error.isEmpty ? null : _error), keyboardType: TextInputType.number, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, letterSpacing: 8)), const SizedBox(height: 24),
        ElevatedButton(onPressed: _verify, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)), child: Text(L10n.t('verifyOtp'), style: const TextStyle(fontSize: 18))),
      ]))),
    );
  }
}

// ==================== 3. PROFILE SETUP SCREEN ====================
class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});
  @override State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}
class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _nameCtrl = TextEditingController(); String _selectedRole = 'user';
  void _finish() {
    if (_nameCtrl.text.isEmpty) return;
    AppData().login(User(name: _nameCtrl.text, phone: AppData().tempPhone, role: _selectedRole));
    
    // Execute pending action (e.g., joining a challenge)
    if (AppData().pendingAction != null) {
      AppData().pendingAction!();
      AppData().pendingAction = null;
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('setupProfile')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(24), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(height: 40),
        TextField(controller: _nameCtrl, decoration: InputDecoration(labelText: L10n.t('nameHint'), border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.person))), const SizedBox(height: 24),
        Text(L10n.t('selectRole'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), const SizedBox(height: 12),
        Row(children: [
          Expanded(child: ChoiceChip(label: Text(L10n.t('roleUser')), selected: _selectedRole == 'user', onSelected: (s) => setState(() => _selectedRole = 'user'))),
          const SizedBox(width: 8),
          Expanded(child: ChoiceChip(label: Text(L10n.t('roleSponsor')), selected: _selectedRole == 'sponsor', onSelected: (s) => setState(() => _selectedRole = 'sponsor'))),
        ]), const Spacer(),
        ElevatedButton(onPressed: _finish, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)), child: Text(L10n.t('finishSetup'), style: const TextStyle(fontSize: 18))),
      ]))),
    );
  }
}

// ==================== 4. CHALLENGE LIST (Guest Access) ====================
class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('availChallenges')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: ListView.builder(padding: const EdgeInsets.all(12), itemCount: AppData().challenges.length, itemBuilder: (context, i) {
        final c = AppData().challenges[i];
        return Card(margin: const EdgeInsets.only(bottom: 12), child: ListTile(
          leading: Icon(c.type == 'remote' ? Icons.cloud : Icons.location_on, color: Colors.blue, size: 32),
          title: Text(c.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${c.sponsor} • UGX ${c.reward}'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChallengeDetailScreen(challenge: c))),
        ));
      }),
    );
  }
}

// ==================== 5. CHALLENGE DETAIL & SUBMISSION ====================
class ChallengeDetailScreen extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetailScreen({super.key, required this.challenge});

  void _handleJoin(BuildContext context) {
    if (AppData().currentUser == null) {
      // Save the action to execute after login
      AppData().pendingAction = () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmitProofScreen(challenge: challenge)));
      };
      Navigator.push(context, MaterialPageRoute(builder: (_) => const PhoneLoginScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SubmitProofScreen(challenge: challenge)));
    }
  }

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(challenge.title), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(color: Colors.blue[50], child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(L10n.t('reward'), style: const TextStyle(color: Colors.grey)),
          Text('UGX ${challenge.reward}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)), const SizedBox(height: 8),
          Text('${L10n.t('sponsor')}: ${challenge.sponsor}'), Text('${L10n.t('instructions')}:'), const SizedBox(height: 4), Text(challenge.description),
        ]))), const SizedBox(height: 24),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => _handleJoin(context), icon: const Icon(Icons.upload), label: Text(L10n.t('joinBtn'), style: const TextStyle(fontSize: 18)), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)))),
      ])),
    );
  }
}

class SubmitProofScreen extends StatefulWidget {
  final Challenge challenge;
  const SubmitProofScreen({super.key, required this.challenge});
  @override State<SubmitProofScreen> createState() => _SubmitProofScreenState();
}
class _SubmitProofScreenState extends State<SubmitProofScreen> {
  final _proofCtrl = TextEditingController();
  void _submit() {
    if (_proofCtrl.text.isEmpty) return;
    AppData().addSubmission(Submission(id: DateTime.now().toString(), challengeId: widget.challenge.id, userId: AppData().currentUser!.name, proofText: _proofCtrl.text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('successMsg')), backgroundColor: Colors.green));
    Navigator.popUntil(context, (route) => route.isFirst);
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('submitProof')), backgroundColor: Colors.blue[900]),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('${L10n.t('sponsor')}: ${widget.challenge.sponsor}', style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 16),
        TextField(controller: _proofCtrl, maxLines: 5, decoration: InputDecoration(labelText: L10n.t('proofHint'), border: const OutlineInputBorder())), const SizedBox(height: 24),
        ElevatedButton(onPressed: _submit, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)), child: Text(L10n.t('submitBtn'))),
      ])),
    );
  }
}

// ==================== 6. DASHBOARDS ====================
class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});
  @override Widget build(BuildContext context) {
    final mySubs = AppData().submissions.where((s) => s.userId == AppData().currentUser!.name).toList();
    final earned = mySubs.where((s) => s.status == 'Approved').length * 30000;
    return Scaffold(appBar: AppBar(title: Text(L10n.t('myStats')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(color: Colors.green[50], child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(L10n.t('totalEarned'), style: const TextStyle(color: Colors.grey)), Text('UGX $earned', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)),
        ]))), const SizedBox(height: 16),
        Text(L10n.t('mySubs'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Expanded(child: mySubs.isEmpty ? Center(child: Text(L10n.t('noSubs'))) : ListView.builder(itemCount: mySubs.length, itemBuilder: (context, i) {
          final s = mySubs[i];
          return Card(child: ListTile(title: Text('Challenge #${s.challengeId}'), subtitle: Text(s.proofText), trailing: Text(s.status, style: TextStyle(color: s.status == 'Approved' ? Colors.green : Colors.orange, fontWeight: FontWeight.bold))));
        })),
      ])),
    );
  }
}

class SponsorDashboard extends StatelessWidget {
  const SponsorDashboard({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('sponsorHub')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateChallengeScreen())), icon: const Icon(Icons.add), label: Text(L10n.t('newChallenge'))),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(L10n.t('pending'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Expanded(child: AppData().submissions.isEmpty ? Center(child: Text(L10n.t('noSubs'))) : ListView.builder(itemCount: AppData().submissions.length, itemBuilder: (context, i) {
          final s = AppData().submissions[i];
          return Card(child: ListTile(title: Text('${L10n.t('roleUser')}: ${s.userId}'), subtitle: Text(s.proofText), trailing: s.status == 'Pending' ? IconButton(icon: const Icon(Icons.check_circle, color: Colors.green), onPressed: () { AppData().approveSubmission(s.id); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('approvedMsg')))); (context as Element).markNeedsBuild(); }) : Text(s.status, style: const TextStyle(color: Colors.green))));
        })),
      ])),
    );
  }
}

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});
  @override State<CreateChallengeScreen> createState() => _CreateChallengeScreenState();
}
class _CreateChallengeScreenState extends State<CreateChallengeScreen> {
  final _titleCtrl = TextEditingController(); final _rewardCtrl = TextEditingController(); final _descCtrl = TextEditingController();
  void _create() {
    if (_titleCtrl.text.isEmpty) return;
    AppData().addChallenge(Challenge(id: DateTime.now().toString(), title: _titleCtrl.text, sponsor: AppData().currentUser!.name, reward: int.tryParse(_rewardCtrl.text) ?? 0, participants: 0, type: 'remote', description: _descCtrl.text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('createdMsg')), backgroundColor: Colors.green));
    Navigator.pop(context);
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.t('createTitle'))),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
        TextField(controller: _titleCtrl, decoration: InputDecoration(labelText: L10n.t('titleHint'), border: const OutlineInputBorder())), const SizedBox(height: 16),
        TextField(controller: _rewardCtrl, decoration: InputDecoration(labelText: L10n.t('rewardHint'), border: const OutlineInputBorder()), keyboardType: TextInputType.number), const SizedBox(height: 16),
        TextField(controller: _descCtrl, maxLines: 3, decoration: InputDecoration(labelText: L10n.t('descHint'), border: const OutlineInputBorder())), const SizedBox(height: 24),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _create, child: Text(L10n.t('publishBtn')))),
      ])),
    );
  }
}

// ==================== 7. PROFILE & SETTINGS ====================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final _momoCtrl = TextEditingController();
  @override Widget build(BuildContext context) {
    final user = AppData().currentUser!; _momoCtrl.text = user.momoNumber;
    return Scaffold(appBar: AppBar(title: Text(L10n.t('myProfile')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)), const SizedBox(height: 16),
        Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text(user.phone, style: const TextStyle(color: Colors.grey)),
        Text('Role: ${user.role.toUpperCase()}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)), const Divider(height: 32),
        Text(L10n.t('language'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), const SizedBox(height: 8),
        Row(children: [
          Expanded(child: ChoiceChip(label: Text(L10n.t('english')), selected: L10n.locale == 'en', onSelected: (s) { if(s) { L10n.locale = 'en'; setState(() {}); } })),
          const SizedBox(width: 8),
          Expanded(child: ChoiceChip(label: Text(L10n.t('luganda')), selected: L10n.locale == 'lg', onSelected: (s) { if(s) { L10n.locale = 'lg'; setState(() {}); } })),
        ]), const SizedBox(height: 24),
        Text(L10n.t('payout'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), const SizedBox(height: 8),
        TextField(controller: _momoCtrl, decoration: InputDecoration(labelText: L10n.t('momoHint'), border: const OutlineInputBorder(), prefixText: '+256 '), keyboardType: TextInputType.phone), const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { user.momoNumber = _momoCtrl.text; ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('savedMsg')), backgroundColor: Colors.green)); }, child: Text(L10n.t('saveBtn')))),
        const Spacer(),
        SizedBox(width: double.infinity, child: TextButton(onPressed: () { AppData().logout(); Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())); }, child: Text(L10n.t('logout'), style: const TextStyle(color: Colors.red)))),
      ])),
    );
  }
}