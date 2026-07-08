import 'package:flutter/material.dart';

// ==================== TRANSLATION ENGINE ====================
class L10n {
  static String locale = 'en';

  static final Map<String, Map<String, String>> _values = {
    'en': {
      'appTitle': 'Tuuka - Earn Now',
      'welcomeMsg': 'Welcome to Tuuka',
      'nameHint': 'Full Name',
      'phoneHint': 'Phone Number',
      'loginBtn': 'Login / Signup',
      'isSponsor': 'Login as Sponsor / Business',
      'tabChallenges': 'Challenges',
      'tabStats': 'My Stats',
      'tabProfile': 'Profile',
      'availableChallenges': 'Available Challenges',
      'reward': 'Reward',
      'sponsor': 'Sponsor',
      'type': 'Type',
      'instructions': 'Instructions',
      'submitProofBtn': 'Submit Proof & Earn',
      'submitProofTitle': 'Submit Proof',
      'proofHint': 'Describe your proof or paste link',
      'submitForReviewBtn': 'Submit for Review',
      'proofSubmittedMsg': '✅ Proof submitted! Waiting for approval.',
      'myStats': 'My Stats',
      'totalEarned': 'Total Earned',
      'mySubmissions': 'My Submissions',
      'noSubmissionsMsg': 'No submissions yet. Join a challenge!',
      'challengeLabel': 'Challenge',
      'userLabel': 'User',
      'sponsorHub': 'Sponsor Hub',
      'pendingApprovals': 'Pending Approvals',
      'newChallengeBtn': 'New Challenge',
      'approvedPaidMsg': 'Approved & Paid!',
      'noPendingMsg': 'No submissions yet.',
      'createChallengeTitle': 'Create Challenge',
      'titleHint': 'Challenge Title',
      'rewardHint': 'Reward (UGX)',
      'descHint': 'Instructions',
      'publishBtn': 'Publish Challenge',
      'createdMsg': 'Challenge Created!',
      'myProfile': 'My Profile',
      'payoutMethod': 'Payout Method (Mobile Money)',
      'momoHint': 'MTN/Airtel Number',
      'saveBtn': 'Save Payout Details',
      'savedMsg': 'MoMo Saved!',
      'logoutBtn': 'Logout',
      'language': 'Language / Olulimi',
      'english': 'English',
      'luganda': 'Luganda',
    },
    'lg': {
      'appTitle': 'Tuuka - Funa Ssente',
      'welcomeMsg': 'Tukutuse mu Tuuka',
      'nameHint': 'Erinnya Lyo Eryamatuufu',
      'phoneHint': 'Ennamba y\'essimu',
      'loginBtn': 'Yingira / Wewandiise',
      'isSponsor': 'Yingira nga Omusuubuzi / Kampuni',
      'tabChallenges': 'Emirimu',
      'tabStats': 'Ebikwata ku Nze',
      'tabProfile': 'Profailo',
      'availableChallenges': 'Emirimu Egiriwo',
      'reward': 'Empooza',
      'sponsor': 'Omuwandiisi',
      'type': 'Ekika',
      'instructions': 'Endagiriro',
      'submitProofBtn': 'Weereza Obujulizi Ofune',
      'submitProofTitle': 'Weereza Obujulizi',
      'proofHint': 'Nyweza obujulizi oba teeka link',
      'submitForReviewBtn': 'Weereza Okukakasibwa',
      'proofSubmittedMsg': '✅ Obujulizi buweereddwa! Tulindirira okukakasibwa.',
      'myStats': 'Ebikwata ku Nze',
      'totalEarned': 'Ssente Zonna Z\'Ofunye',
      'mySubmissions': 'Ebyo Nze Bye Naweereza',
      'noSubmissionsMsg': 'Tewali bintu by\'oyogeddeko. Ddira omulumu!',
      'challengeLabel': 'Omulumu',
      'userLabel': 'Omukozesa',
      'sponsorHub': 'Ekifo ky\'Omusuubuzi',
      'pendingApprovals': 'Ebikyasabibwa Okukakasibwa',
      'newChallengeBtn': 'Omulumu Omupya',
      'approvedPaidMsg': 'Kakasiddwa & Oliweereddwa!',
      'noPendingMsg': 'Tewali bintu by\'oyogeddeko.',
      'createChallengeTitle': 'Tandika Omulumu',
      'titleHint': 'Omutwe gw\'Omulumu',
      'rewardHint': 'Empooza (UGX)',
      'descHint': 'Endagiriro',
      'publishBtn': 'Tandika Omulumu',
      'createdMsg': 'Omulumu Gutandikiddwa!',
      'myProfile': 'Profailo Yanze',
      'payoutMethod': 'Enkola y\'Okusasula (Mobile Money)',
      'momoHint': 'Ennamba ya MTN/Airtel',
      'saveBtn': 'Bika Ebikwata ku Kusasula',
      'savedMsg': 'Ennamba Ebikiddwa!',
      'logoutBtn': 'Fuluma',
      'language': 'Olulimi / Language',
      'english': 'English',
      'luganda': 'Luganda',
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
  List<Challenge> challenges = [
    Challenge(id: '1', title: 'Share Tuuka on Twitter', sponsor: 'BrandBoost', reward: 50000, participants: 234, type: 'remote', description: 'Post a tweet with #TuukaApp and screenshot it.'),
    Challenge(id: '2', title: 'Visit Kampala Store', sponsor: 'ShopMax', reward: 30000, participants: 89, type: 'physical', description: 'Go to the ShopMax store on Kampala Rd and take a photo.'),
  ];
  List<Submission> submissions = [];

  void addUser(User user) => currentUser = user;
  void addChallenge(Challenge c) => challenges.add(c);
  void addSubmission(Submission s) => submissions.add(s);
  void approveSubmission(String id) {
    final sub = submissions.firstWhere((s) => s.id == id);
    sub.status = 'Approved';
  }
}

class User {
  final String name; final String phone; final String role; String momoNumber;
  User({required this.name, required this.phone, required this.role, this.momoNumber = ''});
}

class Challenge {
  final String id; final String title; final String sponsor; final int reward; final int participants; final String type; final String description;
  Challenge({required this.id, required this.title, required this.sponsor, required this.reward, required this.participants, required this.type, required this.description});
}

class Submission {
  final String id; final String challengeId; final String userId; final String proofText; String status;
  Submission({required this.id, required this.challengeId, required this.userId, required this.proofText, this.status = 'Pending'});
}

// ==================== MAIN APP ====================
void main() {
  runApp(const TuukaApp());
}

class TuukaApp extends StatefulWidget {
  const TuukaApp({super.key});
  @override
  State<TuukaApp> createState() => _TuukaAppState();
}

class _TuukaAppState extends State<TuukaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: L10n.t('appTitle'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: AppData().currentUser == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}

// ==================== 1. LOGIN SCREEN ====================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool isSponsor = false;

  void _login() {
    if (_nameCtrl.text.isEmpty || _phoneCtrl.text.isEmpty) return;
    AppData().addUser(User(name: _nameCtrl.text, phone: _phoneCtrl.text, role: isSponsor ? 'sponsor' : 'user'));
    setState(() {}); // Rebuild app to show Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(24), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.account_balance_wallet, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            Text(L10n.t('welcomeMsg'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(controller: _nameCtrl, decoration: InputDecoration(labelText: L10n.t('nameHint'), border: const OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _phoneCtrl, decoration: InputDecoration(labelText: L10n.t('phoneHint'), border: const OutlineInputBorder()), keyboardType: TextInputType.phone),
            const SizedBox(height: 16),
            Row(children: [
              Checkbox(value: isSponsor, onChanged: (v) => setState(() => isSponsor = v!)),
              Text(L10n.t('isSponsor')),
            ]),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)), child: Text(L10n.t('loginBtn'), style: const TextStyle(fontSize: 18))),
          ],
        )),
      ),
    );
  }
}

// ==================== 2. HOME SCREEN ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ChallengeListScreen(),
      AppData().currentUser!.role == 'sponsor' ? const SponsorDashboard() : const UserDashboard(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: L10n.t('tabChallenges')),
          BottomNavigationBarItem(icon: const Icon(Icons.dashboard), label: AppData().currentUser!.role == 'sponsor' ? L10n.t('sponsorHub') : L10n.t('tabStats')),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: L10n.t('tabProfile')),
        ],
      ),
    );
  }
}

// ==================== 3. CHALLENGE LIST ====================
class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('availableChallenges')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: AppData().challenges.length,
        itemBuilder: (context, i) {
          final c = AppData().challenges[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(c.type == 'remote' ? Icons.cloud : Icons.location_on, color: Colors.blue, size: 32),
              title: Text(c.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${c.sponsor} • UGX ${c.reward}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChallengeDetailScreen(challenge: c))),
            ),
          );
        },
      ),
    );
  }
}

// ==================== 4. CHALLENGE DETAIL & SUBMISSION ====================
class ChallengeDetailScreen extends StatelessWidget {
  final Challenge challenge;
  const ChallengeDetailScreen({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(challenge.title), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(color: Colors.blue[50], child: Padding(padding: const EdgeInsets.all(16), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L10n.t('reward'), style: const TextStyle(color: Colors.grey)),
                Text('UGX ${challenge.reward}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 8),
                Text('${L10n.t('sponsor')}: ${challenge.sponsor}'),
                Text('${L10n.t('type')}: ${challenge.type.toUpperCase()}'),
              ],
            ))),
            const SizedBox(height: 16),
            Text(L10n.t('instructions'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(challenge.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SubmitProofScreen(challenge: challenge))),
              icon: const Icon(Icons.upload),
              label: Text(L10n.t('submitProofBtn'), style: const TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)),
            )),
          ],
        ),
      ),
    );
  }
}

class SubmitProofScreen extends StatefulWidget {
  final Challenge challenge;
  const SubmitProofScreen({super.key, required this.challenge});
  @override
  State<SubmitProofScreen> createState() => _SubmitProofScreenState();
}

class _SubmitProofScreenState extends State<SubmitProofScreen> {
  final _proofCtrl = TextEditingController();

  void _submit() {
    if (_proofCtrl.text.isEmpty) return;
    AppData().addSubmission(Submission(
      id: DateTime.now().toString(),
      challengeId: widget.challenge.id,
      userId: AppData().currentUser!.name,
      proofText: _proofCtrl.text,
    ));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('proofSubmittedMsg')), backgroundColor: Colors.green));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('submitProofTitle')), backgroundColor: Colors.blue[900]),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${L10n.t('challengeLabel')}: ${widget.challenge.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(controller: _proofCtrl, maxLines: 5, decoration: InputDecoration(labelText: L10n.t('proofHint'), border: const OutlineInputBorder())),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _submit, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)), child: Text(L10n.t('submitForReviewBtn'))),
        ],
      )),
    );
  }
}

// ==================== 5. USER DASHBOARD ====================
class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    final mySubs = AppData().submissions.where((s) => s.userId == AppData().currentUser!.name).toList();
    final earned = mySubs.where((s) => s.status == 'Approved').length * 30000;

    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('myStats')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(color: Colors.green[50], child: Padding(padding: const EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(L10n.t('totalEarned'), style: const TextStyle(color: Colors.grey)),
              Text('UGX $earned', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ))),
          const SizedBox(height: 16),
          Text(L10n.t('mySubmissions'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(child: mySubs.isEmpty ? Center(child: Text(L10n.t('noSubmissionsMsg'))) : ListView.builder(
            itemCount: mySubs.length,
            itemBuilder: (context, i) {
              final s = mySubs[i];
              return Card(child: ListTile(
                title: Text('${L10n.t('challengeLabel')} #${s.challengeId}'),
                subtitle: Text(s.proofText),
                trailing: Text(s.status, style: TextStyle(color: s.status == 'Approved' ? Colors.green : Colors.orange, fontWeight: FontWeight.bold)),
              ));
            },
          )),
        ],
      )),
    );
  }
}

// ==================== 6. SPONSOR DASHBOARD ====================
class SponsorDashboard extends StatelessWidget {
  const SponsorDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('sponsorHub')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateChallengeScreen())), icon: const Icon(Icons.add), label: Text(L10n.t('newChallengeBtn'))),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(L10n.t('pendingApprovals'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(child: AppData().submissions.isEmpty ? Center(child: Text(L10n.t('noPendingMsg'))) : ListView.builder(
            itemCount: AppData().submissions.length,
            itemBuilder: (context, i) {
              final s = AppData().submissions[i];
              return Card(child: ListTile(
                title: Text('${L10n.t('userLabel')}: ${s.userId}'),
                subtitle: Text(s.proofText),
                trailing: s.status == 'Pending' ? IconButton(icon: const Icon(Icons.check_circle, color: Colors.green), onPressed: () {
                  AppData().approveSubmission(s.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('approvedPaidMsg'))));
                  (context as Element).markNeedsBuild();
                }) : Text(s.status, style: const TextStyle(color: Colors.green)),
              ));
            },
          )),
        ],
      )),
    );
  }
}

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});
  @override
  State<CreateChallengeScreen> createState() => _CreateChallengeScreenState();
}

class _CreateChallengeScreenState extends State<CreateChallengeScreen> {
  final _titleCtrl = TextEditingController();
  final _rewardCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  void _create() {
    if (_titleCtrl.text.isEmpty) return;
    AppData().addChallenge(Challenge(
      id: DateTime.now().toString(),
      title: _titleCtrl.text,
      sponsor: AppData().currentUser!.name,
      reward: int.tryParse(_rewardCtrl.text) ?? 0,
      participants: 0,
      type: 'remote',
      description: _descCtrl.text,
    ));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('createdMsg')), backgroundColor: Colors.green));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('createChallengeTitle'))),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        children: [
          TextField(controller: _titleCtrl, decoration: InputDecoration(labelText: L10n.t('titleHint'), border: const OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _rewardCtrl, decoration: InputDecoration(labelText: L10n.t('rewardHint'), border: const OutlineInputBorder()), keyboardType: TextInputType.number),
          const SizedBox(height: 16),
          TextField(controller: _descCtrl, maxLines: 3, decoration: InputDecoration(labelText: L10n.t('descHint'), border: const OutlineInputBorder())),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _create, child: Text(L10n.t('publishBtn')))),
        ],
      )),
    );
  }
}

// ==================== 7. PROFILE & LANGUAGE SCREEN ====================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _momoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = AppData().currentUser!;
    _momoCtrl.text = user.momoNumber;

    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('myProfile')), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 16),
          Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(user.phone, style: const TextStyle(color: Colors.grey)),
          Text('Role: ${user.role.toUpperCase()}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          const Divider(height: 32),
          
          // LANGUAGE SELECTOR
          Text(L10n.t('language'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: ChoiceChip(label: Text(L10n.t('english')), selected: L10n.locale == 'en', onSelected: (s) { if(s) { L10n.locale = 'en'; setState(() {}); } })),
              const SizedBox(width: 8),
              Expanded(child: ChoiceChip(label: Text(L10n.t('luganda')), selected: L10n.locale == 'lg', onSelected: (s) { if(s) { L10n.locale = 'lg'; setState(() {}); } })),
            ],
          ),
          const SizedBox(height: 24),

          Text(L10n.t('payoutMethod'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(controller: _momoCtrl, decoration: InputDecoration(labelText: L10n.t('momoHint'), border: const OutlineInputBorder(), prefixText: '+256 '), keyboardType: TextInputType.phone),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            user.momoNumber = _momoCtrl.text;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L10n.t('savedMsg')), backgroundColor: Colors.green));
          }, child: Text(L10n.t('saveBtn')))),
          const Spacer(),
          SizedBox(width: double.infinity, child: TextButton(onPressed: () {
            AppData().currentUser = null;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          }, child: Text(L10n.t('logoutBtn'), style: const TextStyle(color: Colors.red)))),
        ],
      )),
    );
  }
}