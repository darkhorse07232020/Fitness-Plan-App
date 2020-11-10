import 'salon_model.dart';

class ServicesModel {
  final String name;
  final int price;

  ServicesModel({this.name, this.price});
}

class AppointmentModel {
  final SalonModel salon;
  final String date;
  final String time;
  final String status;
  final List<ServicesModel> services;
  final int totalPrice;
  final int totalDuration;
  final String bookingNumber;

  AppointmentModel({this.salon, this.date, this.time, this.status, this.services, this.totalPrice, this.totalDuration, this.bookingNumber});

}

List<AppointmentModel> nextList = [
  AppointmentModel(
    totalPrice: 42,
    totalDuration: 50,
    date: '01 August 2020',
    time: '15:30 pm',
    bookingNumber: 'BRB15SK',
    status: "CONFIRM",
    salon: SalonModel(
      id: 5,
      name: 'Plum Gloves Home Loan',
      address: '07586, Douglas Lodge, Langworthland, Paraguay',
      image: 'assets/images/other/salon5.jpg',
    ),
    services: [
      ServicesModel(
        name: "Haircut",
        price: 15,
      ),
      ServicesModel(
        name: "Hair coloring",
        price: 25,
      ),
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
    ],
  ),
  AppointmentModel(
    totalPrice: 32,
    totalDuration: 50,
    date: '31 July 2020',
    time: '13:30 pm',
    bookingNumber: 'LKAD24SK',
    status: "PENDING",
    salon: SalonModel(
      id: 5,
      name: 'Bedfordshire driver Bahrain',
      address: '26403, Reynolds Glen, North Geraldinemouth, USA',
      image: 'assets/images/other/salon4.jpg',
    ),
    services: [
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
      ServicesModel(
        name: "Haircut",
        price: 25,
      ),
      ServicesModel(
        name: "Spa",
        price: 5,
      ),
    ],
  ),
];

List<AppointmentModel> completedList = [
  AppointmentModel(
    totalPrice: 42,
    totalDuration: 50,
    date: '01 August 2020',
    time: '15:30 pm',
    bookingNumber: 'BRB15SK',
    status: "COMPLETED",
    salon: SalonModel(
      id: 5,
      name: 'Plum Gloves Home Loan',
      address: '07586, Douglas Lodge, Langworthland, Paraguay',
      image: 'assets/images/other/salon5.jpg',
    ),
    services: [
      ServicesModel(
        name: "Haircut",
        price: 15,
      ),
      ServicesModel(
        name: "Hair coloring",
        price: 25,
      ),
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
    ],
  ),
  AppointmentModel(
    totalPrice: 32,
    totalDuration: 50,
    date: '31 July 2020',
    time: '13:30 pm',
    bookingNumber: 'LKAD24SK',
    status: "COMPLETED",
    salon: SalonModel(
      id: 5,
      name: 'Bedfordshire driver Bahrain',
      address: '26403, Reynolds Glen, North Geraldinemouth, USA',
      image: 'assets/images/other/salon4.jpg',
    ),
    services: [
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
      ServicesModel(
        name: "Haircut",
        price: 25,
      ),
      ServicesModel(
        name: "Spa",
        price: 5,
      ),
    ],
  ),
];
List<AppointmentModel> cancelList = [
  AppointmentModel(
    totalPrice: 42,
    totalDuration: 50,
    date: '01 August 2020',
    time: '15:30 pm',
    bookingNumber: 'BRB15SK',
    status: "CANCEL",
    salon: SalonModel(
      id: 5,
      name: 'Plum Gloves Home Loan',
      address: '07586, Douglas Lodge, Langworthland, Paraguay',
      image: 'assets/images/other/salon5.jpg',
    ),
    services: [
      ServicesModel(
        name: "Haircut",
        price: 15,
      ),
      ServicesModel(
        name: "Hair coloring",
        price: 25,
      ),
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
    ],
  ),
  AppointmentModel(
    totalPrice: 32,
    totalDuration: 50,
    date: '31 July 2020',
    time: '13:30 pm',
    bookingNumber: 'LKAD24SK',
    status: "CANCEL",
    salon: SalonModel(
      id: 5,
      name: 'Bedfordshire driver Bahrain',
      address: '26403, Reynolds Glen, North Geraldinemouth, USA',
      image: 'assets/images/other/salon4.jpg',
    ),
    services: [
      ServicesModel(
        name: "Shaving",
        price: 2,
      ),
      ServicesModel(
        name: "Haircut",
        price: 25,
      ),
      ServicesModel(
        name: "Spa",
        price: 5,
      ),
    ],
  ),
];
