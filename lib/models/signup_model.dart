import 'dart:convert';
import 'dart:html';

class SignupModel {
  String? name;
  String? email;
  String? contact_no;
  String? password;
  String? password_confirmation;
  File? profile_image;
  File? front_side_image;
  File? back_side_image;

  SignupModel({
    this.name,
    this.email,
    this.contact_no,
    this.password,
    this.password_confirmation,
    this.profile_image,
    this.front_side_image,
    this.back_side_image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'contact_no': contact_no,
      'password': password,
      'password_confirmation': password_confirmation,
      'profile_image': profile_image,
      'front_side_image': front_side_image,
      'back_side_image': back_side_image,
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'],
      email: map['email'],
      contact_no: map['contact_no'],
      password: map['password'],
      password_confirmation: map['password_confirmation'],
      profile_image: map['profile_image'],
      front_side_image: map['front_side_image'],
      back_side_image: map['back_side_image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source));
}
