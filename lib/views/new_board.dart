import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yagdabang/service/board_service.dart';
import 'package:yagdabang/service/file_service.dart';
import 'package:yagdabang/views/home.dart';

import '../controller/UploadContorller.dart';

class NewBoard extends GetView<UploadController> {
  RxBool on1 = false.obs;
  RxBool on2 = false.obs;
  RxBool on3 = false.obs;
  RxBool on4 = false.obs;
  RxBool on5 = false.obs;
  void toggle1() => on1.value = on1.value ? false : true;
  void toggle2() => on2.value = on2.value ? false : true;
  void toggle3() => on3.value = on3.value ? false : true;
  void toggle4() => on4.value = on4.value ? false : true;
  void toggle5() => on5.value = on5.value ? false : true;

  NewBoard({Key? key}) : super(key: key);
  // BoardService boardService = BoardService();

  Widget _description() {
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Image.file(
            controller.filteredImage!,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: TextField(
          maxLines: null,
          controller: controller.textEditingController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: "문구입력 ....."),
        ))
      ],
    );
  }

  Widget infoOnt(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  Widget get line => const Divider(
        color: Colors.grey,
      );
  Widget snsInfo() {
    NewBoard sx =
        Get.put(NewBoard()); // Instantiate Get Controller, *in* build()

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("고혈압", style: TextStyle(fontSize: 17)),
              Obx(
                () => Switch(
                    onChanged: (val) => sx.toggle1(), value: sx.on1.value),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("대장암", style: TextStyle(fontSize: 17)),
              Obx(
                () => Switch(
                    onChanged: (val) => sx.toggle2(), value: sx.on2.value),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("백혈병", style: TextStyle(fontSize: 17)),
              Obx(
                () => Switch(
                    onChanged: (val) => sx.toggle3(), value: sx.on3.value),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("혈우병", style: TextStyle(fontSize: 17)),
              Obx(
                () => Switch(
                    onChanged: (val) => sx.toggle4(), value: sx.on4.value),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("희귀병", style: TextStyle(fontSize: 17)),
              Obx(
                () => Switch(
                    onChanged: (val) => sx.toggle5(), value: sx.on5.value),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "새 게시물",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              String fileName =
                  await saveImageToLocalDirectory(controller.filteredImage!);
              // boardService.save(
              //     fileName, controller.textEditingController.text);
              // Get.to(Home());
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: Container(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _description(),
                    line,
                    infoOnt("구독중인 카페"),
                    snsInfo(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
