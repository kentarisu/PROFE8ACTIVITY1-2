import 'package:flutter/material.dart';

class ChatBubbleDemo extends StatelessWidget {
  const ChatBubbleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bubble Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChatBubble('Hello! How are you?', true),
            const SizedBox(height: 15),
            _buildChatBubble('I\'m doing great, thanks!', false),
            const SizedBox(height: 15),
            _buildChatBubble(
                'Would you like to see the video editing demo?', true),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble(String message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSender ? Colors.grey.shade300 : Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSender ? Colors.black : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
