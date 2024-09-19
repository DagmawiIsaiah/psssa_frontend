import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../api/psssa_service.dart';

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
            FutureBuilder(
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

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: 24,
                      ),
                      child: Wrap(
                        spacing: SpacingSize.s16,
                        runSpacing: SpacingSize.s16,
                        children: [
                          DropdownMenu(
                            label: const Text("Category"),
                            dropdownMenuEntries: [
                              ...List.generate(
                                essentials['categories'].length,
                                (int index) => DropdownMenuEntry(
                                  value: essentials['categories'][index].id,
                                  label: essentials['categories'][index].name,
                                ),
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
                                  label: essentials['regions'][index].name,
                                ),
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
                                  label: essentials['cities'][index].name,
                                ),
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
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: const RecordHeader(),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
              future: PsssaService().fetchRecords(),
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
                    final records = snapshot.data as Map<String, dynamic>;
                    debugPrint(records.toString());
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
            const SizedBox(height: SpacingSize.s20),
          ],
        ),
      ),
    );
  }
}
