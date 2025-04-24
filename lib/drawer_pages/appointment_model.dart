class Appointment {
  final String day;
  final String time;
  final String price;

  Appointment({required this.day, required this.time, required this.price});
}

class BookingModel {
  final String name;
  final String date;
  final String time;
  final String specialty;
  final int price;

  BookingModel({
    required this.name,
    required this.date,
    required this.time,
    required this.specialty,
    required this.price,
  });
}
