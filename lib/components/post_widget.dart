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
              type: AvatarType.TYPE3,
              nickname: "아프지마",
              size: 25,
              thumbPath:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyjpDDQXk2BEHOJkVJIPgXBIks8YhE1F0w3w&usqp=CAU"),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.manage_search),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTijGyGn6-XI5h167cY5SfjsLTcAgMuyhWmAg&usqp=CAU",
      fit: BoxFit.cover,
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.maps_ugc,
                color: Colors.yellow,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.near_me,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 15개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            '콘텐츠\n콘텐츠\n콘텐츠\n콘텐츠\n콘텐츠\n',
            expanded: false,
            onPrefixTap: () {},
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        "몇일전",
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 5),
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
