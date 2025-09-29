import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HelloStateful extends StatefulWidget {
  const HelloStateful({super.key});

  @override
  State<HelloStateful> createState() => _HelloStatefulState();
}

class _HelloStatefulState extends State<HelloStateful> {
  int _projectsCompleted = 0;
  int _clientsServed = 0;

  void _addProject() {
    setState(() {
      _projectsCompleted++;
    });
  }

  void _addClient() {
    setState(() {
      _clientsServed++;
    });
  }

  void _resetCounters() {
    setState(() {
      _projectsCompleted = 0;
      _clientsServed = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio Statistics'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo.shade100, Colors.blue.shade50],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.analytics,
                  size: 60,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Video Editing Studio Stats',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 30),
                _buildStatCard(
                    'Projects Completed', _projectsCompleted, Colors.green),
                const SizedBox(height: 15),
                _buildStatCard('Clients Served', _clientsServed, Colors.orange),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'Add Project',
                      icon: Icons.add_circle,
                      onPressed: _addProject,
                      color: Colors.green,
                      width: 130,
                    ),
                    CustomButton(
                      text: 'Add Client',
                      icon: Icons.person_add,
                      onPressed: _addClient,
                      color: Colors.orange,
                      width: 130,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomButton(
                  text: 'Reset All',
                  icon: Icons.refresh,
                  onPressed: _resetCounters,
                  color: Colors.red,
                  width: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int count, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              count > 0 ? Icons.trending_up : Icons.trending_flat,
              color: color,
              size: 30,
            ),
            const SizedBox(width: 15),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
