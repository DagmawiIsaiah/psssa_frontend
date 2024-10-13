import 'package:flutter/material.dart';
import 'package:psssa_frontend/api/psssa_service.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = '/adminHome';

  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    PsssaService().getUsers().then((value) {
      setState(() {
        users = value;
      });
    });
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const NewUserView(),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add New"),
                  ),
                  const SizedBox(height: SpacingSize.s20),
                  const UserHeader(),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.4,
                    child: ListView.separated(
                      itemBuilder: (context, index) => UsersView(
                        user: users[index],
                      ),
                      itemCount: users.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 5);
                      },
                    ),
                  ),
                  const SizedBox(height: SpacingSize.s20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
