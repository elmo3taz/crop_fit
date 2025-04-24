import 'package:crop_fit/drawer_pages/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<AppointmentProvider>(context).bookings;

    return Scaffold(
    appBar: AppBar(
  backgroundColor: Colors.green,
  title: Text(
    'Order History',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold, // جعل النص عريضًا
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  centerTitle: true, // جعل النص في منتصف الـ AppBar
),
      body: bookings.isEmpty
          ? Center(child: Text('No bookings yet'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 4),
                          Text('${booking.date}  ${booking.time}',
                              style: TextStyle(fontSize: 14)),
                         
                        ],
                      ),
                      Text('${booking.price} EGP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
