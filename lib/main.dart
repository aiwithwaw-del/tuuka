import 'package:flutter/material.dart';

void main() {
  runApp(const TuukaApp());
}

class TuukaApp extends StatelessWidget {
  const TuukaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuuka',
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
    const SponsorDashboard(),
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
            label: 'My Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Sponsor',
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
  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'Share Tuuka on Twitter',
      'sponsor': 'BrandBoost Uganda',
      'reward': 50000,
      'participants': 234,
      'type': 'remote',
    },
    {
      'title': 'Visit Kampala Store',
      'sponsor': 'ShopMax',
      'reward': 30000,
      'participants': 89,
      'type': 'physical',
    },
    {
      'title': 'Take Photo at Restaurant',
      'sponsor': 'Tasty Bites',
      'reward': 25000,
      'participants': 156,
      'type': 'physical',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⛏️ Tuuka - Earn Now'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _challenges.length,
        itemBuilder: (context, index) {
          final challenge = _challenges[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                challenge['type'] == 'remote' 
                  ? Icons.cloud_outlined 
                  : Icons.location_on,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                challenge['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('🏢 ${challenge['sponsor']}'),
                  Text('💰 UGX ${challenge['reward'].toString().replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (m) => '${m[1]},',
                  )}'),
                  Text('👥 ${challenge['participants']} participants'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Joined challenge!'),
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
    );
  }
}

// ==================== USER DASHBOARD ====================
class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - will connect to backend later
    final int totalChallenges = 12;
    final int completedChallenges = 8;
    final int pendingChallenges = 3;
    final int totalEarnings = 485000;
    final int pendingEarnings = 75000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 My Dashboard'),
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
            
            // Stats Grid
            const Text(
              'Your Statistics',
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
                _buildStatCard(
                  'Total Challenges',
                  totalChallenges.toString(),
                  Icons.task_alt,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Completed',
                  completedChallenges.toString(),
                  Icons.check_circle,
                  Colors.green,
                ),
                _buildStatCard(
                  'Pending',
                  pendingChallenges.toString(),
                  Icons.pending,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Total Earned',
                  'UGX ${(totalEarnings / 1000).toStringAsFixed(0)}K',
                  Icons.attach_money,
                  Colors.purple,
                ),
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
            
            _buildActivityCard(
              'Share Tuuka on Twitter',
              'Completed',
              '+ UGX 50,000',
              Colors.green,
              Icons.check_circle,
            ),
            _buildActivityCard(
              'Visit Kampala Store',
              'Pending Approval',
              '+ UGX 30,000',
              Colors.orange,
              Icons.pending,
            ),
            _buildActivityCard(
              'Take Photo at Restaurant',
              'Approved',
              '+ UGX 25,000',
              Colors.green,
              Icons.check_circle,
            ),
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
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
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
        trailing: Text(
          earnings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}

// ==================== SPONSOR DASHBOARD ====================
class SponsorDashboard extends StatelessWidget {
  const SponsorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - will connect to backend later
    final int totalChallenges = 5;
    final int totalParticipants = 1247;
    final int totalPaid = 15750000;
    final int totalImpressions = 45230;
    final double engagementRate = 68.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏢 Sponsor Dashboard'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Card
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Campaign Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildOverviewRow('Total Challenges', totalChallenges.toString()),
                    _buildOverviewRow('Total Participants', totalParticipants.toString()),
                    _buildOverviewRow('Total Paid Out', 'UGX ${(totalPaid / 1000000).toStringAsFixed(1)}M'),
                    _buildOverviewRow('Total Impressions', totalImpressions.toString()),
                    _buildOverviewRow('Engagement Rate', '${engagementRate}%'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Performance Metrics
            const Text(
              'Performance Metrics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildMetricCard(
              'Total Reach',
              totalImpressions.toString(),
              'people saw your challenges',
              Icons.visibility,
              Colors.blue,
            ),
            _buildMetricCard(
              'Total Participants',
              totalParticipants.toString(),
              'people joined challenges',
              Icons.people,
              Colors.green,
            ),
            _buildMetricCard(
              'Total Investment',
              'UGX ${(totalPaid / 1000000).toStringAsFixed(1)}M',
              'paid to participants',
              Icons.payments,
              Colors.purple,
            ),
            _buildMetricCard(
              'Avg. Engagement',
              '${engagementRate}%',
              'completion rate',
              Icons.trending_up,
              Colors.orange,
            ),
            
            const SizedBox(height: 20),
            
            // Active Challenges
            const Text(
              'Active Challenges',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildChallengeCard(
              'Share Tuuka on Twitter',
              234,
              50000,
              11700000,
              68,
            ),
            _buildChallengeCard(
              'Visit Kampala Store',
              89,
              30000,
              2670000,
              45,
            ),
            _buildChallengeCard(
              'Product Review Video',
              156,
              40000,
              6240000,
              82,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create new challenge feature coming soon!')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('New Challenge'),
      ),
    );
  }

  Widget _buildOverviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeCard(String title, int participants, int rewardPerUser, int totalPaid, int completionRate) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMiniStat('Participants', participants.toString(), Icons.people),
                _buildMiniStat('Reward', 'UGX ${(rewardPerUser / 1000).toStringAsFixed(0)}K', Icons.attach_money),
                _buildMiniStat('Completion', '$completionRate%', Icons.check_circle),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Paid:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'UGX ${(totalPaid / 1000000).toStringAsFixed(2)}M',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}