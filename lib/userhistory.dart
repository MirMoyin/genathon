import 'package:flutter/material.dart';
import 'dart:math';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  HistoryPage({required this.history});

  String generateRandomCode() {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#%^&*';
    final Random random = Random();
    final codeLength = 10;
    String randomCode = '';
    for (int i = 0; i < codeLength; i++) {
      randomCode += chars[random.nextInt(chars.length)];
    }
    return randomCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'History:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final randomCode = generateRandomCode();
                  final historyEntry = '$randomCode - ${history[index]}';
                  return ListTile(
                    title: Text(historyEntry),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
