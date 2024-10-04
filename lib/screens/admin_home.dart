import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = '/adminHome';

  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.deviceSize;

    Widget sideNavItem(String label, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          color: (index == currentIndex) ? Colors.grey[300] : null,
          child: Text(
            label,
            style: textTheme.titleMedium,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: const AdminUesrsView(),
            ),
          ],
        ),
      ),
    );
  }
}
