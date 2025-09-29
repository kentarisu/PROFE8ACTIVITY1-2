import 'package:flutter/material.dart';

class ProfileCardDemo extends StatelessWidget {
  const ProfileCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        image: const DecorationImage(
                          image:
                              NetworkImage('https://i.pinimg.com/736x/f1/b5/0a/f1b50ae9599da579af61027cfa82817b.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Orly Medina',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: otmedina.chmsu.@gmail.com',
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    Text('Phone: +63 963 067 5254',
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    Text('Talisay City, Negros Occidental',
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
