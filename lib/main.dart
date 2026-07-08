import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TuukaApp());
}

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuuka - Earn Now',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ==================== HOME SCREEN WITH NAVIGATION ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChallengeScreen(),
    const UserDashboard(),
    const ProgressScreen(),
    const SocialMediaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[900],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Connect',
          ),
        ],
      ),
    );
  }
}

// ==================== CHALLENGE LIST SCREEN ====================
class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  String _selectedFilter = 'All';
  
  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'Share Tuuka on Twitter',
      'sponsor': 'BrandBoost Uganda',
      'reward': 50000,
      'participants': 234,
      'type': 'remote',
      'status': 'active',
    },
    {
      'title': 'Visit Kampala Store',
      'sponsor': 'ShopMax',
      'reward': 30000,
      'participants': 89,
      'type': 'physical',
      'status': 'active',
    },
    {
      'title': 'Take Photo at Restaurant',
      'sponsor': 'Tasty Bites',
      'reward': 25000,
      'participants': 156,
      'type': 'physical',
      'status': 'active',
    },
    {
      'title': 'Video Review - New Product',
      'sponsor': 'TechHub',
      'reward': 75000,
      'participants': 67,
      'type': 'remote',
      'status': 'active',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⛏️ Tuuka - Earn Now'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: ['All', 'Remote', 'Physical', 'Near Me'].map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: _selectedFilter == filter,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          
          // Challenges List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _challenges.length,
              itemBuilder: (context, index) {
                final challenge = _challenges[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: challenge['type'] == 'remote' 
                        ? Colors.blue[100] 
                        : Colors.orange[100],
                      child: Icon(
                        challenge['type'] == 'remote' 
                          ? Icons.cloud_outlined 
                          : Icons.location_on,
                        color: challenge['type'] == 'remote' 
                          ? Colors.blue 
                          : Colors.orange,
                      ),
                    ),
                    title: Text(
                      challenge['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('🏢 ${challenge['sponsor']}'),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              const TextSpan(text: '💰 UGX '),
                              TextSpan(
                                text: challenge['reward'].toString().replaceAllMapped(
                                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (m) => '${m[1]},',
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('👥 ${challenge['participants']} participants'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('✅ Joined: ${challenge['title']}'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text('Join'),
                    ),
                    isThreeLine: true,
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

// ==================== USER DASHBOARD ====================
class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalChallenges = 12;
    final int completedChallenges = 8;
    final int pendingChallenges = 3;
    final int totalEarnings = 485000;
    final int pendingEarnings = 75000;

    return Scaffold(
      appBar: AppBar(
        title: const Text(' My Dashboard'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back! 👋',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You\'ve earned UGX ${totalEarnings.toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (m) => '${m[1]},',
                      )} so far!',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Quick Stats
            const Text(
              'Quick Stats',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard('Challenges', totalChallenges.toString(), Icons.task_alt, Colors.blue),
                _buildStatCard('Completed', completedChallenges.toString(), Icons.check_circle, Colors.green),
                _buildStatCard('Pending', pendingChallenges.toString(), Icons.pending, Colors.orange),
                _buildStatCard('Earned', 'UGX ${(totalEarnings / 1000).toStringAsFixed(0)}K', Icons.attach_money, Colors.purple),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Recent Activity
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildActivityCard('Share Tuuka on Twitter', 'Completed', '+ UGX 50,000', Colors.green, Icons.check_circle),
            _buildActivityCard('Visit Kampala Store', 'Pending Approval', '+ UGX 30,000', Colors.orange, Icons.pending),
            _buildActivityCard('Take Photo at Restaurant', 'Approved', '+ UGX 25,000', Colors.green, Icons.check_circle),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String status, String earnings, Color color, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(status),
        trailing: Text(earnings, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}

// ==================== PROGRESS TRACKING SCREEN ====================
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalChallenges = 50;
    final int completedChallenges = 32;
    final double progress = completedChallenges / totalChallenges;
    
    final List<Map<String, dynamic>> milestones = [
      {'title': 'First Challenge', 'icon': Icons.emoji_events, 'completed': true, 'color': Colors.amber},
      {'title': '5 Challenges Done', 'icon': Icons.star, 'completed': true, 'color': Colors.blue},
      {'title': '10 Challenges Done', 'icon': Icons.workspace_premium, 'completed': true, 'color': Colors.purple},
      {'title': '25 Challenges Done', 'icon': Icons.military_tech, 'completed': false, 'color': Colors.red},
      {'title': '50 Challenges Done', 'icon': Icons.emoji_events, 'completed': false, 'color': Colors.orange},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(' My Progress'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Overall Progress Card
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Overall Progress',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 12,
                            backgroundColor: Colors.blue[100],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$completedChallenges',
                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'of $totalChallenges',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}% Complete',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Milestones
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Milestones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            
            ...milestones.map((milestone) => _buildMilestoneCard(milestone)),
            
            const SizedBox(height: 20),
            
            // Earnings Progress
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Earnings This Month',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'UGX 485,000',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Target: UGX 1,000,000',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: 0.485,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 8,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '48.5% of monthly target',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneCard(Map<String, dynamic> milestone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: milestone['completed'] ? Colors.green[50] : Colors.grey[100],
      child: ListTile(
        leading: Icon(
          milestone['icon'],
          color: milestone['completed'] ? milestone['color'] : Colors.grey,
        ),
        title: Text(
          milestone['title'],
          style: TextStyle(
            fontWeight: milestone['completed'] ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: milestone['completed']
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.lock, color: Colors.grey),
      ),
    );
  }
}

// ==================== SOCIAL MEDIA SCREEN ====================
class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> socialLinks = [
      {
        'name': 'WhatsApp',
        'icon': Icons.message,
        'color': Colors.green,
        'handle': '+256 700 000000',
        'url': 'https://wa.me/256700000000',
      },
      {
        'name': 'Facebook',
        'icon': Icons.facebook,
        'color': Colors.blue[800]!,
        'handle': '@TuukaApp',
        'url': 'https://facebook.com/TuukaApp',
      },
      {
        'name': 'Instagram',
        'icon': Icons.camera_alt,
        'color': Colors.purple,
        'handle': '@tuuka_app',
        'url': 'https://instagram.com/tuuka_app',
      },
      {
        'name': 'TikTok',
        'icon': Icons.video_library,
        'color': Colors.black,
        'handle': '@tuuka_app',
        'url': 'https://tiktok.com/@tuuka_app',
      },
      {
        'name': 'YouTube',
        'icon': Icons.play_circle,
        'color': Colors.red,
        'handle': 'Tuuka Official',
        'url': 'https://youtube.com/@TuukaOfficial',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🌐 Connect With Us'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // App Info Card
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(Icons.mobile_friendly, size: 64, color: Colors.blue),
                    const SizedBox(height: 12),
                    const Text(
                      'Tuuka - Earn Now',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Join challenges, complete tasks, earn rewards!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildInfoChip('10K+', 'Downloads'),
                        const SizedBox(width: 12),
                        _buildInfoChip('4.8★', 'Rating'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Follow Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            
            // Social Media Links
            ...socialLinks.map((social) => _buildSocialCard(social, context)),
            
            const SizedBox(height: 20),
            
            // Share App Card
            Card(
              color: Colors.green[50],
              child: ListTile(
                leading: const Icon(Icons.share, color: Colors.green),
                title: const Text('Share Tuuka with Friends'),
                subtitle: const Text('Earn more by inviting others!'),
                trailing: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Share feature coming soon!')),
                    );
                  },
                  child: const Text('Share'),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // App Version
            Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              'Made with ❤️ in Uganda',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSocialCard(Map<String, dynamic> social, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: social['color'],
          child: Icon(social['icon'], color: Colors.white),
        ),
        title: Text(social['name']),
        subtitle: Text(social['handle']),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new),
          color: social['color'],
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opening ${social['name']}...')),
            );
            // In real app, this would open the URL
          },
        ),
      ),
    );
  }
}