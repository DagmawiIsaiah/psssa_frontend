import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.deviceSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Divider(),
            const SizedBox(height: SpacingSize.s24),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: 24,
              ),
              child: Text(
                "Search",
                style: textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
              ),
              child: Row(
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
            ),
            const SizedBox(height: SpacingSize.s20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Text(
                "Filter by",
                style: textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: 24,
              ),
              child: Wrap(
                spacing: SpacingSize.s16,
                runSpacing: SpacingSize.s16,
                children: [
                  const DropdownMenu(
                    label: Text("Category"),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 0, label: "Civil"),
                      DropdownMenuEntry(value: 1, label: "Military"),
                      DropdownMenuEntry(value: 2, label: "Police"),
                      DropdownMenuEntry(value: 3, label: "Undertaking"),
                    ],
                  ),
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
                  const DropdownMenu(
                    label: Text("Status"),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: const RecordHeader(),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
            const SizedBox(height: SpacingSize.s20),
          ],
        ),
      ),
    );
  }
}
