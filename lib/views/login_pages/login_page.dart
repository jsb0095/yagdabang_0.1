import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:yagdabang/views/app.dart';
import 'package:yagdabang/views/home.dart';
import 'package:yagdabang/views/login_pages/sign_up_page.dart';

import '../../service/memberService.dart';
import 'find_user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final MemberService _memberService = MemberService();
TextEditingController mailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

enum LoginPlatform {
  facebook,
  google,
  kakao,
  naver,
  apple,
  none, // logout
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  LoginPlatform _loginPlatform = LoginPlatform.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              onSaved: (value) {
                setState(() {});
              },
              controller: mailController,
              decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.mail),
                  suffixIcon: mailController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            mailController.clear();
                            setState(() {});
                          }),
                  hintText: 'abc@mail.com',
                  label: const Text('이메일'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onSaved: (value) {
                setState(() {});
              },
              obscureText: isVisible,
              controller: passwordController,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: passwordController.text.isEmpty
                    ? null
                    : GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                hintText: '비밀번호를 입력해주세요',
                label: const Text('비밀번호'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FindUserPage()));
                    },
                    child: const Text("아이디/비밀번호 찾기")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUpPage()));
                    },
                    child: const Text("회원가입")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 50))),
                onPressed: () async {
                  // isKakaoTalkInstalled();
                  // // KakaoLogin.loginWithKakaoAccount();
                  // KakaoLogin.loginWithKakaoTalk();
                  // KakaoException
                },
                child: Image.asset(
                  'images/kakaob.png',
                  width: 150,
                  height: 50,
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 50))),
                onPressed: () async {
                  final NaverLoginResult result =
                      await FlutterNaverLogin.logIn();
                  if (result.status == NaverLoginStatus.loggedIn) {
                    print('토큰 = ${result.accessToken}');
                    print('아이디 = ${result.account.id}');
                    print('이메일 = ${result.account.email}');
                    print('이름 = ${result.account.name}');

                    setState(() {
                      _loginPlatform = LoginPlatform.naver;
                    });
                  } else {
                    print("결과 실패");
                  }
                },
                child: Image.asset('images/nlogos.png', width: 150, height: 50),
              ),
            ),
            TextButton(
                onPressed: () {
                  // NaverLogin.loginWithNaverAccount();
                },
                child:
                    Image.asset('images/glogos.png', width: 150, height: 50)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: TextButton(
                onPressed: () async {
                  // // Future<int> result = _memberService.loginCheck(
                  // //     mailController.text, passwordController.text);
                  // if (await result == 201) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const App()));
                  // } else {
                  //   showDialog(
                  //     context: context,
                  //     builder: (_) => AlertDialog(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       title: const Text("로그인오류"),
                  //       content: const Text("아이디 또는 비밀번호가 일치하지 않습니다"),
                  //     ),
                  //   );
                  // }
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
