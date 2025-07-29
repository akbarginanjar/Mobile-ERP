import 'package:flutter/material.dart';

class AnalisisMarketScreen extends StatelessWidget {
  const AnalisisMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1.3)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        title: Text("Analisis Market", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
