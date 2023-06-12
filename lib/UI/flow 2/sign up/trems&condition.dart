import 'package:flutter/material.dart';

class TremCondition extends StatelessWidget {
  const TremCondition({Key? key}) : super(key: key);

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
                                    "TERMS & CONDITIONS",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  )
                                ],
                              ),
                              Image.asset("assets/images/Line 1.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Color(0xffF9F9F9),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Pellentesque eu lacus enim. Cras gravida, eros sit amet sollicitudin ultricies, nisl tellus tristique lectus, ut dapibus justo libero a velit. Suspendisse fringilla dolor ac lobortis faucibus.\n\nSed molestie laoreet diam. Nunc ullamcorper convallis blandit. Nulla dictum vestibulum lorem eu venenatis.\n\nut dapibus justo libero a velit. Suspendisse fringilla dolor ac lobortis faucibus."),
                                ),
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
                                    "I agree to Terms and Conditions",
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff00FA9A)),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "signup_thanks");
                                  },
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
                                height: 25,
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
