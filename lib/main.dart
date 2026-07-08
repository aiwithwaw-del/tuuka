import 'package:flutter/material.dart';

// ==================== GLOBAL APP STATE (Simulates Database) ====================
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

// ==================== MODELS ====================
class User {
  final String name;
  final String phone;
  final String role; // 'user' or 'sponsor'
  String momoNumber;
  User({required this.name, required this.phone, required this.role, this.momoNumber = ''});
}

class Challenge {
  final String id;
  final String title;
  final String sponsor;
  final int reward;
  final int participants;
  final String type;
  final String description;
  Challenge({required this.id, required this.title, required this.sponsor, required this.reward, required this.participants, required this.type, required this.description});
}

class Submission {
  final String id;
  final String challengeId;
  final String userId;
  final String proofText;
  String status; // 'Pending', 'Approved', 'Rejected'
  Submission({required this.id, required this.challengeId, required this.userId, required this.proofText, this.status = 'Pending'});
}

// ==================== MAIN APP ====================
void main() {
  runApp(const TuukaApp());
}

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuuka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const LoginScreen(),
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
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
            const Text('Welcome to Tuuka', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _phoneCtrl, decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
            const SizedBox(height: 16),
            Row(children: [
              Checkbox(value: isSponsor, onChanged: (v) => setState(() => isSponsor = v!)),
              const Text('Login as Sponsor / Business'),
            ]),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)), child: const Text('Login / Signup', style: TextStyle(fontSize: 18))),
          ],
        )),
      ),
    );
  }
}

// ==================== 2. HOME SCREEN (Navigation) ====================
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Challenges'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: AppData().currentUser!.role == 'sponsor' ? 'Sponsor' : 'My Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
      appBar: AppBar(title: const Text('️ Available Challenges'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
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
                const Text('Reward', style: TextStyle(color: Colors.grey)),
                Text('UGX ${challenge.reward}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 8),
                Text('Sponsor: ${challenge.sponsor}'),
                Text('Type: ${challenge.type.toUpperCase()}'),
              ],
            ))),
            const SizedBox(height: 16),
            const Text('Instructions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(challenge.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SubmitProofScreen(challenge: challenge))),
              icon: const Icon(Icons.upload),
              label: const Text('Submit Proof & Earn', style: TextStyle(fontSize: 18)),
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
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ Proof submitted! Waiting for approval.'), backgroundColor: Colors.green));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Proof'), backgroundColor: Colors.blue[900]),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Challenge: ${widget.challenge.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const TextField(maxLines: 5, decoration: InputDecoration(labelText: 'Describe your proof or paste link', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _submit, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)), child: const Text('Submit for Review')),
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
    final earned = mySubs.where((s) => s.status == 'Approved').length * 30000; // Mock calc

    return Scaffold(
      appBar: AppBar(title: const Text(' My Stats'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(color: Colors.green[50], child: Padding(padding: const EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total Earned', style: TextStyle(color: Colors.grey)),
              Text('UGX $earned', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ))),
          const SizedBox(height: 16),
          const Text('My Submissions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(child: mySubs.isEmpty ? const Center(child: Text('No submissions yet. Join a challenge!')) : ListView.builder(
            itemCount: mySubs.length,
            itemBuilder: (context, i) {
              final s = mySubs[i];
              return Card(child: ListTile(
                title: Text('Challenge #${s.challengeId}'),
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
      appBar: AppBar(title: const Text(' Sponsor Hub'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateChallengeScreen())), icon: const Icon(Icons.add), label: const Text('New Challenge')),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pending Approvals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(child: AppData().submissions.isEmpty ? const Center(child: Text('No submissions yet.')) : ListView.builder(
            itemCount: AppData().submissions.length,
            itemBuilder: (context, i) {
              final s = AppData().submissions[i];
              return Card(child: ListTile(
                title: Text('User: ${s.userId}'),
                subtitle: Text(s.proofText),
                trailing: s.status == 'Pending' ? IconButton(icon: const Icon(Icons.check_circle, color: Colors.green), onPressed: () {
                  AppData().approveSubmission(s.id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Approved & Paid!')));
                  (context as Element).markNeedsBuild(); // Force refresh
                }) : Text(s.status, style: TextStyle(color: Colors.green)),
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
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Challenge Created!'), backgroundColor: Colors.green));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Challenge')),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        children: [
          TextField(controller: _titleCtrl, decoration: const InputDecoration(labelText: 'Challenge Title', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _rewardCtrl, decoration: const InputDecoration(labelText: 'Reward (UGX)', border: OutlineInputBorder()), keyboardType: TextInputType.number),
          const SizedBox(height: 16),
          TextField(controller: _descCtrl, maxLines: 3, decoration: const InputDecoration(labelText: 'Instructions', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _create, child: const Text('Publish Challenge'))),
        ],
      )),
    );
  }
}

// ==================== 7. PROFILE SCREEN ====================
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
      appBar: AppBar(title: const Text(' My Profile'), backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 16),
          Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(user.phone, style: const TextStyle(color: Colors.grey)),
          Text('Role: ${user.role.toUpperCase()}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          const Divider(height: 32),
          const Text('Payout Method (Mobile Money)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(controller: _momoCtrl, decoration: const InputDecoration(labelText: 'MTN/Airtel Number', border: OutlineInputBorder(), prefixText: '+256 '), keyboardType: TextInputType.phone),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            user.momoNumber = _momoCtrl.text;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('MoMo Saved!'), backgroundColor: Colors.green));
          }, child: const Text('Save Payout Details'))),
          const Spacer(),
          SizedBox(width: double.infinity, child: TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())), child: const Text('Logout', style: TextStyle(color: Colors.red)))),
        ],
      )),
    );
  }
}