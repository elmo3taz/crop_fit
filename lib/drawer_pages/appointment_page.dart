import 'package:crop_fit/drawer_pages/engineer_appointment.dart';
import 'package:crop_fit/drawer_pages/farmer_appointment.dart';
import 'package:flutter/material.dart';

class AppointmentBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Appointment Booking",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold, // جعل النص عريضًا
    ),
  ),
  backgroundColor: Colors.green,
  iconTheme: IconThemeData(color: Colors.white),
  centerTitle: true, // جعل النص في منتصف الـ AppBar
),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              "You are...",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            _buildOptionCard(
              context,
              title: "Engineer",
              icon: Icons.engineering,
              color: Colors.green.shade100,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EngineerAppointmentPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              context,
              title: "Farmer",
              icon: Icons.agriculture,
              color: Colors.green.shade100,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FarmerAppointmentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.green.shade700),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
