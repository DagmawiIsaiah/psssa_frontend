import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class RecordView extends StatefulWidget {
  final Record record;

  const RecordView({
    super.key,
    required this.record,
  });

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
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
              widget.record.name,
              style: textTheme.bodyLarge,
            ),
            Text(
              widget.record.pentionNumber,
              style: textTheme.bodyLarge,
            ),
            Text(
              "record.categoryId",
              style: textTheme.bodyLarge,
            ),
            Text(
              "record.regionId",
              style: textTheme.bodyLarge,
            ),
            Text(
              "record.cityId",
              style: textTheme.bodyLarge,
            ),
            Text(
              "record.statusId",
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
