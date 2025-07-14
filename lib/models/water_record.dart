class WaterRecord {
  final DateTime date;
  final int amount;
  final String? note;

  WaterRecord({
    required this.date,
    required this.amount,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'amount': amount,
      'note': note,
    };
  }

  factory WaterRecord.fromMap(Map<String, dynamic> map) {
    return WaterRecord(
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      note: map['note'],
    );
  }
}
