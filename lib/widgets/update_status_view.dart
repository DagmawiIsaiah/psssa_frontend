import 'package:flutter/material.dart';

import '../utils/utils.dart';

class UpdateStatusView extends StatelessWidget {
  const UpdateStatusView({super.key});

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
              "Update Status",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: SpacingSize.s16),
            const DropdownMenu(
              width: 400,
              label: Text("Select status"),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0, label: "Sent"),
                DropdownMenuEntry(value: 1, label: "Recived"),
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
                      content: const Text("status update sucessful"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text("Dismiss"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Update Status"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
