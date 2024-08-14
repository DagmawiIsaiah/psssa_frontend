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
            padding: const EdgeInsets.symmetric(
              // horizontal: 150,
              vertical: 24,
            ),
            child: Text(
              "Update password",
              style: textTheme.headlineLarge,
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              label: Text("Old password"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: SpacingSize.s12),
          const TextField(
            decoration: InputDecoration(
              label: Text("New password"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: SpacingSize.s12),
          const TextField(
            decoration: InputDecoration(
              label: Text("New password"),
              border: OutlineInputBorder(),
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
            padding: const EdgeInsets.symmetric(
              // horizontal: 150,
              vertical: 24,
            ),
            child: Text(
              "Update password",
              style: textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              const Text("Figma design file"),
              TextButton.icon(
                onPressed: () {},
                label: const Text("Download"),
                icon: const Icon(Icons.download_rounded),
              ),
            ],
          ),
          Row(
            children: [
              const Text("FastAPI backend project file"),
              TextButton.icon(
                onPressed: () {},
                label: const Text("Download"),
                icon: const Icon(Icons.download_rounded),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Flutter frontend project file"),
              TextButton.icon(
                onPressed: () {},
                label: const Text("Download"),
                icon: const Icon(Icons.download_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
