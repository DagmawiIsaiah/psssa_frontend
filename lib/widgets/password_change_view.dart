import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psssa_frontend/api/psssa_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class PasswordChangeView extends StatefulWidget {
  const PasswordChangeView({super.key});

  @override
  State<PasswordChangeView> createState() => _PasswordChangeViewState();
}

class _PasswordChangeViewState extends State<PasswordChangeView> {
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
  }

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
              controller: _oldPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Old password"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              obscureText: !_showPassword,
              controller: _newPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("New password"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              obscureText: !_showPassword,
              controller: _confirmNewPasswordController,
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
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  final user = jsonDecode(pref.getString("user") ?? "");
                  if (_newPasswordController.text ==
                      _confirmNewPasswordController.text) {
                    await PsssaService().updatePassword(
                        user["id"], _confirmNewPasswordController.text);
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
                  }
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
