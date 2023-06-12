import 'dart:convert';
import 'dart:ffi';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> itemList = [
    "Driving License*",
    "Age of Proof Card*",
  ];
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _confirmObscureText = true;
  var valuechoose = null;
  bool ChangeButton = false;
  String imageSide = "";

  //-----ORIGINAL IMAGE

  File? originalFront;
  File? originalBack;
  File? originalProfile;

  File? compressedImage;

  //-----COMPRESSED IMAGES

  File? compressedFront;
  File? compressedBack;
  File? compressedProfile;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 80,
    );
    if (image == null) return;
    final imagetemporary = File(image.path);
    setState(() {
      if (imageSide == "front") {
        this.originalFront = imagetemporary;

        compressImage(originalFront!);
      } else if (imageSide == "back") {
        this.originalBack = imagetemporary;
        compressImage(originalBack!);
      } else {
        this.originalProfile = imagetemporary;

        compressImage(originalProfile!);
      }
    });
  }

  Future compressImage(File originalImage) async {
    if (originalImage == null) return;
    final compressedfile = await FlutterImageCompress.compressAndGetFile(
      originalImage.path,
      "/storage/emulated/0/Download/file1.jpg",
      quality: 30,
    );
    if (compressedfile != null) {
      setState(() {
        if (imageSide == "front") {
          compressedFront = compressedfile;
          compressedImage = compressedFront;
        } else if (imageSide == "back") {
          compressedBack = compressedfile;
          compressedImage = compressedBack;
        } else {
          compressedProfile = compressedfile;
          compressedImage = compressedProfile;
        }
      });
      print("originalImage=========>");
      print(await originalImage.length());
      print("compressedImage==========>");
      print(await compressedImage!.length());
    }
  }

//------CONTROLLERS

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contact_nocontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController password_confirmationcontroller =
      TextEditingController();

  void register(
    String email,
    String password,
    String username,
    String cellphoneNumber,
    String role,
  ) async {
    try {
      Response response = await post(
        Uri.parse('https://admin.deliverit.co.zw/api/v1/users/register'),
        body: {
          "email": email,
          "password": password,
          "username": username,
          "cellphone_number": cellphoneNumber,
          // "role": role,
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(data["message"]);
        print(response.statusCode);
        print('Login successfully');
      } else {
        print(data["message"]);
        print(response.statusCode);
        print('failed');
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
                      top: MediaQuery.of(context).size.height * 1.1),
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
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 30, left: 20, right: 20),
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
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 25, bottom: 25),
                                    height: 50,
                                    color: Colors.grey[100],
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 13,
                                      ),
                                      height: 75,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xff00FA9A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 7),
                                          ),
                                        ],
                                      ),
                                      child: (originalProfile != null)
                                          ? ClipOval(
                                              child: Image.file(
                                                originalProfile!,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Icon(
                                              Icons.person,
                                              color: Colors.grey[500],
                                              size: 50,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    imageSide = "profile";
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        getImage(ImageSource
                                                            .gallery);
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor:
                                                            Colors.grey[100],
                                                        child: Image.asset(
                                                          "assets/images/Vector.png",
                                                          scale: 3,
                                                        ),
                                                      ),
                                                    ),
                                                    Text("Attachment"),
                                                  ],
                                                ),
                                                Image.asset(
                                                  "assets/images/Line 5.png",
                                                  scale: 3,
                                                ),
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        getImage(
                                                            ImageSource.camera);
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor:
                                                            Colors.grey[100],
                                                        child: Image.asset(
                                                          "assets/images/Vector2.png",
                                                          scale: 3,
                                                        ),
                                                      ),
                                                    ),
                                                    Text("Take Photo"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00FA9A),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(0, 7),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: namecontroller,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "Username*",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Color.fromARGB(
                                              255, 144, 143, 143),
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
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "Email Address*",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color.fromARGB(
                                              255, 144, 143, 143),
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
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: passwordcontroller,
                                      obscureText: _obscureText,
                                      obscuringCharacter: "*",
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "Password*",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color.fromARGB(
                                              255, 144, 143, 143),
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller:
                                          password_confirmationcontroller,
                                      obscureText: _confirmObscureText,
                                      obscuringCharacter: "*",
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "role*",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color.fromARGB(
                                              255, 144, 143, 143),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            _confirmObscureText =
                                                !_confirmObscureText;
                                            setState(() {});
                                          },
                                          child: Icon(_confirmObscureText
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: contact_nocontroller,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "Contact Number*",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.call,
                                          color: Color.fromARGB(
                                              255, 144, 143, 143),
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
                                      height: 15,
                                    ),
                                    DropdownButton(
                                      value: valuechoose,
                                      hint: Text(
                                        "Identity*",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          valuechoose = newValue;
                                        });
                                      },
                                      items: itemList.map((itemValue) {
                                        return DropdownMenuItem(
                                          value: itemValue,
                                          child: Text(itemValue),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      child: (valuechoose != null)
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 7,
                                                    horizontal: 20,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff2A2B2F),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7))),
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.upload,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Upload",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print(imageSide);
                                                    setState(() {
                                                      imageSide = "front";
                                                    });
                                                    print(imageSide);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          actions: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          getImage(
                                                                              ImageSource.gallery);
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              50,
                                                                          backgroundColor:
                                                                              Colors.grey[100],
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/Vector.png",
                                                                            scale:
                                                                                3,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                          "Attachment"),
                                                                    ],
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/images/Line 5.png",
                                                                    scale: 3,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          getImage(
                                                                              ImageSource.camera);
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              50,
                                                                          backgroundColor:
                                                                              Colors.grey[100],
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/Vector2.png",
                                                                            scale:
                                                                                3,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                          "Take Photo"),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: (originalFront ==
                                                            null)
                                                        ? EdgeInsets.symmetric(
                                                            vertical: 17,
                                                            horizontal: 10,
                                                          )
                                                        : EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 4,
                                                          ),
                                                    decoration: BoxDecoration(
                                                      color: (originalFront !=
                                                              null)
                                                          ? Colors.grey[200]
                                                          : null,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff00FA9A),
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(7),
                                                      ),
                                                    ),
                                                    child: originalFront != null
                                                        ? Image.file(
                                                            originalFront!,
                                                            width: 75,
                                                            height: 50,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Text(
                                                            "Frontside*",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      imageSide = "back";
                                                    });
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          actions: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          getImage(
                                                                              ImageSource.gallery);
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              50,
                                                                          backgroundColor:
                                                                              Colors.grey[100],
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/Vector.png",
                                                                            scale:
                                                                                3,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                          "Attachment"),
                                                                    ],
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/images/Line 5.png",
                                                                    scale: 3,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          getImage(
                                                                              ImageSource.camera);
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              50,
                                                                          backgroundColor:
                                                                              Colors.grey[100],
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/Vector2.png",
                                                                            scale:
                                                                                3,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                          "Take Photo"),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: (originalBack !=
                                                            null)
                                                        ? EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 4,
                                                          )
                                                        : EdgeInsets.symmetric(
                                                            vertical: 17,
                                                            horizontal: 10,
                                                          ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          (originalBack != null)
                                                              ? Colors.grey[200]
                                                              : null,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff00FA9A),
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(7),
                                                      ),
                                                    ),
                                                    child: (originalBack !=
                                                            null)
                                                        ? Image.file(
                                                            originalBack!,
                                                            height: 50,
                                                            width: 75,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Text(
                                                            "backside*",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : null,
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 140,
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
                                          register(
                                              emailcontroller.toString().trim(),
                                              passwordcontroller.toString(),
                                              namecontroller.toString(),
                                              contact_nocontroller.toString(),
                                              password_confirmationcontroller
                                                  .toString()
                                                  .trim());
                                        },
                                        child: (ChangeButton == true)
                                            ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                "REGISTER",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                ),
                                              ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                ),
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
                              Navigator.pushNamed(context, "Login");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 12,
                                bottom: 12,
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color(0xff00FA9A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
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

 // Future<void> register(
  //     String name, email, password, password_confirmation, contact_no) async {
  //   if (_formkey.currentState!.validate()) {
  //     setState(
  //       () {
  //         ChangeButton = true;
  //       },
  //     );
  //     var profileStream = new http.ByteStream(compressedProfile!.openRead());
  //     profileStream.cast();
  //     var profileLength = await compressedProfile!.length();
  //     var frontStream = new http.ByteStream(compressedFront!.openRead());
  //     frontStream.cast();
  //     var frontLength = await compressedFront!.length();
  //     var backStream = new http.ByteStream(compressedBack!.openRead());
  //     backStream.cast();
  //     var backLength = await compressedBack!.length();

  //     var uri =
  //         Uri.parse('https://transactr-backend-dev.herokuapp.com/api/v1/users');

  //     var request = new http.MultipartRequest('POST', uri);

  //     request.fields['name'] = name;
  //     request.fields['email'] = email;
  //     request.fields['contact_no'] = contact_no;
  //     request.fields['password'] = password;
  //     request.fields['password_confirmation'] = password_confirmation;

  //     var profileMultiport = new http.MultipartFile(
  //       'profile_image',
  //       profileStream,
  //       profileLength,
  //     );
  //     var frontMultiport = new http.MultipartFile(
  //       'front_side_image',
  //       frontStream,
  //       frontLength,
  //     );

  //     var backMultiport = new http.MultipartFile(
  //       'back_side_image',
  //       backStream,
  //       backLength,
  //     );

  //     request.files.add(profileMultiport);
  //     request.files.add(frontMultiport);
  //     request.files.add(backMultiport);

  //     var response = await request.send();

  //     print(response.stream.toString());

  //     if (response.statusCode == 200) {
  //       setState(() {
  //         ChangeButton = false;
  //       });
  //       print('image uploaded');
  //     } else {
  //       print('failed');
  //       setState(() {
  //         ChangeButton = false;
  //       });
  //       var data = jsonDecode(response.toString());
  //       showDialog<String>(
  //         barrierDismissible: true,
  //         context: context,
  //         builder: (BuildContext context) => AlertDialog(
  //           title: Text('Alert Message'),
  //           content: Text(data["errors"]),
  //         ),
  //       );
  //     }
  //   }
  // }

  // Future<void> register(String name, email, password, role, contactNo) async {
  //   if (_formkey.currentState!.validate()) {
  //     Response response = await post(
  //       Uri.parse(
  //           "https://admin.deliverit.co.zw/api/v1/users/register?email=$email&password=$password&username=$name&cellphone_number=$contactNo&role=$role"),
  //       body: {
  //         "username": name,
  //         "email": email,
  //         "password": password,
  //         "role": role,
  //         "cellphone_number": contactNo,
  //       },
  //     );
  //     setState(
  //       () {
  //         ChangeButton = true;
  //       },
  //     );

  //     var data = jsonDecode(response.body.toString());
  //     if (data.status_code == 200) {
  //       print(data["status_code"]);
  //       Navigator.pushNamed(context, "Login");
  //     } else {
  //       showDialog<String>(
  //         barrierDismissible: true,
  //         context: context,
  //         builder: (BuildContext context) => AlertDialog(
  //           title: Text('Alert Message'),
  //           content: Text(data["message"]),
  //         ),
  //       );
  //     }
  //     setState(() {
  //       ChangeButton = false;
  //     });
  //   }
  // }
