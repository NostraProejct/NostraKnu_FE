import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nostra/api/api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nostra/model/user.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  checkUserEmail() async{ //코드의 실행 흐름을 블로킹하지 않고 작업을 수행하는 개념
    try{
      var response = await http.post(// http.post 메서드를 사용하여 사용자가 보낸 데이터를 서버로 보내 저장
          Uri.parse(API.validateEmail), // uri.parse를 사용하여 api클래스에 있는 validateEmail을 전달
      body: {
        'user_email' : emailController.text.trim() // 데이터테이블의 컬럼명 가져오기,  emailController.text.trim()으로 텍스트에 입력되는 이메일 전달
          }
          );
      if(response.statusCode == 200){ //보낸 이메일 정보확인 - > response.statusCode == 200이면 성공적으로 서버와 통신완료
        var responseBody = jsonDecode(response.body); // 윗줄에서 서버와 통신완료 되었을때 respons.body 전달,

        if(responseBody['existmail'] == true){// validatemail.php에서 num_rows > 0 이면 이메일 중복이라는 뜻과 동일
          Fluttertoast.showToast(
              msg: "Email is already in use. Pleas try another email" //FlutterToast 패키지를 사용하여 이메일 중복이럐 메시지 출력
          );
        }else{// 동일한 이메일이 존재하지 않을시에
          savInfo(); // saveinfo메서드 실행
        }
      }
    }catch(e) { //예외처리 상황
      print(e.toString()); // 콘솔 에러메시지 출력
      Fluttertoast.showToast(msg: e.toString()); // 토스트 에러메시지 출력
    }
  }



  savInfo() async{ //중복된 아이디가 없을때 데이트베이스의 사용자 정보를 저장하는 메서드,
                   // 사용자가 플러터에 입력한 정보는 서버전송후 mysql 데이터베이스의 json포맷으로
                   // 저장되기 떄문에 입려괸 데이터를 json포맷으로 바꿔줘야한다
    User userModel = User(
      1,  // User.dart의 user_id
      userNameController.text.trim(), // User.dart의 user_name
      emailController.text.trim(), // User.dart의 user_email
      passwordController.text.trim(), // User.dart의 user_password
    );

    try{
      var res = await http.post(// http.post 메서드를 사용하여 사용자가 보낸 데이터를 API의 sign.up에 저장
          Uri.parse(API.signup),
          body: userModel.toJson() // user.dart에 입력된 데이터들을 tojson메서드를 불러와 json포맷으로 바꾸는 과정
                                   // -> 이 과정을 통해서 Mysql데이터베이스에서 이 데이터들을 저장할수 있다.
      );

      if(res.statusCode == 200){//서버에 잘 접속되나 확인하는 것(signup.php파일을 통해서 접속이 되었나)
                                // -> res.statusCode가 200일떄
        var resSignup = jsonDecode(res.body);// jsonDecode에 res.body 전달
        if(resSignup['success'] == true){ //signup.php 17번째줄 조건, 문제없이 사용자 등록이 되면 ...
          Fluttertoast.showToast(msg: 'Signup successfully'); // 메시지 출력
          setState(() { // signup 메시지가 성공적으로 뜬뒤에 텍스트 필드에 있는 정보들 사라지게하기
            userNameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        }else{// 그 외의 경우
          Fluttertoast.showToast(msg: 'Error occurred. Please try again');// 에러 메시지 출력
        }
      }
    }catch(e){// 예외처리 상황
      print(e.toString()); // 콘솔 에러메시지 출력
      Fluttertoast.showToast(msg: e.toString()); // 토스트 에러메시지 출력
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.card_travel_outlined,
                  color: Colors.deepPurple,
                  size: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign Up',
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Thank you for join us',
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: userNameController,
                              validator: (val) =>
                              val == "" ? "Please enter username " : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'User'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                              val == "" ? "Please enter email" : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
                              val == "" ? "Please enter password" : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if(formKey.currentState!.validate()){// 기본 validation에 문제가 없다면 chckUserEmail메서드 실행
                      checkUserEmail();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already registered?'),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        ' Go back Login page!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}