// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';
import '../api/psssa_service.dart';
import '../models/models.dart';

class NewRecordView extends StatefulWidget {
  final Function onRecordAdded;
  const NewRecordView({super.key, required this.onRecordAdded});

  @override
  State<NewRecordView> createState() => _NewRecordViewState();
}

class _NewRecordViewState extends State<NewRecordView> {
  late TextEditingController nameController;
  late TextEditingController pensionNumberController;
  int categoryId = -1;
  int regionId = -1;
  int cityId = -1;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    pensionNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    pensionNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _categories = categories;
    final _regions = regions;
    final _cities = cities;

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
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("User name"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              controller: pensionNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Pension number"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            DropdownMenu(
              label: const Text("Select category"),
              width: 450,
              onSelected: (value) {
                if (value != null) {
                  setState(() {
                    categoryId = value;
                  });
                }
              },
              dropdownMenuEntries: [
                ...List.generate(
                  _categories.length,
                  (index) => DropdownMenuEntry(
                    value: index,
                    label: _categories[index],
                  ),
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.s12),
            Row(
              children: [
                DropdownMenu(
                  label: const Text("Select region"),
                  width: 220,
                  onSelected: (value) {
                    if (value != null) {
                      setState(() {
                        regionId = value;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                    ...List.generate(
                      _regions.length,
                      (index) => DropdownMenuEntry(
                        value: index,
                        label: _regions[index],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                DropdownMenu(
                  label: const Text("Select city"),
                  width: 220,
                  onSelected: (value) {
                    if (value != null) {
                      setState(() {
                        cityId = value;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                    if (regionId != -1)
                      ...List.generate(
                        _cities[regionId].length,
                        (index) => DropdownMenuEntry(
                          value: index,
                          label: _cities[regionId][index],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.s40),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  final user = jsonDecode(pref.getString("user") ?? "");

                  final record = {
                    "name": nameController.text,
                    "region_id": regionId + 1,
                    "category_id": categoryId + 1,
                    "created_city_id": user["city_id"] + 1,
                    "city_id": cityId + 1,
                    "pension_number": pensionNumberController.text,
                  };

                  final response = await PsssaService().createRecord(record);
                  
                  Record newRecord = Record.fromJson(jsonDecode(response));
                  widget.onRecordAdded(newRecord);
                  
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: const Text("New record sucessfully added"),
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
                child: const Text("Add Record"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
