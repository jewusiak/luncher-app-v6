import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

LatLng? doubleToLatLng(
  double? lat,
  double? lng,
) {
  return (lat == null || lng == null) ? null : LatLng(lat, lng);
}

PlaceDtoStruct? getPlaceByLocation(
  List<PlaceDtoStruct>? places,
  LatLng? loc,
) {
  dynamic calc = (a, b) => math.sqrt(math.pow(a.longitude - b.longitude, 2) +
      math.pow(a.latitude - b.latitude, 2));

  if (loc != null && places != null) {
    var l = places
        .where((e) => e?.location != null)
        .where((e) =>
            e.location!.longitude == loc.longitude &&
            e.location!.latitude == loc.latitude)
        .toList();

    return l.length > 0 ? l[0] : null;
  }
  return null;
}

LocationDtoStruct? latLngToLocationDto(LatLng? location) {
  return location == null
      ? null
      : LocationDtoStruct(
          latitude: location.latitude, longitude: location.longitude);
}

List<LatLng>? placeDtoListToLatLngList(List<PlaceDtoStruct>? places) {
  return places
      ?.where((e) => e.location != null)
      .map((e) => LatLng(e.location.latitude, e.location.longitude))
      .toList();
}

String? addressDtoToString(AddressDtoStruct? addr) {
  return addr == null
      ? null
      : [addr.firstLine, addr.secondLine, addr.district, addr.city]
          .where((e) => e != null && e.isNotEmpty)
          .join(", ");
}

List<AssetDtoStruct> getEmptyAssetList() {
  return [];
}

OpeningInfoStruct? calculatePlaceOpeningInfo(
  PlaceDtoStruct? place,
  DateTime time,
) {
  if (place == null) return null;
  if (place.openingWindows == null || place.openingWindows.isEmpty) {
    return OpeningInfoStruct(
        openState: OpeningState.UNKNOWN, selectedOpeningWindow: null);
  }

  int SECONDS_IN_A_DAY = 86400;
  int SECONDS_IN_A_WEEK = SECONDS_IN_A_DAY * 7;

  int nowInInt = (time.weekday - 1) * SECONDS_IN_A_DAY +
      time.hour * 3600 +
      time.minute * 60 +
      time.second;

// FUNCTIONS

  var wdToInt = (WeekDayTimeDtoStruct s) {
    int d = 0;
    switch (s.day) {
      case "MONDAY":
        d = 0;
        break;
      case "TUESDAY":
        d = 1;
        break;
      case "WEDNESDAY":
        d = 2;
        break;
      case "THURSDAY":
        d = 3;
        break;
      case "FRIDAY":
        d = 4;
        break;
      case "SATURDAY":
        d = 5;
        break;
      case "SUNDAY":
        d = 6;
        break;
      default:
        throw Exception("Unknown day " + s.day);
    }
    List<String> parts = s.time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    // Parsowanie sekund (jeśli są obecne)
    int second = parts.length > 2 ? int.parse(parts[2]) : 0;
    return d * SECONDS_IN_A_DAY + hour * 3600 + minute * 60 + second;
  };

  var within = (int now, int start, int end) {
    int endTime = start > end ? end + SECONDS_IN_A_WEEK : end;
    return (start <= now && now < endTime) ||
        (start <= now + SECONDS_IN_A_WEEK && now + SECONDS_IN_A_WEEK < endTime);
  };

  var swPlDay = (String dayName) {
    switch (dayName) {
      case "MONDAY":
        return "Pon.";
      case "TUESDAY":
        return "Wt.";
      case "WEDNESDAY":
        return "Śr.";
      case "THURSDAY":
        return "Czw.";
      case "FRIDAY":
        return "Pt.";
      case "SATURDAY":
        return "Sob.";
      case "SUNDAY":
        return "Ndz.";
      default:
        throw Exception("Unknown day " + dayName);
    }
  };

  var translateToPl = (WeekDayTimeRangeDtoStruct? str) {
    if (str == null) return null;
    str.startTime.day = swPlDay(str.startTime.day);
    str.endTime.day = swPlDay(str.endTime.day);
    return str;
  };

  // END of FUNCTIONS

  List<WeekDayTimeRangeDtoStruct> selectedStrL = place.openingWindows
      .where(
          (ow) => within(nowInInt, wdToInt(ow.startTime), wdToInt(ow.endTime)))
      .toList();
  WeekDayTimeRangeDtoStruct? selectedStr =
      selectedStrL.length == 0 ? null : selectedStrL[0];
  if (selectedStr != null) {
    return OpeningInfoStruct(
        openState: OpeningState.OPEN,
        selectedOpeningWindow: translateToPl(selectedStr));
  }

  var selected = place.openingWindows
      .where((ow) => wdToInt(ow.startTime) >= nowInInt)
      .toList();
  selected.sort((ow1, ow2) => wdToInt(ow1.startTime) - wdToInt(ow2.startTime));

  var sortedOws = place.openingWindows.map((e) => e).toList();
  sortedOws.sort((ow1, ow2) => wdToInt(ow1.startTime) - wdToInt(ow2.startTime));

  var a = OpeningInfoStruct(
      openState: OpeningState.CLOSED,
      selectedOpeningWindow:
          translateToPl(selected.isEmpty ? sortedOws.first : selected.first));

  return a;
}

List<String>? addStringToList(
  String? str,
  List<String>? list,
) {
  if (list == null) return str == null ? [] : [str];
  if (str == null) return list;
  list.add(str);
  return list;
}

List<String> getEmptyStringList() {
  return [];
}

String? dayOfWeekEnglishToPolish(String? english) {
  final days = {
    "MONDAY": "Poniedziałek",
    "TUESDAY": "Wtorek",
    "WEDNESDAY": "Środa",
    "THURSDAY": "Czwartek",
    "FRIDAY": "Piątek",
    "SATURDAY": "Sobota",
    "SUNDAY": "Niedziela"
  };
  if (english == null) return null;

  return days[english];
}
