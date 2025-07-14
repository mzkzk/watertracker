// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Water Tracker`
  String get appTitle {
    return Intl.message('Water Tracker', name: 'appTitle', desc: '', args: []);
  }

  /// `Water Consumption Tracker`
  String get dashboardTitle {
    return Intl.message(
      'Water Consumption Tracker',
      name: 'dashboardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Consumption`
  String get addConsumption {
    return Intl.message(
      'Add Consumption',
      name: 'addConsumption',
      desc: '',
      args: [],
    );
  }

  /// `Small Cup`
  String get smallCup {
    return Intl.message('Small Cup', name: 'smallCup', desc: '', args: []);
  }

  /// `Large Cup`
  String get largeCup {
    return Intl.message('Large Cup', name: 'largeCup', desc: '', args: []);
  }

  /// `Small Bottle`
  String get smallBottle {
    return Intl.message(
      'Small Bottle',
      name: 'smallBottle',
      desc: '',
      args: [],
    );
  }

  /// `Large Bottle`
  String get largeBottle {
    return Intl.message(
      'Large Bottle',
      name: 'largeBottle',
      desc: '',
      args: [],
    );
  }

  /// `Today's Log`
  String get todayLog {
    return Intl.message('Today\'s Log', name: 'todayLog', desc: '', args: []);
  }

  /// `No records for today`
  String get noRecordsToday {
    return Intl.message(
      'No records for today',
      name: 'noRecordsToday',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Daily Goal (ml)`
  String get dailyGoal {
    return Intl.message(
      'Daily Goal (ml)',
      name: 'dailyGoal',
      desc: '',
      args: [],
    );
  }

  /// `Enter your daily goal in milliliters`
  String get enterDailyGoal {
    return Intl.message(
      'Enter your daily goal in milliliters',
      name: 'enterDailyGoal',
      desc: '',
      args: [],
    );
  }

  /// `Save Goal`
  String get saveGoal {
    return Intl.message('Save Goal', name: 'saveGoal', desc: '', args: []);
  }

  /// `Daily goal updated`
  String get goalUpdated {
    return Intl.message(
      'Daily goal updated',
      name: 'goalUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders {
    return Intl.message('Reminders', name: 'reminders', desc: '', args: []);
  }

  /// `Receive reminders to drink water throughout the day`
  String get receiveReminders {
    return Intl.message(
      'Receive reminders to drink water throughout the day',
      name: 'receiveReminders',
      desc: '',
      args: [],
    );
  }

  /// `Consumption History`
  String get consumptionHistory {
    return Intl.message(
      'Consumption History',
      name: 'consumptionHistory',
      desc: '',
      args: [],
    );
  }

  /// `No records found`
  String get noHistory {
    return Intl.message(
      'No records found',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System Default`
  String get system {
    return Intl.message('System Default', name: 'system', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Main`
  String get Main {
    return Intl.message('Main', name: 'Main', desc: '', args: []);
  }

  /// `History`
  String get History {
    return Intl.message('History', name: 'History', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Reset Today's Records`
  String get resetTodayRecords {
    return Intl.message(
      'Reset Today\'s Records',
      name: 'resetTodayRecords',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete today's consumption records? This cannot be undone.`
  String get resetTodayConfirm {
    return Intl.message(
      'Are you sure you want to delete today\'s consumption records? This cannot be undone.',
      name: 'resetTodayConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Today's records have been reset.`
  String get resetTodaySuccess {
    return Intl.message(
      'Today\'s records have been reset.',
      name: 'resetTodaySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add Custom Amount`
  String get addCustomAmount {
    return Intl.message(
      'Add Custom Amount',
      name: 'addCustomAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enterAmount {
    return Intl.message(
      'Enter amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid amount`
  String get enterValidAmount {
    return Intl.message(
      'Please enter a valid amount',
      name: 'enterValidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Goal reached!`
  String get goalReached {
    return Intl.message(
      'Goal reached!',
      name: 'goalReached',
      desc: '',
      args: [],
    );
  }

  /// `Keep going!`
  String get keepGoing {
    return Intl.message('Keep going!', name: 'keepGoing', desc: '', args: []);
  }

  /// `Record deleted`
  String get recordDeleted {
    return Intl.message(
      'Record deleted',
      name: 'recordDeleted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
