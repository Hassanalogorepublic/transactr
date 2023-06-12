import 'package:flutter/material.dart';

import 'Dashboard_active.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool topNavi = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("DASHBOARD"),
          backgroundColor: Color(0XFF6DC5AB),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  // border: ,
                  color: Color(0xff6DC5AB),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            topNavi = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "Active",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              (topNavi) ? Container() : Icon(Icons.maximize),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            topNavi = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              (topNavi) ? Icon(Icons.maximize) : Container(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              (topNavi)
                  ? Expanded(child: body_data())
                  : Expanded(child: body_data()),
            ],
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}

body_data() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //first column!!!!!!!
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "John Smith",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "\$642",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xffF5881F),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/Line 1.png",
                    color: Colors.grey[200],
                    scale: 3.4,
                  ),
                  Text(
                    "Cheese Sandwich",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Maecenas pulvinar lectus sit amet blandit \nrhoncus",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Column(
                //second column!!!!!!
                children: [
                  Container(
                    color: Color(0xff6DC5AB),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    color: Color(0xffF7B31A),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    color: Color(0xffF5881F),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
