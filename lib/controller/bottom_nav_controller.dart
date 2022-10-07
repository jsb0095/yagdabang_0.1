import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/upload.dart';
import '../components/messgae_pop_up.dart';

enum PageName { home, search, add, drug, myPage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.home:
        _changePage(value);
        break;
      case PageName.search:
        _changePage(value);
        break;
      case PageName.add:
        Get.to(Upload());
        break;
      case PageName.drug:
        _changePage(value);
        break;
      case PageName.myPage:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) {
      return;
    }
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopUp(
                title: "약다방",
                message: "종료하시겠습니까?",
                ok: () {
                  exit(0);
                },
                cancel: Get.back,
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index);
      return false;
    }
  }
}
