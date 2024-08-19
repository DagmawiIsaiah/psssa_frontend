import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';

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
    final textTheme = context.textTheme;

    Widget recordColumn(String label) {
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
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            recordColumn(widget.record.name),
            const SizedBox(width: 10),
            recordColumn(widget.record.pentionNumber),
            const SizedBox(width: 10),
            recordColumn(widget.record.categoryId.toString()),
            const SizedBox(width: 10),
            recordColumn(widget.record.regionId.toString()),
            const SizedBox(width: 10),
            recordColumn(widget.record.cityId.toString()),
            const SizedBox(width: 10),
            recordColumn(widget.record.statusId.toString()),
          ],
        ),
      ),
    );
  }
}
