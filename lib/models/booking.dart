class ServiceItem {
  final String name;
  final int price;
  ServiceItem(this.name, this.price);
}

class Booking {
  String? carType;                // SUV, Sedan, …
  List<ServiceItem> services = []; // chosen services
  String? firstName;
  String? lastName;
  String? phone;
  String? plate;
  String? date;
  String? time;

  int get total =>
      services.fold(0, (sum, s) => sum + s.price);
}
