import 'package:flutter/material.dart';

class BusScheduleItem {
  final String time;
  final List<String> stops;
  final int busCount;
  final String direction; // "toCampus" or "fromCampus"
  final String routeName;

  const BusScheduleItem({
    required this.time,
    required this.stops,
    required this.busCount,
    required this.direction,
    required this.routeName,
  });
}

class BusScheduleData {
  static List<BusScheduleItem> _weekdayNormal = [
    // Madeira inbound
    BusScheduleItem(
        time: '06:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '06:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 4,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '07:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '08:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '09:30',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '10:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Pretoria West residence', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira'),
    // Madeira outbound
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 3,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '12:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '14:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '14:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '15:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '15:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '16:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '17:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '18:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '19:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '19:30',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '22:00',
        stops: ['Campus', 'Pretoria West residence'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    // Town residences inbound
    BusScheduleItem(
        time: '06:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '06:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    BusScheduleItem(
        time: '06:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '06:30',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 1'),
    BusScheduleItem(
        time: '06:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '07:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '07:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '08:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '08:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '09:30',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '09:30',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 1'),
    BusScheduleItem(
        time: '09:30',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '10:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 1'),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 2', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2'),
    BusScheduleItem(
        time: '10:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Arebeng 2', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 1'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Arebeng 3', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 3'),
    // Town residences outbound
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Town residences'],
        busCount: 3,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '12:30',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '13:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '14:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '14:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '15:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '15:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '16:30',
        stops: ['Campus', 'Town residences'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '17:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '17:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '18:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '18:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '19:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '19:30',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '22:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
  ];

  static List<BusScheduleItem> _saturdayNormal = [
    BusScheduleItem(
        time: '07:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '07:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    // Outbound
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Arebeng 3,2 & 1'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Arebeng 3,2 & 1'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Drie Lillies'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Arebeng 3', 'Arebeng 2', 'Arebeng 1'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Arebeng 3,2 & 1'),
  ];

  static List<BusScheduleItem> _sundayNormal = [
    BusScheduleItem(
        time: '08:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '08:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Madeira', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Drie Lillies', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Drie Lillies'),
    BusScheduleItem(
        time: '09:00',
        stops: ['Arebeng 2', 'Arebeng 3', 'Arebeng 1', 'Campus'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Arebeng 2 via 3 & 1'),
    // Outbound
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira'),
    BusScheduleItem(
        time: '20:00',
        stops: ['Campus', 'Town residences'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Town'),
  ];

  static List<BusScheduleItem> _grocery = [
    // Madeira Grocery outbound
    BusScheduleItem(
        time: '10:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira Grocery'),
    BusScheduleItem(
        time: '11:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Madeira Grocery'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Madeira', 'Quagga Shopping Centre'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Madeira Grocery'),
    // Madeira Grocery return
    BusScheduleItem(
        time: '11:30',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Madeira Grocery'),
    BusScheduleItem(
        time: '13:00',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Madeira Grocery'),
    BusScheduleItem(
        time: '15:00',
        stops: ['Quagga Shopping Centre', 'Madeira'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Madeira Grocery'),
    // Campus Grocery outbound
    BusScheduleItem(
        time: '10:00',
        stops: ['Campus', 'Town'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Campus Grocery'),
    BusScheduleItem(
        time: '11:00',
        stops: ['Campus', 'Town'],
        busCount: 2,
        direction: 'toCampus',
        routeName: 'Campus Grocery'),
    BusScheduleItem(
        time: '12:00',
        stops: ['Campus', 'Town'],
        busCount: 1,
        direction: 'toCampus',
        routeName: 'Campus Grocery'),
    // Campus Grocery return
    BusScheduleItem(
        time: '14:00',
        stops: ['Town', 'Campus'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Campus Grocery'),
    BusScheduleItem(
        time: '16:00',
        stops: ['Town', 'Campus'],
        busCount: 2,
        direction: 'fromCampus',
        routeName: 'Campus Grocery'),
    BusScheduleItem(
        time: '17:00',
        stops: ['Town', 'Campus'],
        busCount: 1,
        direction: 'fromCampus',
        routeName: 'Campus Grocery'),
  ];

  static List<BusScheduleItem> getNormalSchedule(String dayKey) {
    String dayType;
    if (dayKey == 'today') {
      final now = DateTime.now();
      final weekday = now.weekday;
      if (weekday == DateTime.saturday) dayType = 'saturday';
      else if (weekday == DateTime.sunday) dayType = 'sunday';
      else dayType = 'weekday';
    } else {
      if (dayKey == 'saturday') dayType = 'saturday';
      else if (dayKey == 'sunday') dayType = 'sunday';
      else dayType = 'weekday';
    }

    if (dayType == 'weekday') return _weekdayNormal;
    if (dayType == 'saturday') return _saturdayNormal;
    return _sundayNormal;
  }

  static List<BusScheduleItem> getGrocerySchedule() {
    return _grocery;
  }
}
