// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';
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
    final _categories = categories;
    final _regions = regions;
    final _cities = cities;
    final status = ["Sent", "Recived"];

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
          builder: (context) => UpdateStatusView(id: widget.record.id,),
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
            recordColumn(_categories[widget.record.categoryId - 1]),
            const SizedBox(width: 10),
            recordColumn(_regions[widget.record.regionId - 1]),
            const SizedBox(width: 10),
            recordColumn(
                _cities[widget.record.regionId - 1][widget.record.cityId - 1]),
            const SizedBox(width: 10),
            recordColumn(status[widget.record.statusId - 1]),
          ],
        ),
      ),
    );
  }
}
