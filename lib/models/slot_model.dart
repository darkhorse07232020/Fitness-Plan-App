class SlotModel {
  final int id;
  final String time;
  final bool isAvailable;
  bool isSelected;
  bool isBooked;

  SlotModel({this.id, this.time, this.isAvailable, this.isSelected,this.isBooked});
}

List<SlotModel> slotList = [
  SlotModel(
      id: 1,
      time: '9:30 AM',
      isAvailable: true,
      isSelected: false,
      isBooked: true),
  SlotModel(
      id: 2,
      time: '10:00 AM',
      isAvailable: false,
      isSelected: false,
      isBooked: true),
  SlotModel(
      id: 3,
      time: '10:30 AM',
      isAvailable: false,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 4,
      time: '11:00 AM',
      isAvailable: true,
      isSelected: false,
      isBooked: true),
  SlotModel(
      id: 5,
      time: '11:30 AM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 6,
      time: '12:00 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 7,
      time: '12:30 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: true),
  SlotModel(
      id: 8,
      time: '13:00 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 9,
      time: '1:30 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 10,
      time: '2:00 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 11,
      time: '2:30 PM',
      isAvailable: false,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 12,
      time: '3:00 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 13,
      time: '3:30 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: true),
  SlotModel(
      id: 14,
      time: '4:00 PM',
      isAvailable: false,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 15,
      time: '4:30 PM',
      isAvailable: false,
      isSelected: false,
      isBooked: false),
  SlotModel(
      id: 16,
      time: '5:00 PM',
      isAvailable: true,
      isSelected: false,
      isBooked: false),
];
