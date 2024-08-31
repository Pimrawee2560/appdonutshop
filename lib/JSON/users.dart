import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? usrId;
  final String? fullName;
  final String? email;
  final String usrName;
  final String password;
  final String? address; // เพิ่มฟิลด์ address สำหรับเก็บข้อมูลที่อยู่

  Users({
    this.usrId,
    this.fullName,
    this.email,
    required this.usrName,
    required this.password,
    this.address, // เพิ่มฟิลด์ address ใน constructor
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        fullName: json["fullName"],
        email: json["email"],
        usrName: json["usrName"],
        password: json["usrPassword"],
        address: json["address"], // อ่านค่า address จาก json
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "fullName": fullName,
        "email": email,
        "usrName": usrName,
        "usrPassword": password,
        "address": address, // เพิ่มค่า address ใน json
      };
}
