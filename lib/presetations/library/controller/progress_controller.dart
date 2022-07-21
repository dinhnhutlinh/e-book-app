import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

class ProgressController extends GetxController {
  Future<int> getProgressBook(String bookId) async {
    Box db = await Hive.openBox('progress');
    int? value = db.get(bookId);
    if (value != null) {
      return value;
    }
    return 0;
  }

  Future<void> addProgressBook(String bookId, int index) async {
    Box db = await Hive.openBox('progress');
    db.put(bookId, index);
  }
}
