import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MemberService {
  void save(
    String memberEmail,
    String memberPw,
    String memberName,
    String memberBirthday,
    String memberPhone,
    String name,
  ) async {
    Map<String, dynamic> memberSignUp = {
      'memberEmail': memberEmail,
      'memberPw': memberPw,
      'memberName': memberName,
      'memberBirthday': memberBirthday,
      'memberPhone': memberPhone,
      'memberGender': name
    };
    var memberSaveUrl = Uri.parse("http://192.168.0.7:9123/member/save");
    var memberData = jsonEncode(memberSignUp);
    print("스프링부트 전송");
    print(memberData);
    http.Response response = await http.post(memberSaveUrl,
        headers: {"Content-Type": "application/json"}, body: memberData);
    if (response.statusCode == 200) {
      print(response);
      return null;
    }
  }

  Future<int> loginCheck(String memberEmail, String memberPw) async {
    Map<String, dynamic> memberCheck = {
      "memberEmail": memberEmail,
      "memberPw": memberPw,
    };

    var memberLoginUrl = Uri.parse("http://192.168.0.7:9123/member/loginCheck");
    var memberData = jsonEncode(memberCheck);
    http.Response response = await http.post(memberLoginUrl,
        headers: {"Content-Type": "application/json"}, body: memberData);
    if (response.statusCode == 201) {
      return response.statusCode;
    }
    return response.statusCode;
  }

  // Future<bool> duplicateCheck(String memberEmail) async {
  //   Map<String, dynamic> memberCheck = {
  //     "memberEmail": memberEmail,
  //   };
  //   var memberEmailDuplicateCheckUrl =
  //       Uri.parse("http://10.0.0.2:9123/member/duplicateCheck");
  //   var emailDuplicateCheck = jsonEncode(memberCheck);
  //   http.Response response = await http.post(memberEmailDuplicateCheckUrl,
  //       headers: {"Content-Type": "application/json"},
  //       body: emailDuplicateCheck);
  //   if (response.statusCode == 200) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // Future<String> findMemberEmail(
  //     String memberName, String memberBirthday) async {
  //   Map<String, dynamic> findEmail = {
  //     "memberName": memberName,
  //     "memberBirthday": memberBirthday
  //   };
  //   var findIdUrl = Uri.parse("http://10.0.0.2:9123/member/findEmail");
  //   var emailDuplicateCheck = jsonEncode(findEmail);
  //   http.Response response = await http.post(findIdUrl,
  //       headers: {"Content-Type": "application/json"},
  //       body: emailDuplicateCheck);
  //   if (response.statusCode == 200) {
  //     return "true";
  //   }
  //   return "false";
  // }

}
