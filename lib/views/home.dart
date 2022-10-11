import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yagdabang/components/avatar_widget.dart';
import 'package:yagdabang/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.type2,
          thumPath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNG9W8BXKnlxnPXYf0AdF5ePOlJJLQDQQIKA&usqp=CAU',
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:[
            const SizedBox(width: 10),
            _myStory(),
            const SizedBox(width: 10),
            ...List.generate(
              100,
                  (index) => AvatarWidget(
                type: AvatarType.type1,
                thumPath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNG9W8BXKnlxnPXYf0AdF5ePOlJJLQDQQIKA&usqp=CAU',
              ),
            ),
          ] ),
    );
  }

  Widget _postList() {
    return  Column(
      children: List.generate(50, (index) => PostWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("약다방"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.mark_email_read_rounded,color: Colors.black,
              )
              ),
            ),
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),

          _postList(),
        ],
      ),
    );
  }
}
