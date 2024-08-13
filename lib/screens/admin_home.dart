import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class AdminHomeScreen extends StatelessWidget {
  static const String routeName = '/adminHome';

  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.1,
        child: Row(
          children: [
            Column(
              children: [
                const Text("Manage"),
                Container(
                  color: Colors.black12,
                  child: const Text("Records"),
                ),
              ],
            ),
            Container(
              width: 3,
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 150,
                        ),
                        child: Text("Filter and Search"),
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
                        ),
                        child: Row(
                          children: [
                            DropdownMenu(
                              label: Text("Category"),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(value: 0, label: "Civil"),
                                DropdownMenuEntry(value: 1, label: "Military"),
                                DropdownMenuEntry(value: 2, label: "Police"),
                                DropdownMenuEntry(
                                    value: 3, label: "Undertaking"),
                              ],
                            ),
                            DropdownMenu(
                              label: Text("Region"),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(value: 0, label: "Civil"),
                                DropdownMenuEntry(value: 1, label: "Military"),
                                DropdownMenuEntry(value: 2, label: "Police"),
                                DropdownMenuEntry(
                                    value: 3, label: "Undertaking"),
                              ],
                            ),
                            DropdownMenu(
                              label: Text("City"),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(value: 0, label: "Civil"),
                                DropdownMenuEntry(value: 1, label: "Military"),
                                DropdownMenuEntry(value: 2, label: "Police"),
                                DropdownMenuEntry(
                                    value: 3, label: "Undertaking"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const RecordHeader(),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
