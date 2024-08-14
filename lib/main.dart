import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../screens/screens.dart';

void main() {
  runApp(const PSSSA());
}

class PSSSA extends StatelessWidget {
  const PSSSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PSSSA',
      theme: AppTheme.lightTheme,
      initialRoute: AdminHomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        AdminHomeScreen.routeName: (context) => const AdminHomeScreen(),
      },
    );
  }
}
