import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertracker/models/water_record.dart';
import 'package:watertracker/services/water_service.dart';
import 'package:watertracker/widgets/custom_app_bar.dart';
import 'package:watertracker/widgets/history_item.dart';
import 'package:watertracker/generated/l10n.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final waterService = Provider.of<WaterService>(context);
    final s = S.of(context);
    return FutureBuilder<List<WaterRecord>>(
      future: waterService.getAllRecords(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(
            appBar: CustomAppBar(title: s.consumptionHistory),
            body: Center(child: Text(s.noHistory)),
          );
        }
        final records = snapshot.data!;
        // Group records by date
        Map<DateTime, List<WaterRecord>> groupedRecords = {};
        for (var record in records) {
          final date =
              DateTime(record.date.year, record.date.month, record.date.day);
          if (!groupedRecords.containsKey(date)) {
            groupedRecords[date] = [];
          }
          groupedRecords[date]!.add(record);
        }
        // Sort dates in descending order
        final sortedDates = groupedRecords.keys.toList()
          ..sort((a, b) => b.compareTo(a));
        return Scaffold(
          appBar: CustomAppBar(title: s.consumptionHistory),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: sortedDates.length,
            separatorBuilder: (context, i) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final date = sortedDates[index];
              final dailyRecords = groupedRecords[date]!;
              final total =
                  dailyRecords.fold(0, (sum, record) => sum + record.amount);
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HistoryItem(
                    date: date,
                    total: total,
                    records: dailyRecords,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
