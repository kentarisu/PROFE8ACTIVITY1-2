import 'package:flutter/material.dart';

class FlexibleResizeDemo extends StatelessWidget {
  const FlexibleResizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Resize Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Flex: 2',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text('Flex: 1',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.orange,
                child: const Center(
                  child: Text('Flex: 3',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
