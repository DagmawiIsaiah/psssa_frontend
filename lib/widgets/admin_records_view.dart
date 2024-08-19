import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminRecordsView extends StatelessWidget {
  const AdminRecordsView({super.key});

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
              "Search",
              style: textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 300,
                child: CupertinoSearchTextField(
                  placeholder: "Enter Name or Pention Number",
                ),
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
          const SizedBox(height: SpacingSize.s20),
          const Wrap(
            runSpacing: SpacingSize.s16,
            spacing: SpacingSize.s16,
            children: [
              DropdownMenu(
                label: Text("Category"),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 0, label: "Civil"),
                  DropdownMenuEntry(value: 1, label: "Military"),
                  DropdownMenuEntry(value: 2, label: "Police"),
                  DropdownMenuEntry(value: 3, label: "Undertaking"),
                ],
              ),
              DropdownMenu(
                label: Text("Region"),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 0, label: "Civil"),
                  DropdownMenuEntry(value: 1, label: "Military"),
                  DropdownMenuEntry(value: 2, label: "Police"),
                  DropdownMenuEntry(value: 3, label: "Undertaking"),
                ],
              ),
              DropdownMenu(
                label: Text("City"),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 0, label: "Civil"),
                  DropdownMenuEntry(value: 1, label: "Military"),
                  DropdownMenuEntry(value: 2, label: "Police"),
                  DropdownMenuEntry(value: 3, label: "Undertaking"),
                ],
              ),
              DropdownMenu(
                label: Text("Status"),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 0, label: "Civil"),
                  DropdownMenuEntry(value: 1, label: "Military"),
                  DropdownMenuEntry(value: 2, label: "Police"),
                  DropdownMenuEntry(value: 3, label: "Undertaking"),
                ],
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.s20),
          const RecordHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: size.height * 0.45,
            child: ListView.separated(
              itemBuilder: (context, index) => const RecordView(
                record: Record(
                  id: 0,
                  regionId: 0,
                  cityId: 0,
                  categoryId: 0,
                  statusId: 0,
                  name: "Tesfa Wondu Unknown",
                  pentionNumber: "PNAA10012454",
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
