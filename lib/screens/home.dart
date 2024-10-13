// ignore_for_file: use_build_context_synchronously

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
  bool _isLoading = false; // Loading state

  void addRecord(Record newRecord) {
    setState(() {
      record.clear();
      record.add(newRecord);
    });
  }

  Future<void> searchRecord(String pensionNumber) async {
    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      Record response =
          await PsssaService().fetchRecord(pentionNumber: pensionNumber);
      setState(() {
        record.clear();
        record.add(response);
      });
    } catch (e) {
      // Handle error if needed
      showErrorMessage(context, 'Error fetching record');
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            // Dismiss the current snack bar
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                      placeholder: "Enter Name or Pension Number",
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => NewRecordView(
                          onRecordAdded: addRecord,
                        ),
                      );
                    },
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
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator()) // Show loading spinner
                : (record.isNotEmpty)
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: RecordView(
                          record: record[0],
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
