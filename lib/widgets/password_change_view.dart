import 'package:flutter/material.dart';

import '../utils/utils.dart';

class PasswordChangeView extends StatefulWidget {
  const PasswordChangeView({super.key});

  @override
  State<PasswordChangeView> createState() => _PasswordChangeViewState();
}

class _PasswordChangeViewState extends State<PasswordChangeView> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(110),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      content: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Change Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: SpacingSize.s16),
            TextField(
              obscureText: !_showPassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Old password"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              obscureText: !_showPassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("New password"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              obscureText: !_showPassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Confirm new password"),
              ),
            ),
            const SizedBox(height: SpacingSize.s20),
            Row(
              children: [
                Checkbox(
                  value: _showPassword,
                  onChanged: (_) {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                const Text("Show Password"),
              ],
            ),
            const SizedBox(height: SpacingSize.s40),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  // send change password request
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: const Text("Password update sucessful"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text("dismiss"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Change Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
