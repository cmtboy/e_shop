import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("History Screen")),
    );
  }
}
