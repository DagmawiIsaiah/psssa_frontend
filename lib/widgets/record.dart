import 'package:flutter/material.dart';

class Record extends StatelessWidget {
  const Record({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Full Name"),
          Text("Penstion Number"),
          Text("Category"),
          Text("Region"),
          Text("city"),
          Text("Status"),
        ],
      ),
    );
  }
}
