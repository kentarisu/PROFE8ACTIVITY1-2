import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Frame Studios'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Icon(
                  Icons.video_camera_back,
                  size: 80,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to Edit Frame Studios',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Professional video editing services for your business',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'StatelessWidget Demo',
                  icon: Icons.widgets,
                  onPressed: () =>
                      Navigator.pushNamed(context, '/hello-stateless'),
                  color: Colors.blue,
                  width: 250,
                  height: 55,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'StatefulWidget Demo',
                  icon: Icons.analytics,
                  onPressed: () =>
                      Navigator.pushNamed(context, '/hello-stateful'),
                  color: Colors.green,
                  width: 250,
                  height: 55,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
