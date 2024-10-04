import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psssa_frontend/api/psssa_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class NewUserView extends StatefulWidget {
  const NewUserView({super.key});

  @override
  State<NewUserView> createState() => _NewUserViewState();
}

class _NewUserViewState extends State<NewUserView> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  int categoryId = -1;
  int regionId = -1;
  int cityId = -1;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
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
              "Add New User",
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
                label: Text("User Code"),
              ),
            ),
            const SizedBox(height: SpacingSize.s12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
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
                  final newUser = {
                    "account_type_id": 2,
                    "region_id": regionId + 1,
                    "city_id": cityId + 1,
                    "name": nameController.text,
                    "password": passwordController.text,
                  };

                  debugPrint(newUser.toString());

                  await PsssaService().createUser(newUser);

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
                child: const Text("Add User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
