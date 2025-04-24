import 'package:flutter/material.dart';
import 'package:crop_fit/drawer_pages/appointment_model.dart';

class AppointmentProvider with ChangeNotifier {
  final List<Appointment> _appointments = []; // مواعيد يحددها المهندس
  final List<BookingModel> _bookings = [];     // حجوزات الفلاح

  // Getter للمواعيد المتاحة
  List<Appointment> get appointments => _appointments;

  // Getter لحجوزات الفلاح
  List<BookingModel> get bookings => _bookings;

  // لإضافة معاد يحدده المهندس
  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  // لإضافة حجز من الفلاح
  void addBooking(BookingModel booking) {
    _bookings.add(booking);
    notifyListeners();
  }
}
