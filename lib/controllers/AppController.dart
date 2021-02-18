import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxInt pageNumber = RxInt(0);
  Rx<PageController> pageController;

  RxString greetingMessage = RxString("Good Morning!");

  RxString currentFilter = RxString("Today");
  RxString currentStatType = RxString("Wallets");

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: pageNumber.value).obs;
    changeGreeting();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.close();
  }

  changeGreeting() {
    DateTime timeNow = DateTime.now();
    int hour = timeNow.hour;
    print(hour);
    if (hour >= 5 && hour <= 12) {
      greetingMessage.value = "Good Morning!";
    } else if (hour > 12 && hour < 18) {
      greetingMessage.value = "Good Afternoon!";
    } else {
      greetingMessage.value = "Good Evening!";
    }
  }

  onPageChanged(input) {
    pageNumber.value = input;
  }

  animate() {
    pageController.value.animateToPage(pageNumber.value,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  updateFilter(String newValue) {
    currentFilter.value = newValue;
    update();
  }
  
  updateStatesType(String newValue) {
    currentStatType.value = newValue;
    update();
  }
}
