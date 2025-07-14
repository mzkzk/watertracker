import 'package:flutter/material.dart';

class ConsumptionProgress extends StatelessWidget {
  final int currentIntake;
  final int dailyGoal;

  const ConsumptionProgress({
    super.key,
    required this.currentIntake,
    required this.dailyGoal,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = dailyGoal > 0 ? currentIntake / dailyGoal : 0;
    final percentageText = '${(percentage * 100).toStringAsFixed(1)}%';

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(
                value: percentage > 1 ? 1 : percentage.toDouble(),
                strokeWidth: 15,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(percentage.toDouble()),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  '$currentIntake / $dailyGoal مل',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  percentageText,
                  style: TextStyle(
                    fontSize: 16,
                    color: _getProgressColor(percentage.toDouble()),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          _getMotivationalMessage(percentage.toDouble()),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage < 0.3) return Colors.red;
    if (percentage < 0.7) return Colors.orange;
    if (percentage < 1) return Colors.lightGreen;
    return Colors.green;
  }

  String _getMotivationalMessage(double percentage) {
    if (percentage == 0) return 'ابدأ بشرب الماء الآن!';
    if (percentage < 0.3) return 'استمر، يمكنك فعل ذلك!';
    if (percentage < 0.7) return 'جيد، لكن يمكنك فعل المزيد!';
    if (percentage < 1) return 'رائع! أنت على وشك تحقيق هدفك!';
    return 'ممتاز! لقد حققت هدفك اليوم!';
  }
}
