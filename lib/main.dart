import 'package:flutter/material.dart';

void main() {
  runApp(const TuukaApp());
}

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuuna',
      debugShowCheckedModeBanner: false, // Faster
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false, // Faster rendering
        fontFamily: 'Roboto', // Default font - faster
      ),
      home: const HomeScreen(),
    );
  }
}

// ==================== OPTIMIZED HOME SCREEN ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Pre-load screens
  static const List<Widget> _screens = <Widget>[
    ChallengeScreen(),
    UserDashboard(),
    ProgressScreen(),
    SocialMediaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Stats'),
          NavigationDestination(icon: Icon(Icons.track_changes_outlined), selectedIcon: Icon(Icons.track_changes), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.share_outlined), selectedIcon: Icon(Icons.share), label: 'Connect'),
        ],
      ),
    );
  }
}

// ==================== OPTIMIZED CHALLENGE SCREEN ====================
class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  String _selectedFilter = 'All';
  
  // Static data - in real app, load from API
  static const List<Map<String, dynamic>> _challenges = <Map<String, dynamic>>[
    <String, dynamic>{'title': 'Share Tuuka on Twitter', 'sponsor': 'BrandBoost', 'reward': 50000, 'participants': 234, 'type': 'remote'},
    <String, dynamic>{'title': 'Visit Kampala Store', 'sponsor': 'ShopMax', 'reward': 30000, 'participants': 89, 'type': 'physical'},
    <String, dynamic>{'title': 'Take Photo at Restaurant', 'sponsor': 'Tasty Bites', 'reward': 25000, 'participants': 156, 'type': 'physical'},
    <String, dynamic>{'title': 'Video Review', 'sponsor': 'TechHub', 'reward': 75000, 'participants': 67, 'type': 'remote'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⛏️ Tuuka'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0, // Remove shadow - faster
      ),
      body: Column(
        children: <Widget>[
          // Simplified Filter
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <String>['All', 'Remote', 'Physical'].map<Widget>((String filter) {
                final bool isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          
          // Optimized List
          Expanded(
            child: ListView.builder(
              itemCount: _challenges.length,
              padding: const EdgeInsets.all(8),
              addAutomaticKeepAlives: true, // Cache screens
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> challenge = _challenges[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(
                      challenge['type'] == 'remote' ? Icons.cloud : Icons.location_on,
                      color: challenge['type'] == 'remote' ? Colors.blue : Colors.orange,
                    ),
                    title: Text(challenge['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('💰 UGX ${challenge['reward']} • 👥 ${challenge['participants']}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Joined: ${challenge['title']}'), duration: const Duration(seconds: 2)),
                      );
                    },
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

// ==================== OPTIMIZED DASHBOARD ====================
class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Dashboard'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Simple Stats
              _SimpleStatCard(),
              SizedBox(height: 12),
              // Quick Summary
              _QuickSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SimpleStatCard extends StatelessWidget {
  const _SimpleStatCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Total Earned', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text('UGX 485,000', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _MiniStat('12', 'Challenges'),
                _MiniStat('8', 'Completed'),
                _MiniStat('3', 'Pending'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String value;
  final String label;
  
  const _MiniStat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _QuickSummaryCard extends StatelessWidget {
  const _QuickSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Recent Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            _ActivityRow('Twitter Share', '+ UGX 50,000', true),
            Divider(),
            _ActivityRow('Kampala Store', '+ UGX 30,000', false),
            Divider(),
            _ActivityRow('Restaurant Photo', '+ UGX 25,000', true),
          ],
        ),
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final String title;
  final String earnings;
  final bool completed;
  
  const _ActivityRow(this.title, this.earnings, this.completed);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(completed ? Icons.check_circle : Icons.pending, 
                color: completed ? Colors.green : Colors.orange, size: 20),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        Text(earnings, style: TextStyle(fontWeight: FontWeight.bold, color: completed ? Colors.green : Colors.orange)),
      ],
    );
  }
}

// ==================== OPTIMIZED PROGRESS SCREEN ====================
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Progress'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              _ProgressCircle(),
              SizedBox(height: 16),
              _MilestoneList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  const _ProgressCircle();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const Text('Overall Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(value: 0.64, strokeWidth: 10),
                  Text('32/50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text('64% Complete', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _MilestoneList extends StatelessWidget {
  const _MilestoneList();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const <Widget>[
          ListTile(leading: Icon(Icons.emoji_events, color: Colors.amber), title: Text('First Challenge'), trailing: Icon(Icons.check, color: Colors.green)),
          ListTile(leading: Icon(Icons.star, color: Colors.blue), title: Text('5 Challenges'), trailing: Icon(Icons.check, color: Colors.green)),
          ListTile(leading: Icon(Icons.workspace_premium, color: Colors.purple), title: Text('10 Challenges'), trailing: Icon(Icons.check, color: Colors.green)),
          ListTile(leading: Icon(Icons.military_tech, color: Colors.red), title: Text('25 Challenges'), trailing: Icon(Icons.lock, color: Colors.grey)),
        ],
      ),
    );
  }
}

// ==================== OPTIMIZED SOCIAL SCREEN ====================
class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Connect'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              _SocialCard('WhatsApp', '+256 700 000000', Colors.green, Icons.message),
              _SocialCard('Facebook', '@TuukaApp', Colors.blue, Icons.facebook),
              _SocialCard('Instagram', '@tuuka_app', Colors.purple, Icons.camera_alt),
              _SocialCard('TikTok', '@tuuka_app', Colors.black, Icons.video_library),
              _SocialCard('YouTube', 'Tuuka Official', Colors.red, Icons.play_circle),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  final String name;
  final String handle;
  final Color color;
  final IconData icon;
  
  const _SocialCard(this.name, this.handle, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
        title: Text(name),
        subtitle: Text(handle),
        trailing: const Icon(Icons.open_in_new),
      ),
    );
  }
}