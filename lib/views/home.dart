import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yagdabang/components/avatar_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          100,
          (index) => AvatarWidget(
            type: AvatarType.type1,
            thumPath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUuCc7h1v7jPfjqsDgjkW1IxFIgYhTcjubdA&usqp=CAU',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "약다방",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.message,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [_storyBoardList()],
      ),
    );
  }
}
