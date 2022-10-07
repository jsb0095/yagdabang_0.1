import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagePopUp extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? ok;
  final Function()? cancel;

  MessagePopUp.name(this.title, this.message, this.ok, this.cancel);

  MessagePopUp({Key? key, this.title, this.message, this.ok, this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      home: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            Text(
              title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Text(
              message!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: ok,
                    child: const Text(
                      "확인",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: cancel,
                    child: const Text(
                      "취소",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
