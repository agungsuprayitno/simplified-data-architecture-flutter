import 'package:simplified_data_architecture/data/notifiers/manage_notifiers.dart';
import 'package:simplified_data_architecture/data/shared_pref.dart';

Future<void> initApp() async {
  await initSharedPref();
  await initDataNotifier();
}

Future<void> initSharedPref() async {
  //  Todo: init the shared preference
  sharedPref.init();
}

Future<void> initDataNotifier() async {
  await setDataNotifier();
}
