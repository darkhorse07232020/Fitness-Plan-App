class NotificationModel {
  final int id;
  final String title;
  final String description;
  final bool isOffer;
  final String date;
  final String time;

  NotificationModel(
      {this.id,
      this.title,
      this.description,
      this.isOffer,
      this.date,
      this.time});
}

List<NotificationModel> notificationList = [
  NotificationModel(
    id: 1,
    title: 'Best Offer for You',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    date: "June 15, 2014",
    time: "10:10 AM",
    isOffer: true,
  ),
  NotificationModel(
    id: 2,
    title: 'Recommended Salon',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    date: "July 17, 2015",
    time: "10:10 AM",
    isOffer: false,
  ),
  NotificationModel(
    id: 3,
    title: 'Product Summer Sale',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    date: "July 19, 2014",
    time: "10:10 AM",
    isOffer: true,
  ),
  NotificationModel(
    id: 4,
    title: 'Buy 1 Get 1',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    date: "June 15, 2014",
    time: "10:10 AM",
    isOffer: true,
  ),
];
