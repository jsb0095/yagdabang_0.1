import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

enum AvatarType { type1, type2, type3 }

class AvatarWidget extends StatelessWidget {
  bool? history;
  String thumPath;
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget(
      {Key? key,
      this.history,
      required this.thumPath,
      this.nickname,
      required this.type,
      this.size, })
      : super();

  Widget type1Widget() {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffff9000),
              Color(0xffac11ff),
            ],
          ),
          shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: Container(
          width: 65,
          height: 65,
          child: CachedNetworkImage(
            imageUrl: thumPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.type1:
        return type1Widget();
        break;
      case AvatarType.type2:
      case AvatarType.type3:
        return Container();
        break;
    }
    return Container();
  }
}
