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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Divider(),
            const SizedBox(height: SpacingSize.s24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 150,
                vertical: 24,
              ),
              child: Text(
                "Filter and Search",
                style: textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 150,
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
                horizontal: 150,
                vertical: 24,
              ),
              child: Row(
                children: [
                  Text("Filter by"),
                  SizedBox(width: SpacingSize.s16),
                  DropdownMenu(
                    label: Text("Category"),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 0, label: "Civil"),
                      DropdownMenuEntry(value: 1, label: "Military"),
                      DropdownMenuEntry(value: 2, label: "Police"),
                      DropdownMenuEntry(value: 3, label: "Undertaking"),
                    ],
                  ),
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
                  SizedBox(width: SpacingSize.s16),
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
            ),
            const RecordHeader(),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
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
      ),
    );
  }
}
