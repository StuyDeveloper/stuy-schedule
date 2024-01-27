import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Schedule> fetchSchedule() async {
  final response = await http.get(
      Uri.parse('https://api-stuyschedule.vercel.app/api/weekly-schedule'));
  if (response.statusCode == 200) {
    return Schedule.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load schedule');
  }
}

class Schedule {
  final List<Day> days;

  const Schedule({
    required this.days,
  });

  factory Schedule.fromJson(dynamic json) {
    return Schedule(
      days: json['days'].map<Day>(Day.fromJson).toList(),
    );
  }
}

class Day {
  final DateTime day;
  final Bell? bell;
  final Block? block;
  final String testing;
  final String? announcement;

  const Day({
    required this.day,
    this.bell,
    this.block,
    required this.testing,
    this.announcement,
  });

  factory Day.fromJson(dynamic json) {
    final block = json['block'] != null
        ? Block.values
            .firstWhere((e) => e.toString() == 'Block.${json['block'].toLowerCase()}')
        : null;
    return Day(
      day: DateFormat('yMMMMd').parse(json['day']),
      bell: json['bell'] == null ? null : Bell.fromJson(json['bell']),
      block: block,
      testing: json['testing'],
      announcement: json['announcement'],
    );
  }
}

enum Block {
  a,
  a1,
  a2,
  b,
  b1,
  b2,
}

class Bell {
  final ScheduleType scheduleType;
  final String scheduleName;
  final List<Period> schedule;

  const Bell({
    required this.scheduleType,
    required this.scheduleName,
    required this.schedule,
  });

  factory Bell.fromJson(dynamic json) {
    return Bell(
      scheduleType: ScheduleType.values.firstWhere(
          (e) => e.toString() == 'ScheduleType.${json['scheduleType']}'),
      scheduleName: json['scheduleName'],
      schedule: json['schedule'].map<Period>(Period.fromJson).toList(),
    );
  }
}

enum ScheduleType {
  regular,
  conference,
  homeroom,
}

class Period {
  final String name;
  final int startTime;
  final int duration;

  const Period({
    required this.name,
    required this.startTime,
    required this.duration,
  });

  factory Period.fromJson(dynamic json) {
    List<String> split = json['startTime'].split(':');
    int hours = int.parse(split[0]);
    int minutes = int.parse(split[1]);

    return Period(
      name: json['name'],
      startTime: hours * 60 + minutes,
      duration: json['duration'],
    );
  }
}
