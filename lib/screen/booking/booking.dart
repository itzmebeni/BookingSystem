class Booking {
  final String customerName;
  final String contactNumber;
  final String selectedCar;
  final List<String> selectedServices;
  final String date;
  final String time;
  final String status;

  Booking({
    required this.customerName,
    required this.contactNumber,
    required this.selectedCar,
    required this.selectedServices,
    required this.date,
    required this.time,
    this.status = 'Pending',
  });

  Map<String, dynamic> toJson() {
    return {
      'customer_name': customerName,
      'contact_number': contactNumber,
      'selected_car': selectedCar,
      'selected_services': selectedServices,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      customerName: json['customer_name'],
      contactNumber: json['contact_number'],
      selectedCar: json['selected_car'],
      selectedServices: List<String>.from(json['selected_services']),
      date: json['date'],
      time: json['time'],
      status: json['status'],
    );
  }
}
