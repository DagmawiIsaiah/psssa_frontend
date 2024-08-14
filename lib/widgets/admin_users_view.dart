import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminUesrsView extends StatelessWidget {
  const AdminUesrsView({super.key});

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
              "Filter and Search",
              style: textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                // horizontal: 150,
                ),
            child: Row(
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
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              // horizontal: 150,
              vertical: 24,
            ),
            child: Row(
              children: [
                Text("Filter by"),
                SizedBox(width: SpacingSize.s16),
                DropdownMenu(
                  label: Text("Region"),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 1, label: "Military"),
                    DropdownMenuEntry(value: 2, label: "Police"),
                    DropdownMenuEntry(value: 3, label: "Undertaking"),
                  ],
                ),
                SizedBox(width: SpacingSize.s16),
                DropdownMenu(
                  label: Text("City"),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: "Civil"),
                    DropdownMenuEntry(value: 1, label: "Military"),
                    DropdownMenuEntry(value: 2, label: "Police"),
                    DropdownMenuEntry(value: 3, label: "Undertaking"),
                  ],
                ),
              ],
            ),
          ),
          const UserHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: ListView.separated(
              itemBuilder: (context, index) => const UsersView(
                user: User(
                  id: 0,
                  regionId: 0,
                  cityId: 0,
                  accountTypeId: 0,
                  name: "Tesfa",
                  password: "password",
                ),
              ),
              itemCount: 15,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
