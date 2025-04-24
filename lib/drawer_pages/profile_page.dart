import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_data.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold, // جعل النص عريضًا
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true, // جعل النص في منتصف الـ AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: userData.imagePath != null
                  ? FileImage(File(userData.imagePath!))
                  : null,
              child: userData.imagePath == null
                  ? Icon(Icons.person, size: 50, color: Colors.white)
                  : null,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.green),
                title: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // جعل النص عريضًا
                  ),
                ),
                subtitle: Text(
      userData.phone,
      style: TextStyle(
        fontSize: 16, // حجم الخط
        fontWeight: FontWeight.normal, // جعل النص بخط عادي
      ),
    ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.green),
                title: Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // جعل النص عريضًا
                  ),
                ),
                subtitle: Text(
      userData.phone,
      style: TextStyle(
        fontSize: 16, // حجم الخط
        fontWeight: FontWeight.normal, // جعل النص بخط عادي
      ),
    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}