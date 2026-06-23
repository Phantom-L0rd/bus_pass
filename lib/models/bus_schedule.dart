import 'package:flutter/rendering.dart';

enum ScheduleType { normal, grocery }

enum ScheduleDirection { toCampus, fromCampus }

class BusScheduleItem {
  final String time;
  final List<String> stops;
  final int busCount;
  final ScheduleDirection? direction; // Null for special trips like Grocery
  final String routeName;
  final ScheduleType type;

  const BusScheduleItem({
    required this.time,
    required this.stops,
    required this.busCount,
    this.direction,
    required this.routeName,
    required this.type,
  });

  // Converts '06:00' to a DateTime object for today to compare with DateTime.now()
  DateTime getParsedTime(DateTime contextDate) {
    final parts = time.split(':');
    return DateTime(
      contextDate.year,
      contextDate.month,
      contextDate.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }
}

class BusScheduleData {
  static List<BusScheduleItem> _weekdayNormal = [
    // Madeira inbound
    BusScheduleItem(
        time: '06:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '06:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 4,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '10:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    // Madeira outbound
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 3,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '14:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '14:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '15:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '15:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '17:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '18:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '19:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '19:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '22:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),

    // Town residences inbound (snipped for brevity, add your Arebeng/Drie Lillies here exactly like this:)
    BusScheduleItem(
        time: '06:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '06:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '06:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '06:30',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '06:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:30',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '10:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:00',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 3',
        type: ScheduleType.normal),

    // Town residences outbound
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Town residences'],
        busCount: 3,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '12:30',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '14:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '14:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '15:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '15:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:30',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '17:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '17:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '18:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '18:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '19:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '19:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '22:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
  ];

  static List<BusScheduleItem> _saturdayNormal = [
    BusScheduleItem(
        time: '07:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    // Outbound
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Arebeng 3,2 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Arebeng 3,2 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Arebeng 3,2 & 1',
        type: ScheduleType.normal),
  ];

  static List<BusScheduleItem> _sundayNormal = [
    BusScheduleItem(
        time: '08:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Drie Lillies',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: ScheduleDirection.toCampus,
        routeName: 'Arebeng 2 via 3 & 1',
        type: ScheduleType.normal),
    // Outbound
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Madeira',
        type: ScheduleType.normal),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: ScheduleDirection.fromCampus,
        routeName: 'Town',
        type: ScheduleType.normal),
  ];

  static List<BusScheduleItem> _grocery = [
    // Fixed: Direction is null here because it doesn't go to/from campus directly
    BusScheduleItem(
        time: '10:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 2,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '11:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 2,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '12:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 1,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '11:30',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 1,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '13:00',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 2,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '15:00',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 2,
        direction: null,
        routeName: 'Madeira Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '10:00',
        stops: ['Campus', 'Town'],
        busCount: 2,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '11:00',
        stops: ['Campus', 'Town'],
        busCount: 2,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Town'],
        busCount: 1,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '14:00',
        stops: ['Town', 'Campus'],
        busCount: 2,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '16:00',
        stops: ['Town', 'Campus'],
        busCount: 2,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
    BusScheduleItem(
        time: '17:00',
        stops: ['Town', 'Campus'],
        busCount: 1,
        direction: null,
        routeName: 'Campus Grocery',
        type: ScheduleType.grocery),
  ];

  static List<BusScheduleItem> getScheduleForDate(DateTime date) {
    final weekday = date.weekday;

    List<BusScheduleItem> baseSchedule = [];
    if (weekday == DateTime.saturday) {
      baseSchedule = _saturdayNormal;
    } else if (weekday == DateTime.sunday) {
      baseSchedule = _sundayNormal;
    } else {
      baseSchedule = _weekdayNormal;
    }

    // Grocery usually runs every day, add it to the base
    return [...baseSchedule, ..._grocery];
  }
}
