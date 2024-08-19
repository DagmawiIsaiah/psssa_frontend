import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminUesrsView extends StatelessWidget {
  const AdminUesrsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.deviceSize;

    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Filter and Search",
              style: textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 300,
                child: CupertinoSearchTextField(),
              ),
              const SizedBox(
                width: SpacingSize.s20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Search"),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.s20),
          Text(
            "Filter By",
            style: textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SpacingSize.s20,
            ),
            child: Wrap(
              spacing: SpacingSize.s16,
              runSpacing: SpacingSize.s16,
              children: [
                const DropdownMenu(
                  label: Text("Region"),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 1, label: "Military"),
                    DropdownMenuEntry(value: 2, label: "Police"),
                    DropdownMenuEntry(value: 3, label: "Undertaking"),
                  ],
                ),
                const DropdownMenu(
                  label: Text("City"),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 1, label: "Military"),
                    DropdownMenuEntry(value: 2, label: "Police"),
                    DropdownMenuEntry(value: 3, label: "Undertaking"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Apply Filters"),
                  ),
                ),
              ],
            ),
          ),
          const UserHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: size.height * 0.4,
            child: ListView.separated(
              itemBuilder: (context, index) => const UsersView(
                user: User(
                  id: 0,
                  regionId: 0,
                  cityId: 0,
                  accountTypeId: 0,
                  name: "Tesfa Wondu Unknown",
                  password: "password",
                ),
              ),
              itemCount: 15,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
            ),
          ),
          const SizedBox(height: SpacingSize.s20),
        ],
      ),
    );
  }
}
