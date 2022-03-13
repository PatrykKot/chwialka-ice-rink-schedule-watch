import 'dart:ui';

import 'package:chwialka_schedule/model/day_model.dart';
import 'package:flutter/material.dart';

import 'event_tile.dart';

class DayTab extends StatelessWidget {
  const DayTab({Key? key, required this.dayModel, required this.date})
      : super(key: key);

  final DayModel dayModel;

  final DateTime date;

  bool isToday(DayModel dayModel) {
    final now = DateTime.now();

    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String findDateText(DayModel dayModel) {
    return '${date.day.toString()} ${monthName(date.month - 1)}';
  }

  String monthName(int month) {
    return [
      'styczeń',
      'luty',
      'marzec',
      'kwiecień',
      'maj',
      'czerwiec',
      'lipiec',
      'sierpień',
      'październik',
      'listopad',
      'grudzień'
    ][month - 1];
  }

  String dayOfTheWeekName(int dayOfTheWeek) {
    return [
      'Poniedziałek',
      'Wtorek',
      'Środa',
      'Czwartek',
      'Piątek',
      'Sobota',
      'Niedziela'
    ][dayOfTheWeek];
  }

  @override
  Widget build(BuildContext context) {
    var today = isToday(dayModel);

    return Column(
      children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              dayOfTheWeekName(date.weekday - 1),
              style: TextStyle(
                  color: today ? Colors.green : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              findDateText(dayModel),
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: dayModel.events.length,
                itemBuilder: (context, index) {
                  final event = dayModel.events[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DayTile(event: event),
                      if(index == dayModel.events.length - 1) const SizedBox(height: 30,)
                    ],
                  );
                }))
      ],
    );
  }
}
