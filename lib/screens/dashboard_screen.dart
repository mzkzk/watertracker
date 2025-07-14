import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertracker/services/water_service.dart';
import 'package:watertracker/widgets/consumption_progress.dart';
import 'package:watertracker/widgets/custom_app_bar.dart';
import 'package:watertracker/widgets/drink_button.dart';
import 'package:watertracker/models/water_record.dart';
import 'package:watertracker/generated/l10n.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final waterService = Provider.of<WaterService>(context);
    final todayRecordsFuture = waterService.getTodayRecords();
    final s = S.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: s.dashboardTitle),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConsumptionProgress(
                  currentIntake: waterService.currentIntake,
                  dailyGoal: waterService.dailyGoal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete_forever),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Theme.of(context).colorScheme.onError,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(s.resetTodayRecords),
                        content: Text(s.resetTodayConfirm),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text(MaterialLocalizations.of(context)
                                .cancelButtonLabel),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text(MaterialLocalizations.of(context)
                                .okButtonLabel),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await waterService.resetTodayRecords();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(s.resetTodaySuccess)),
                      );
                    }
                  },
                  label: Text(""),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Text(
                      s.addConsumption,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DrinkButton(
                          amount: 250,
                          label: s.smallCup,
                          icon: Icons.local_drink,
                          onPressed: () => waterService.addWater(250),
                        ),
                        DrinkButton(
                          amount: 500,
                          label: s.largeCup,
                          icon: Icons.local_drink,
                          onPressed: () => waterService.addWater(500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DrinkButton(
                          amount: 1000,
                          label: s.smallBottle,
                          icon: Icons.local_drink,
                          onPressed: () => waterService.addWater(1000),
                        ),
                        DrinkButton(
                          amount: 1500,
                          label: s.largeBottle,
                          icon: Icons.local_drink,
                          onPressed: () => waterService.addWater(1500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
