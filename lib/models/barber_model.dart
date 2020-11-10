class BarberModel {
  final int id;
  final String name;
  final String image;
  final String address;
  final bool isFeatured;
  final String position;
  bool isSelected;
  final String lastMessage;
  final bool haveunreadmessages;
  final int unreadmessages;
  final String lastSeenTime;
  final bool isOnline;

  BarberModel({
    this.id,
    this.name,
    this.image,
    this.address,
    this.isFeatured,
    this.isSelected,
    this.position,
    this.lastMessage,
    this.haveunreadmessages,
    this.unreadmessages,
    this.lastSeenTime,
    this.isOnline,
  });
}

List<BarberModel> allBarberList = [
  BarberModel(
    id: 1,
    name: 'Mike West',
    image: 'assets/avatars/barber1.jpg',
    isFeatured: false,
    isSelected: false,
    position: 'Manager',
    haveunreadmessages: true,
    lastMessage: 'Hey! How are you today?',
    lastSeenTime: '4:05 AM',
    unreadmessages: 3,
    isOnline: true,
    address: '3150  Ferguson Street',
  ),
  BarberModel(
    id: 2,
    name: 'Thomas',
    image: 'assets/avatars/barber2.jpg',
    isFeatured: false,
    isSelected: false,
    position: 'Sr. Barber',
    haveunreadmessages: true,
    lastMessage: 'Hey! Can i send you some money?',
    lastSeenTime: '5:15 AM',
    unreadmessages: 5,
    isOnline: false,
    address: '528  Moonlight Drive',
  ),
  BarberModel(
    id: 3,
    name: 'Veranda',
    image: 'assets/avatars/barber3.jpg',
    isFeatured: true,
    isSelected: false,
    position: 'Hair Stylist',
    haveunreadmessages: false,
    lastMessage: 'Okay thank you!',
    lastSeenTime: '6:55 AM',
    unreadmessages: 0,
    isOnline: true,
    address: '653  Quarry Drive',
  ),
  BarberModel(
    id: 4,
    name: 'Victor Black',
    image: 'assets/avatars/barber4.jpg',
    isFeatured: false,
    isSelected: false,
    position: 'Makup Artist',
    haveunreadmessages: false,
    lastMessage: 'Affirmative sir!',
    lastSeenTime: '8:02 AM',
    unreadmessages: 0,
    isOnline: true,
    address: '4474  Kimberly Way',
  ),
  BarberModel(
    id: 5,
    name: 'Mike Tyson',
    image: 'assets/avatars/barber5.jpg',
    isFeatured: false,
    isSelected: false,
    position: 'Jr. Barber',
    haveunreadmessages: false,
    lastMessage: 'Ah, i see you in my heart',
    lastSeenTime: '12:55 PM',
    unreadmessages: 0,
    isOnline: false,
    address: '3285  Old Dear Lane',
  ),
];
