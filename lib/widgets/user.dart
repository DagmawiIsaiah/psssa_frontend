import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class UsersView extends StatefulWidget {
  final User user;

  const UsersView({
    super.key,
    required this.user,
  });

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const UpdateStatusView(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 150),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.user.name,
              style: textTheme.bodyLarge,
            ),
            Text(
              "user.regionId",
              style: textTheme.bodyLarge,
            ),
            Text(
              "user.cityId",
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
