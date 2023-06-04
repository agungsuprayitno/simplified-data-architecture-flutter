import 'dart:convert';

import 'package:simplified_data_architecture/constants.dart';
import 'package:simplified_data_architecture/models/data_model.dart';

Map<String, dynamic> fromStringToMap({required String value}) {
  Map<String, dynamic> map = json.decode(value);
  return map;
}

String fromMapToString({required Map<String, dynamic> map}) {
  String jsonString = json.encode(map);
  return jsonString;
}

DataModel fromMapToDataModel({required Map<String, dynamic> map}) {
  return DataModel(
    activity: map[kActivity],
    type: map[kType],
    participants: map[kParticipants],
    price: map[kPrice].toString(),
    link: map[kLink],
    key: map[kKey],
    accessibility: map[kAccessibility].toString(),
  );
}
