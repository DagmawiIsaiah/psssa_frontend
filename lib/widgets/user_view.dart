import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';

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

    Widget userColumn(String label) {
      return Expanded(
        child: Text(
          label,
          style: textTheme.bodyLarge,
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => const UpdateStatusView(),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            userColumn(widget.user.name),
            const SizedBox(width: 10),
            userColumn(regions[widget.user.regionId - 1]),
            const SizedBox(width: 10),
            userColumn(cities[widget.user.regionId - 1][widget.user.cityId - 1]),
          ],
        ),
      ),
    );
  }
}
