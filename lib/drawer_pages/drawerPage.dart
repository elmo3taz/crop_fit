import 'package:crop_fit/drawer_pages/appointment_page.dart';
import 'package:crop_fit/drawer_pages/news_page.dart';
import 'package:crop_fit/drawer_pages/order_history.dart';
import 'package:crop_fit/drawer_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_fit/drawer_pages/settings_page.dart';
import 'package:crop_fit/drawer_pages/user_data.dart';
import 'dart:io';

class Drawerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
    appBar: AppBar(
  title: Text(
    "Crop Fit",
    style: TextStyle(
      color: Colors.white, // جعل النص باللون الأبيض
      fontWeight: FontWeight.bold, // جعل النص عريضًا
    ),
  ),
  backgroundColor: Colors.green,
  iconTheme: IconThemeData(
    color: Colors.white, // تغيير لون أيقونة الـ Drawer إلى الأبيض
  ),
  centerTitle: true, // جعل النص في منتصف الـ AppBar
),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: userData.imagePath != null ? FileImage(File(userData.imagePath!)) : null,
                    child: userData.imagePath == null
                        ? Icon(Icons.person, size: 40, color: Colors.green)
                        : null,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userData.name.isNotEmpty ? userData.name : 'anything0001@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // جعل الخط عريضًا
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'My profile',
              onTap: () => _navigateTo(context, MyProfilePage()),
            ),
            _buildDrawerItem(
              icon: Icons.calendar_today,
              text: 'Appointment booking',
              onTap: () => _navigateTo(context, AppointmentBookingPage()),
            ),
            _buildDrawerItem(
              icon: Icons.article,
              text: 'News',
              onTap: () => _navigateTo(context, NewsPage()),
            ),
            _buildDrawerItem(
              icon: Icons.history,
              text: 'Order history',
              onTap: () => _navigateTo(context, OrderHistoryPage()),
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => _navigateTo(context, SettingsPage()),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Welcome !"),
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold, // جعل الخط عريضًا
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).pop(); 
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}