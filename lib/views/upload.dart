import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:yagdabang/controller/UploadContorller.dart';

import 'new_board.dart';

class Upload extends GetView<UploadController> {
  Upload({Key? key}) : super(key: key);

  Widget _imagePreview() {
    var width = Get.width;
    return Obx(
          () => Container(
        width: width,
        height: width,
        color: Colors.grey,
        child: _photoWidget(controller.selectedImage.value, width.toInt(),
            builder: (data) {
              return Image.memory(
                data,
                fit: BoxFit.cover,
              );
            }),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: Get.context!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                isScrollControlled:
                controller.albums.length > 10 ? true : false,
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(Get.context!).size.height -
                        MediaQuery.of(Get.context!).padding.top),
                builder: (_) => Container(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                          controller.albums.length,
                              (index) => GestureDetector(
                            onTap: () {
                              controller
                                  .changeAlbum(controller.albums[index]);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Text(controller.albums[index].name),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Obx(
                        () => Text(
                      controller.headerTitle.value,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: const [
                    Icon(Icons.check_outlined),
                    Text("여러 항목 선택")
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return Obx(
          () => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1),
          itemCount: controller.imageList.length,
          itemBuilder: (BuildContext context, int index) {
            return _photoWidget(controller.imageList[index], 200,
                builder: (data) {
                  return GestureDetector(
                    onTap: () {
                      controller.changeSelectedImage(controller.imageList[index]);
                      // update();
                    },
                    child: Obx(
                          () => Opacity(
                        opacity: controller.imageList[index] ==
                            controller.selectedImage.value
                            ? 0.3
                            : 1,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget _photoWidget(AssetEntity assetEntity, int size,
      {required Widget Function(Uint8List) builder}) {
    return FutureBuilder(
        future: assetEntity.thumbnailDataWithSize(ThumbnailSize(size, size)),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return builder(snapshot.data!);
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "사진",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              onPressed: () {
                controller.gotoImageFilter();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
