import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool ChangeButton = false;

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login(String email, password) async {
    try {
      if (_formkey.currentState!.validate()) {
        setState(
          () {
            ChangeButton = true;
          },
        );

        Response response = await get(
          Uri.parse("https://admin.deliverit.co.zw/api/v1/users/sign_in"),
          // body: {
          //   "email": email,
          //   "password": password,
          // },
        );
        var data = jsonDecode(response.body.toString());
        if (data["success"] == true) {
          print(data["status"]);
          Navigator.pushNamed(context, "Dashboard");
        } else {
          showDialog<String>(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Alert Message'),
              content: Text(data["message"]),
            ),
          );
        }
        setState(() {
          ChangeButton = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.65),
                  child: Image.asset(
                    "assets/images/splash/Ellipse_bottom.png",
                    scale: 8.43,
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 40, right: 40, bottom: 40),
                        child: Image.asset(
                          "assets/images/splash/Transactr_Pty_Ltd.png",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 15,
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(80)),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Group 5.png",
                                      scale: 3,
                                    ),
                                    Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    )
                                  ],
                                ),
                                Image.asset("assets/images/Line 1.png"),
                                SizedBox(
                                  height: 35,
                                ),
                                TextFormField(
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: "Username",
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 144, 143, 143),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name Can't be Empty";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: passwordcontroller,
                                  obscureText: _obscureText,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: "Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color.fromARGB(255, 144, 143, 143),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _obscureText = !_obscureText;
                                        setState(() {});
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name Can't be Empty";
                                    } else if (value.length <= 7) {
                                      return "password must be 8 characters atleast";
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      },
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 120,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff00FA9A)),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                    ),
                                    onPressed: () {
                                      login(
                                          emailcontroller.text
                                              .trim()
                                              .toString(),
                                          passwordcontroller.text
                                              .trim()
                                              .toString());
                                    },
                                    child: ChangeButton
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            "Login",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "forgot");
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an account?"),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "signUp");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 12,
                                  bottom: 12,
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xff00FA9A),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
