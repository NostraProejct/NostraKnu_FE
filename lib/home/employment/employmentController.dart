import 'package:get/get.dart';

class EmploymentController extends GetxController {
  static EmploymentController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}