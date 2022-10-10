import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      this.size})
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
        child: type2Widget()));
  }
  Widget type2Widget(){
   return Container(

     width: 75,height: 75,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color:Colors.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: CachedNetworkImage(
          imageUrl: thumPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget type3Widget(){
    return Row(
      children: [
        Container(
        width: 40,
        height: 40,
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
           )),
        Text(nickname ?? '',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.type1:
        return type1Widget();
        break;
      case AvatarType.type2:
        return type2Widget();
      case AvatarType.type3:
        return type3Widget();
        break;
    }
    return Container();
  }
}
