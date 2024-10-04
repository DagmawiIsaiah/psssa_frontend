import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psssa_frontend/api/psssa_service.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  List<Record> record = [];

  Future<void> searchRecord(String pensionNumber) async {
    Record response =
        await PsssaService().fetchRecord(pentionNumber: pensionNumber);
    setState(() {
      record.add(response);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

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
                  SizedBox(
                    width: 300,
                    child: CupertinoSearchTextField(
                      placeholder: "Enter Name or Pention Number",
                      controller: _searchController,
                    ),
                  ),
                  const SizedBox(
                    width: SpacingSize.s20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      searchRecord(_searchController.text);
                    },
                    child: const Text("Search"),
                  ),
                  const SizedBox(
                    width: SpacingSize.s20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text("Add New"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SpacingSize.s20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: const RecordHeader(),
            ),
            const SizedBox(height: 10),
            (record.isNotEmpty)
                ? RecordView(
                    record: record[0],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
