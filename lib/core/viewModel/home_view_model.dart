import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeViewModel extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onTap(int index) {
    _currentIndex = index;
    update();
  }
}
