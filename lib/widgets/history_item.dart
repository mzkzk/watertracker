import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watertracker/models/water_record.dart';

class HistoryItem extends StatelessWidget {
  final DateTime date;
  final int total;
  final List<WaterRecord> records;

  const HistoryItem({
    super.key,
    required this.date,
    required this.total,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(DateFormat.yMMMMd('ar').format(date)),
      subtitle: Text('$total مل'),
      children: records.map((record) {
        return ListTile(
          leading: const Icon(Icons.water_drop),
          title: Text('${record.amount} مل'),
          subtitle: Text(
              '${record.date.hour}:${record.date.minute.toString().padLeft(2, '0')}'),
          trailing: record.note != null ? Text(record.note!) : null,
        );
      }).toList(),
    );
  }
}