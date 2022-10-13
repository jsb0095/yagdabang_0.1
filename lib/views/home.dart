import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yagdabang/components/avatar_widget.dart';
import 'package:yagdabang/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3,
            thumbPath:
                'https://assets-global.website-files.com/6005fac27a49a9cd477afb63/6057684e5923ad2ae43c8150_bavassano_homepage_before.jpg',
            size: 20,
            nickname: "약다방운영자",
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: Text("500P"),
                  progressColor: Colors.yellow,
                ),
                const SizedBox(
                  width: 20,
                ),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: 0.7,
                  center: Text("70%"),
                  progressColor: Colors.green,
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "그륩1",
                  onPressed: () {},
                  child: Text("고혈압"),
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "그륩2",
                  onPressed: () {},
                  child: Text("대장암"),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "그륩3",
                  onPressed: () {},
                  child: Text("백혈병"),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "그륩4",
                  onPressed: () {},
                  child: Text("혈우병"),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: "그륩5",
                  onPressed: () {},
                  child: Text("희귀병"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 10),
        _myStory(),
        const SizedBox(width: 10),
      ]),
    );
  }

  Widget _postList() {
    return Column(children: List.generate(50, (index) => PostWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "약다방",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.near_me,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          const SizedBox(
            height: 10,
          ),
          _postList(),
        ],
      ),
    );
  }
}
