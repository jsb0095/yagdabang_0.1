import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
              Icon(
                Icons.monetization_on,
                color: Colors.yellow,
              ),
              Text(" 보유포인트: 500P"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green),
              Text(" 복약 달성률:"),
              LinearPercentIndicator(
                barRadius: Radius.circular(30),
                width: 150,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: Text(
                  "90.0%",
                  style: TextStyle(fontSize: 15),
                ),
                progressColor: Colors.green,
              ),
            ],
          ),
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
        title: Text(
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
