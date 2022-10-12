import 'package:flutter/material.dart';
import '../../service/memberService.dart';
import 'login_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

bool isVisible = true;
final MemberService _memberService = MemberService();

final TextEditingController _email = TextEditingController();
final TextEditingController _pw = TextEditingController();
final TextEditingController _pwc = TextEditingController();
final TextEditingController _name = TextEditingController();
final TextEditingController _birthday = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();

enum Gender { man, women }

class _SingUpPageState extends State<SingUpPage> {
  Gender _gender = Gender.man;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '회원가입',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return '이메일을 입력해주세요';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _email,
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.mail),
                      suffixIcon: _email.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _email.clear();
                                setState(() {});
                              }),
                      hintText: 'abc@mail.com',
                      label: Text('이메일'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return '영문+숫자 6~12';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                  obscureText: isVisible,
                  controller: _pw,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: _pw.text.isEmpty
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    hintText: '영문+숫자 6~12',
                    label: Text('비밀번호'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _pwc,
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: _pwc.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _pwc.clear();
                                setState(() {});
                              }),
                      hintText: '비밀번호 재확인 ',
                      label: Text('비밀번호확인'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _name,
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.abc),
                      suffixIcon: _name.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _name.clear();
                                setState(() {});
                              }),
                      hintText: '이름을 입력해주세요',
                      label: Text('이름'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _birthday,
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.calendar_month),
                      suffixIcon: _birthday.text.isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _birthday.clear();
                                setState(() {});
                              }),
                      hintText: 'ex1999-12-11',
                      label: Text('생년월일'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _phoneNumber,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.phone_android),
                            suffixIcon: _phoneNumber.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _phoneNumber.clear();
                                      setState(() {});
                                    }),
                            hintText: 'ex010-xxxx-xxxx',
                            label: Text('전화번호'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35))),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          //누르면 전화번호 입력창에 있는 번호로 인증번호 발송
                        },
                        child: Text("인증번호전송"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _phoneNumber,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.numbers),
                            suffixIcon: _phoneNumber.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _phoneNumber.clear();
                                      setState(() {});
                                    }),
                            hintText: '인증번호 몇자리를 입력해주세요',
                            label: Text('인증번호'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35))),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          //누르면 전화번호 입력창에 있는 번호로 인증번호 발송
                        },
                        child: Text("번호인증"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text("남자"),
                  leading: Radio<Gender>(
                    value: Gender.man,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("여자"),
                  leading: Radio<Gender>(
                    value: Gender.women,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _memberService.save(_email.text, _pw.text, _name.text,
                        _birthday.text, _phoneNumber.text, _gender.name);
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
