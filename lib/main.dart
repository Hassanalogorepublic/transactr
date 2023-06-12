import 'package:flutter/material.dart';
import 'package:transactr/UI/flow%201/splash.dart';
import 'package:transactr/UI/flow%202/forgot/authentication.dart';
import 'package:transactr/UI/flow%202/forgot/reset%20password.dart';
import 'package:transactr/UI/flow%202/sign%20up/Sign_up.dart';
import 'package:transactr/UI/flow%202/forgot/forgot%20password.dart';
import 'package:transactr/UI/flow%202/login.dart';
import 'package:transactr/UI/flow%202/sign%20up/signup_thanks.dart';
import 'package:transactr/UI/flow%202/sign%20up/trems&condition.dart';
import 'package:transactr/dashboard.dart';
import 'package:transactr/random_number.dart';
import 'Mathematical_Expression_Evaluation.dart';
import 'number_formatting.dart';
import 'package:transactr/MatrixOperation.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xff00FA9A),
            ),
      ),
      initialRoute: "dashborad",
      routes: {
        "/": (context) => const Splash(),
        "Login": (context) => const Login(),
        "signUp": (context) => const SignUp(),
        "forgot": (context) => const ForgotPassword(),
        "resetpassword": (context) => const ResetPassword(),
        "authentication": (context) => const Authentication(),
        "trem&condition": (context) => const TremCondition(),
        "signup_thanks": (context) => const SignupThanks(),
        "dashborad": (context) => HomePage(),
        "number_formatting": (context) => N_formatting(),
        "random_number": (context) => Random_number(),
        "Math_Expression": (context) => Math_Expression(),
        "matrix": (context) => matrixOperation(),
      },
    );
  }
}
