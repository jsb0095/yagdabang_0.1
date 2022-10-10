import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yagdabang/components/avatar_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            thumPath:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6gBc7B6Wfhcl58kElznvZlIDXrntcKIHXcw&usqp=CAU",
            type: AvatarType.type3,
            nickname: '닉네임',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.menu,
                size: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4XTbOQshLaf-ljy6SZtztsZfaApKtoRG5tIv0KhRyBaWqe4Z3KPVIvnz_CmrTyeOiBU&usqp=CAU',fit: BoxFit.cover,),
      ],
    );
  }

  Widget _infoCount() {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up_alt)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.question_answer_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
      ],
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text("힘내요 250개", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          ExpandableText(
            "댓글자리입니다\n댓글자리입니다\n댓글자리입니다\n",
            prefixText: "댓글 닉넥임:",
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: "더보기",
            collapseText: "접기",
            maxLines: 2,
            linkColor: Colors.grey,
            expandOnTextTap: true,
            collapseOnTextTap: true,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "댓글 199개 모두보기",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateAgo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text("1일전", style: TextStyle(color: Colors.grey, fontSize: 13)),

        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 15),
          _infoDescription(),
          const SizedBox(height: 5),
          _replyTextBtn(),
          const SizedBox(height: 5),
          _dateAgo(),
        ],
      ),
    );
  }
}
