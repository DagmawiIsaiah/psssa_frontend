import 'package:flutter/material.dart';
import 'package:psssa_frontend/utils/constants.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Update password",
              style: textTheme.headlineLarge,
            ),
          ),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                label: Text("Old password"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: SpacingSize.s12),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                label: Text("New password"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: SpacingSize.s12),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                label: Text("New password"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SpacingSize.s24,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Update Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Download Project Files",
              style: textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Figma design file"),
                  SizedBox(height: 10),
                  Text("FastAPI backend project file"),
                  SizedBox(height: 10),
                  Text("Flutter frontend project file"),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text("Download"),
                    icon: const Icon(Icons.download_rounded),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text("Download"),
                    icon: const Icon(Icons.download_rounded),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text("Download"),
                    icon: const Icon(Icons.download_rounded),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
