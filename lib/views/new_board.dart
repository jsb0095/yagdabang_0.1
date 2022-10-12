import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yagdabang/service/board_service.dart';
import 'package:yagdabang/service/file_service.dart';
import 'package:yagdabang/views/home.dart';

import '../controller/UploadContorller.dart';

class NewBoard extends GetView<UploadController> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Facebook", style: TextStyle(fontSize: 17)),
              Switch(value: false, onChanged: (bool value) {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Twitter", style: TextStyle(fontSize: 17)),
              Switch(value: false, onChanged: (bool value) {}),
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
                    infoOnt("사람태그하기"),
                    line,
                    infoOnt("위치추가"),
                    line,
                    infoOnt("다른 미디어에서도 게시"),
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
