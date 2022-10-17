import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yagdabang/controller/UploadContorller.dart';
import 'package:yagdabang/views/mypage.dart';
import 'package:yagdabang/views/search.dart';
import 'package:yagdabang/views/upload.dart';

import '../controller/bottom_nav_controller.dart';
import 'home.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(UploadController());
    return WillPopScope(
        onWillPop: controller.willPopAction,
        child: Obx(
          () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                const Search(),
                const Upload(),
                Container(child: Center(child: Text("복약"))),
                const MyPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "홈",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "검색",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outlined),
                  label: "추가",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined),
                  label: "복약",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: "마이",
                ),
              ],
            ),
          ),
        ));
  }
}
