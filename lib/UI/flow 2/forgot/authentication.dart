import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
                Column(
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
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(80)),
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
                                    "AUTHENTICATION",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  )
                                ],
                              ),
                              Image.asset("assets/images/Line 1.png"),
                              SizedBox(
                                height: 25,
                              ),
                              PinCodeTextField(
                                enableActiveFill: true,
                                pinTheme: const PinTheme.defaults(
                                  selectedFillColor:
                                      Color.fromARGB(255, 176, 215, 247),
                                  activeFillColor:
                                      Color.fromARGB(255, 202, 250, 204),
                                  inactiveFillColor:
                                      Color.fromARGB(255, 239, 237, 237),
                                ),
                                length: 5,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                animationDuration: Duration(milliseconds: 300),
                                onChanged: (value) {
                                  setState(() {
                                    var currentText = value;
                                  });
                                },
                                appContext: context,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "Enter the ",
                                    style: TextStyle(
                                      color: Color(0xff747474),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "authentication code ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                        text:
                                            "we have sent on your SMS or Email Address",
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                "assets/images/Line 3.png",
                                scale: 3,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 40,
                                width: 120,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff00FA9A)),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
