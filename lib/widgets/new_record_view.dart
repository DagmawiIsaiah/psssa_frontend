import 'package:flutter/material.dart';

import '../utils/utils.dart';

class NewRecordView extends StatefulWidget {
  const NewRecordView({super.key});

  @override
  State<NewRecordView> createState() => _NewRecordViewState();
}

class _NewRecordViewState extends State<NewRecordView> {
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
              "Add New Record",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: SpacingSize.s16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("User name"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Pension number"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            const DropdownMenu(
              label: Text("Select category"),
              width: 450,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0, label: "Civil"),
                DropdownMenuEntry(value: 0, label: "Military"),
                DropdownMenuEntry(value: 0, label: "Police"),
                DropdownMenuEntry(value: 0, label: "Undertaking"),
              ],
            ),
            const SizedBox(height: SpacingSize.s12),
            const Row(
              children: [
                DropdownMenu(
                  label: Text("Select region"),
                  width: 220,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 0, label: "Military"),
                    DropdownMenuEntry(value: 0, label: "Police"),
                    DropdownMenuEntry(value: 0, label: "Undertaking"),
                  ],
                ),
                SizedBox(width: 10),
                DropdownMenu(
                  label: Text("Select city"),
                  width: 220,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 0, label: "Military"),
                    DropdownMenuEntry(value: 0, label: "Police"),
                    DropdownMenuEntry(value: 0, label: "Undertaking"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.s40),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                onPressed: () {
                  // send change password request
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: const Text("New record sucessfully added"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text("hide"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Add Record"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
