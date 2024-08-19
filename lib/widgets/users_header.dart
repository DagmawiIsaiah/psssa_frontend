import 'package:flutter/material.dart';

import '../utils/utils.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    Widget headerItem(String label) {
      return Expanded(
        child: Text(
          label,
          style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          headerItem("Full Name"),
          const SizedBox(width: 10),
          headerItem("Region"),
          const SizedBox(width: 10),
          headerItem("City"),
        ],
      ),
    );
  }
}
