import 'package:flutter/material.dart';

void main() {
  runApp(const PSSSA());
}

class PSSSA extends StatelessWidget {
  const PSSSA({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSSSA',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
