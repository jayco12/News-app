import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt currentIntegerIndex = 0.obs;
  void swipePage(int index, CarouselPageChangedReason reason) {
    currentIntegerIndex.value = index;
    update();
  }
}
