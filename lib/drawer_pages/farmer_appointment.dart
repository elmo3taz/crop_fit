import 'package:crop_fit/drawer_pages/appointment_provider.dart';
import 'package:crop_fit/drawer_pages/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmerAppointmentPage extends StatefulWidget {
  @override
  _FarmerAppointmentPageState createState() => _FarmerAppointmentPageState();
}

class _FarmerAppointmentPageState extends State<FarmerAppointmentPage> {
  final List<int> bookedIndexes = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentProvider>(context);
    final appointments = provider.appointments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farmer’s Appointment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // جعل النص عريضًا
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true, // جعل النص في المنتصف
      ),
      body: appointments.isEmpty
          ? Center(child: Text("No appointments available yet."))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                final isBooked = bookedIndexes.contains(index);

                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Engineer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 4),
                            Text('${appointment.day}, ${appointment.time}', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 4),
                            Text(
                              '${appointment.price} EGP / hour',
                              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: isBooked
                            ? null
                            : () {
                                final booking = BookingModel(
                                  name: 'Engineer',
                                  date: appointment.day,
                                  time: appointment.time,
                                  specialty: 'N/A',
                                  price: int.tryParse(appointment.price) ?? 0,
                                );

                                provider.addBooking(booking);

                                setState(() {
                                  bookedIndexes.add(index);
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Booked on ${appointment.day} at ${appointment.time}')),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBooked ? Colors.grey : Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isBooked ? 'Booked' : 'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // جعل النص عريضًا
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}