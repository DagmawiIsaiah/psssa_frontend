// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../api/psssa_service.dart';
import '../utils/utils.dart';

class UpdateStatusView extends StatelessWidget {
  final int id;

  const UpdateStatusView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    int status = 1;

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
            DropdownMenu(
              width: 400,
              label: const Text("Select status"),
              onSelected: (value) {
                if (value != null) {
                  status = value;
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "Pending"),
                DropdownMenuEntry(value: 2, label: "Recived"),
              ],
            ),
            const SizedBox(height: SpacingSize.s40),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  PsssaService().updateRecordStatus(id, status).then(
                    (_) {
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
