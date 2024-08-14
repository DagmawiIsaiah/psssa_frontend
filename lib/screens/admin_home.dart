import 'package:flutter/material.dart';
import 'package:psssa_frontend/widgets/admin_settings_view.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminHomeScreen extends StatelessWidget {
  static const String routeName = '/adminHome';

  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Divider(),
            const SizedBox(height: SpacingSize.s24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: const Text("Records"),
                      ),
                      Container(
                        child: const Text("Users"),
                      ),
                      Container(
                        child: const Text("Settings"),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 600,
                  color: Colors.grey,
                ),
                const AdminSettingsView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
