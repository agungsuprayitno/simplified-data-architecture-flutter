import 'package:flutter/cupertino.dart';
import 'package:simplified_data_architecture/models/data_model.dart';

ValueNotifier<DataModel> dataNotifier = ValueNotifier(
  DataModel(
    activity: 'Activity',
    type: 'Type',
    participants: 0,
    price: '0',
    link: 'Link',
    key: 'Key',
    accessibility: '0',
  ),
);
ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
