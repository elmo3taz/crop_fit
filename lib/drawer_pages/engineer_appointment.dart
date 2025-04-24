import 'package:crop_fit/drawer_pages/appointment_model.dart';
import 'package:crop_fit/drawer_pages/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EngineerAppointmentPage extends StatefulWidget {
  @override
  _EngineerAppointmentPageState createState() =>
      _EngineerAppointmentPageState();
}

class _EngineerAppointmentPageState extends State<EngineerAppointmentPage> {
  final List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  final List<String> times = List.generate(24, (index) {
    final hour = index % 12 == 0 ? 12 : index % 12;
    final period = index < 12 ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:00 $period';
  });

  int selectedDayIndex = 0;
  int selectedTimeIndex = 0;
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text(
          "Engineer's Appointment",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // جعل النص عريضًا
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true, // جعل النص في المنتصف
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // إزالة كلمة Schedule
            SizedBox(height: 16),
            Text(
              "Days",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ), // جعل النص عريضًا
            ),
            SizedBox(
              height: 100,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 40,
                perspective: 0.002,
                onSelectedItemChanged:
                    (index) => setState(() => selectedDayIndex = index),
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: days.length,
                  builder: (context, index) {
                    final isSelected = index == selectedDayIndex;
                    return Center(
                      child: Text(
                        days[index],
                        style: TextStyle(
                          fontSize: isSelected ? 18 : 14,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color:
                              isSelected ? Colors.black : Colors.grey.shade600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ), // جعل النص عريضًا
            ),
            SizedBox(
              height: 100,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 40,
                onSelectedItemChanged:
                    (index) => setState(() => selectedTimeIndex = index),
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: times.length,
                  builder: (context, index) {
                    final isSelected = index == selectedTimeIndex;
                    return Center(
                      child: Text(
                        times[index],
                        style: TextStyle(
                          fontSize: isSelected ? 18 : 14,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color:
                              isSelected ? Colors.black : Colors.grey.shade600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Booking Price",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ), // جعل النص عريضًا
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter price", 
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  final day = days[selectedDayIndex];
                  final time = times[selectedTimeIndex];
                  final price = priceController.text;

                  if (price.isNotEmpty) {
                    Provider.of<AppointmentProvider>(
                      context,
                      listen: false,
                    ).addAppointment(
                      Appointment(day: day, time: time, price: price),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Saved: $day at $time for \$${price}"),
                      ),
                    );
                    priceController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter price")),
                    );
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // جعل النص عريضًا
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
