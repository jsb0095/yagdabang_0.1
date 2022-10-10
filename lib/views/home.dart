import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yagdabang/components/avatar_widget.dart';
import 'package:yagdabang/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory(){
    return Stack(
      children: [
        AvatarWidget(thumPath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6gBc7B6Wfhcl58kElznvZlIDXrntcKIHXcw&usqp=CAU', type: AvatarType.type2
        ),
        Positioned(right: 5,bottom: 0,child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: Colors.white,width: 2)
          ),
          child: const Center(
            child: Text("+"),
          ),
        ),)
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
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUuCc7h1v7jPfjqsDgjkW1IxFIgYhTcjubdA&usqp=CAU',
    ),
    ),
    ] ),
    );
  }

  Widget _postList(){
    return Column(
      children:
        List.generate(50, (index) => PostWidget()).toList(),
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
        children: [_storyBoardList(),
        _postList(),],
      ),
    );
  }
}
