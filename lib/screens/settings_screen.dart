import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertracker/services/notification_service.dart';
import 'package:watertracker/services/water_service.dart';
import 'package:watertracker/widgets/custom_app_bar.dart';
import 'package:watertracker/generated/l10n.dart';
import 'package:watertracker/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _goalController = TextEditingController();
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    final waterService = Provider.of<WaterService>(context, listen: false);
    _goalController.text = waterService.dailyGoal.toString();
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final waterService = Provider.of<WaterService>(context);
    final notificationService = Provider.of<NotificationService>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final s = S.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: s.settings),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.flag),
                      title: Text(s.dailyGoal),
                      subtitle: TextField(
                        controller: _goalController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: s.enterDailyGoal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      onPressed: () {
                        final newGoal =
                            int.tryParse(_goalController.text) ?? 2000;
                        waterService.setDailyGoal(newGoal);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(s.goalUpdated)),
                        );
                      },
                      label: Text(s.saveGoal),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.notifications_active),
                title: Text(s.reminders),
                subtitle: Text(s.receiveReminders),
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) async {
                    setState(() => _notificationsEnabled = value);
                    if (value) {
                      await notificationService.scheduleDailyReminders();
                    } else {
                      await notificationService.cancelAllNotifications();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Text(s.language),
                trailing: DropdownButton<Locale>(
                  value: localeProvider.locale,
                  items: [
                    DropdownMenuItem(
                      value: const Locale('ar'),
                      child: Text(s.arabic),
                    ),
                    DropdownMenuItem(
                      value: const Locale('en'),
                      child: Text(s.english),
                    ),
                  ],
                  onChanged: (locale) {
                    if (locale != null) localeProvider.setLocale(locale);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.brightness_6),
                title: Text(s.theme),
                trailing: DropdownButton<ThemeMode>(
                  value: themeProvider.themeMode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(s.system),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(s.light),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(s.dark),
                    ),
                  ],
                  onChanged: (mode) {
                    if (mode != null) themeProvider.setThemeMode(mode);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
