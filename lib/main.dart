import 'package:crop_fit/drawer_pages/appointment_provider.dart';
import 'package:crop_fit/drawer_pages/drawerPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_fit/drawer_pages/user_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserData()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()), 
        

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer App',
      debugShowCheckedModeBanner: false,
      home: Drawerpage(),
    );
  }
}
