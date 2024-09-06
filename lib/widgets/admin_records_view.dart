import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psssa_frontend/api/psssa_service.dart';

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
      child: FutureBuilder(
        future: PsssaService().getEssentials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: textTheme.titleMedium,
                ),
              );
            }
            if (snapshot.hasData) {
              final essentials = snapshot.data as Map<String, dynamic>;

              return Column(
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
                  Wrap(
                    runSpacing: SpacingSize.s16,
                    spacing: SpacingSize.s16,
                    children: [
                      DropdownMenu(
                        label: const Text("Category"),
                        dropdownMenuEntries: [
                          ...List.generate(
                            essentials['categories'].length,
                            (int index) => DropdownMenuEntry(
                                value: essentials['categories'][index].id,
                                label: essentials['categories'][index].name),
                          ),
                        ],
                      ),
                      DropdownMenu(
                        label: const Text("Region"),
                        dropdownMenuEntries: [
                          ...List.generate(
                            essentials['regions'].length,
                            (int index) => DropdownMenuEntry(
                                value: essentials['regions'][index].id,
                                label: essentials['regions'][index].name),
                          ),
                        ],
                      ),
                      DropdownMenu(
                        label: const Text("City"),
                        dropdownMenuEntries: [
                          ...List.generate(
                            essentials['cities'].length,
                            (int index) => DropdownMenuEntry(
                                value: essentials['cities'][index].id,
                                label: essentials['cities'][index].name),
                          ),
                        ],
                      ),
                      const DropdownMenu(
                        label: Text("Status"),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 0, label: "Sent"),
                          DropdownMenuEntry(value: 1, label: "Recived"),
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
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
