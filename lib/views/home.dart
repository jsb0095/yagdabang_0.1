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
            type: AvatarType.type3,
            thumPath:
                'https://assets-global.website-files.com/6005fac27a49a9cd477afb63/6057684e5923ad2ae43c8150_bavassano_homepage_before.jpg',
            size: 20,
            nickname: "약다방운영자",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: new Text("500P"),
                progressColor: Colors.yellow,
              ),
              SizedBox(
                width: 20,
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: 0.5,
                center: new Text("50%"),
                progressColor: Colors.green,
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("그륩1"),
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("그륩2"),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("그륩3"),
              ),
            ],
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
