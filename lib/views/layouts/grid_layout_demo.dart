import 'package:flutter/material.dart';

class GridLayoutDemo extends StatelessWidget {
  const GridLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildGridItem('Item 1', Colors.red)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildGridItem('Item 2', Colors.blue)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildGridItem('Item 3', Colors.green)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildGridItem('Item 4', Colors.orange)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildGridItem('Item 5', Colors.purple)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildGridItem('Item 6', Colors.teal)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, Color color) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
