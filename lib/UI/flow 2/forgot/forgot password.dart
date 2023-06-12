import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
                                    "FORGOT PASSWORD?",
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
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Email",
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Color.fromARGB(255, 123, 122, 122),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "Enter your email address to \nreset your password",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 18,
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
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "resetpassword");
                                  },
                                  child: Text(
                                    "SEND",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/right.png",
                            scale: 15,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Email sent successfully",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff00FA9A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/Line 3.png",
                      scale: 3,
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
