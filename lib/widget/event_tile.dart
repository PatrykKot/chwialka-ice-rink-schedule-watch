import 'package:chwialka_schedule/model/event_model.dart';
import 'package:flutter/material.dart';

class DayTile extends StatelessWidget {
  const DayTile({Key? key, required this.event}) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var isSlizgawka = event.name.contains('Ślizgawka');

    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        bottom: 5,
        right: 25
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.name,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontSize: 18,
                color: isSlizgawka ? Theme.of(context).colorScheme.secondary : Colors.white),
          ),
          Text(
            '${event.starting.hour}:${event.starting.minute.toString().padRight(2, '0')} - ${event.ending.hour}:${event.ending.minute.toString().padRight(2, '0')}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: isSlizgawka ? Theme.of(context).colorScheme.secondary : Colors.white),
          )
        ],
      ),
    );
  }
}
