import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplified_data_architecture/constants.dart';
import 'package:simplified_data_architecture/functions/utils.dart';

SharedPref sharedPref = SharedPref();

class SharedPref {
  late SharedPreferences _instance;
  late Map<String, dynamic> data;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    getData();
  }

  Future<void> getData() async {
    String jsonString =
        _instance.getString(keyInternalData) ?? await saveInternalData();
    Map<String, dynamic> map = fromStringToMap(value: jsonString);
    data = map;
  }

  Future<String> saveInternalData({String jsonString = jsonStringEmpty}) async {
    String jsonStringInitValue = jsonString;
    await _instance.setString(keyInternalData, jsonStringInitValue);
    return jsonStringInitValue;
  }
}
