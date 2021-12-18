import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final DateTime dateTime;
  const DateCard(this.dateTime, {Key? key}) : super(key: key);

  final dateStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.indigoAccent,
    fontSize: 16,
  );

  String _buildDateTimeString(DateTime d) {
    return '${d.day}.${d.month}.${d.year} at ${d.hour}h00';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.indigoAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          _buildDateTimeString(dateTime),
          style: dateStyle,
        ),
      ),
    );
  }
}
