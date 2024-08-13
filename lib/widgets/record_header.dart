import 'package:flutter/material.dart';

class RecordHeader extends StatelessWidget {
  const RecordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
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
            "Full Name",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Text(
            "Pention Number",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Text(
            "Category",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Text(
            "Recgion",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Text(
            "City",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Text(
            "Status",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
