import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewBoard extends StatelessWidget {
  const NewBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(Get.arguments["selectedImage"]),
    );
  }
}
