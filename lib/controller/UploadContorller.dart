import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import 'package:yagdabang/views/new_board.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/filters/preset_filters.dart';
import 'dart:io';

import '../utils/data_util.dart';

class UploadController extends GetxController {
  var albums = <AssetPathEntity>[];
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxString headerTitle = "".obs;
  Rx<AssetEntity> selectedImage =
      AssetEntity(id: '', typeInt: 0, width: 0, height: 0).obs;
  TextEditingController textEditingController = TextEditingController();
  File? filteredImage;

  @override
  void onInit() {
    super.onInit();
    _loadPhotos();
  }

  _loadPhotos() async {
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
            imageOption: const FilterOption(
              sizeConstraint: SizeConstraint(minWidth: 100, minHeight: 100),
            ),
            orders: [
              const OrderOption(type: OrderOptionType.createDate, asc: false),
            ]),
      );
      _loadData();
    } else {}
  }

  void _loadData() async {
    changeAlbum(albums.first);
    // update();
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    imageList.clear();
    var photos = await albums.first.getAssetListPaged(page: 0, size: 20);
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }

  void gotoImageFilter() async {
    var file = await selectedImage.value.file;
    var fileName = basename(file!.path);
    var image = imageLib.decodeImage(file.readAsBytesSync());
    image = imageLib.copyResize(image!, width: 1000);
    var imageFile = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => PhotoFilterSelector(
          title: const Text('필터'),
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imageFile != null && imageFile.containsKey('image_filtered')) {
      filteredImage = imageFile['image_filtered'];
      Get.to(() => NewBoard());
    }
  }

  void changeAlbum(AssetPathEntity album) async {
    headerTitle(album.name);
    await _pagingPhotos(album);
  }

  void unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // void uplaodPost() {
  //   unfocusKeyboard();
  //   var filename = DataUtil.makeFilePath();
  //   var task = uploadFile(filteredImage!, '/"fewfewfew"/$filename');
  //   if (task != null) {
  //     task.snapshotEvents.listen(
  //       (event) async {
  //         if (event.bytesTransferred == event.totalBytes &&
  //             event.state == TaskState.success) {
  //           var downloadUrl = await event.ref.getDownloadURL();
  //           var updatedPost = post!.copyWith(
  //             thumbnail: downloadUrl,
  //             description: textEditingController.text,
  //           );
  //           _submitPost(updatedPost);
  //         }
  //       },
  //     );
  //   }
  // }

//   UploadTask uploadFile(File file, String filename) {
//     var ref = FirebaseStorage.instance.ref().child('instagram').child(filename);
//     final metadata = SettableMetadata(
//         contentType: 'image/jpeg',
//         customMetadata: {'picked-file-path': file.path});
//     return ref.putFile(file, metadata);
//   }
//
//   void _submitPost(Post postData) async {
//     await PostRepository.updatePost(postData);
//     showDialog(
//       context: Get.context!,
//       builder: (context) => MessagePopup(
//         title: '포스트',
//         message: '포스팅이 완료 되었습니다.',
//         okCallback: () {
//           Get.until((route) => Get.currentRoute == '/');
//         },
//       ),
//     );
//   }
}
