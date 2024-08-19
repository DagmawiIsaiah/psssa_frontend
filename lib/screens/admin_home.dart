import 'package:flutter/material.dart';
import 'package:psssa_frontend/widgets/admin_settings_view.dart';

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

    final pages = [
      const AdminRecordsView(),
      const AdminUesrsView(),
      const AdminSettingsView(),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: SpacingSize.s24),
                        sideNavItem("Records", 0),
                        sideNavItem("Users", 1),
                        sideNavItem("Settings", 2),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 600,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: SpacingSize.s20),
                  pages[currentIndex],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
