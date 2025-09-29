import 'package:flutter/material.dart';
import '../widgets/service_portfolio_grid.dart';
import '../widgets/custom_button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.video_library,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Video Editing Portfolio',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Our featured projects in staggered grid layout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Platform Demo',
                    icon: Icons.phone_android,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/platform-demo'),
                    color: Colors.orange,
                    width: 250,
                    height: 55,
                  ),
                ],
              ),
            ),
            const ServicePortfolioGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
