import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  void changePage(int index) => _currentIndex.value = index;

  int get currcentPage => _currentIndex.value;
}
