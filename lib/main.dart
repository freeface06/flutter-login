import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 깃헙 참고 https://github.com/NearHuscarl/flutter_login
const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'freeface06': 'dlghwjd123!!!'
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return '존재하지 않는 사용자입니다.';
      }
      if (users[data.name] != data.password) {
        return '비밀번호가 일치하지 않습니다.';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        messages: LoginMessages(
          loginButton: "로그인",
          signupButton: "회원가입",
          forgotPasswordButton: "비밀번호를 잊어버리셨나요?",
          userHint: "이메일",
          passwordHint: "비밀번호",
          recoverPasswordDescription: "임시 비밀번호를 이메일로 발송해드립니다.",
          confirmPasswordHint: "다시입력비밀번호",
          recoverPasswordButton: "비밀번호재설정",
          goBackButton: "뒤로",
          recoverPasswordIntro: "여기서 비밀번호를 초기화 하세요.",
          flushbarTitleError: "오류발생!",
          // 하단 알림 오류 타이틀
          confirmPasswordError: "비밀번호를 확인해주세요.?",
          // 회원가입 비밀번호 확인 하단 에러메세지

          providersTitleFirst: "Login With",
          // 소셜로그인 타이틀
          providersTitleSecond: "Social Login",

          //-------------------
          confirmSignupIntro: "11111",
          confirmSignupSuccess: "22222",
          flushbarTitleSuccess: "33333",
          recoverPasswordSuccess: "55555",
          resendCodeButton: "66666",
          resendCodeSuccess: "77777",
          confirmSignupButton: "버튼1",
          recoveryCodeValidationError: "에러에러",
          recoveryCodeHint: "여기서",
          confirmationCodeHint: "코드힌트?",
          additionalSignUpSubmitButton: "회원가입서브밋버튼",
          confirmationCodeValidationError: "에러",
          additionalSignUpFormDescription: "123",
          confirmRecoverSuccess: "리커버석세스",
          signUpSuccess: "성공",
          setPasswordButton: "버튼",
          confirmRecoverIntro: "?????",
          recoverCodePasswordDescription: "3",
        ),
        theme: LoginTheme(
          primaryColor: Colors.teal, // 기본 테마 색상
          accentColor: Colors.yellow, // 타이틀 색상
          errorColor: Colors.deepOrange, // 에러 색상
          titleStyle: const TextStyle(
            color: Colors.greenAccent,
            fontFamily: LoginMessages.defaultSignUpSuccess,
            letterSpacing: 4,
          ),
        ),
        passwordValidator: (value) {
          // 이메일 입력 하단 오류메세지 텍스트 리턴
          //print(value);// 비밀번호 입력한 값 반환

          if (value == "") {
            return "비밀번호가 입력되지 않았습니다.";
          }
        },
        userValidator: (value) {
          // 비밀번호 입력 하단 오류메세지 텍스트 리턴
          //print(value);  // 이메일 입력한값 반환

          if (value == "") {
            return "이메일이 입력되지 않았습니다.";
          }
        },
        loginProviders: <LoginProvider>[
          LoginProvider(
              icon: FontAwesomeIcons.google,
              label: "Google",
              callback: () async {
                debugPrint('start google sign in');
                await Future.delayed(loginTime);
                debugPrint('stop google sign in');
                return null;
              }),
          LoginProvider(
              icon: FontAwesomeIcons.facebookF,
              label: "FaceBook",
              callback: () async {
                debugPrint('start facebook sign in');
                await Future.delayed(loginTime);
                debugPrint('stop facebook sign in');
                return null;
              }),
          LoginProvider(
              icon: FontAwesomeIcons.github,
              label: "Github",
              callback: () async {
                debugPrint('start github sign in');
                await Future.delayed(loginTime);
                debugPrint('stop github sign in');
                return null;
              }),
          LoginProvider(
              icon: FontAwesomeIcons.linkedin,
              label: "LinkdeIn",
              callback: () async {
                debugPrint('start linkedin sign in');
                await Future.delayed(loginTime);
                debugPrint('stop linkedin sign in');
                return null;
              }),
        ],
        footer: "footer",
        logoTag: "tag",
        title: "Login",
        onLogin: _authUser,
        onSignup: _signupUser,
        onRecoverPassword: _recoverPassword);
  }
}
