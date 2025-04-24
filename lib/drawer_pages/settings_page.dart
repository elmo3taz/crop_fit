import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'user_data.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    final userData = Provider.of<UserData>(context, listen: false);
    _nameController = TextEditingController(text: userData.name);
    _phoneController = TextEditingController(text: userData.phone);
    super.initState();
  }

  Future<void> _pickImage() async {
    final userData = Provider.of<UserData>(context, listen: false);
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      userData.updateImage(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold, // جعل النص عريضًا
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true, // جعل النص في منتصف الـ AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: userData.imagePath != null
                        ? FileImage(File(userData.imagePath!))
                        : null,
                    child: userData.imagePath == null
                        ? Icon(Icons.person, size: 60, color: Colors.white)
                        : null,
                    backgroundColor: Colors.grey,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, // جعل النص عريضًا
                    ),
                    border: InputBorder.none,
                    icon: Icon(Icons.person, color: Colors.green),
                    suffixIcon: Icon(Icons.edit, color: Colors.green),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, // جعل النص عريضًا
                    ),
                    border: InputBorder.none,
                    icon: Icon(Icons.phone, color: Colors.green),
                    suffixIcon: Icon(Icons.edit, color: Colors.green),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                userData.updateUser(
                    _nameController.text, _phoneController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Changes saved successfully")),
                );
              },
 child: const Text(
    "Save Changes",
    style: TextStyle(
      fontSize: 16, // حجم الخط
      fontWeight: FontWeight.bold, // جعل النص عريضًا
    ),
  ),              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}