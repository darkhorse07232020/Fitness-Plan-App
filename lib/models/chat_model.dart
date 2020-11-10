class ChatModel {
  final bool isByMe;
  final String message;
  final String sendTime;
  final bool isRead;
  final DateTime createdAt;

  ChatModel({this.isByMe, this.message,this.isRead,this.sendTime,this.createdAt});
}

List<ChatModel> chatList = [
  ChatModel(
      isByMe: true,
      message: 'Hey, how are you?',
      isRead: true,
      sendTime: "10:30 am"),
  ChatModel(
      isByMe: false,
      message: 'I\'m fine thankyou?',
      isRead: true,
      sendTime: "10:45 am"),
  ChatModel(
      isByMe: true,
      message: 'i want coloring my hair!',
      isRead: true,
      sendTime: "11:00 am"),
  ChatModel(
      isByMe: true,
      message: 'Can you do your best?',
      isRead: true,
      sendTime: "11:05 am"),
  ChatModel(
    isByMe: false,
    message: 'Of course.',
    isRead: true,
    sendTime: "12:30 pm",
  ),
  ChatModel(
    isByMe: true,
    message: 'Thank you!',
    isRead: false,
    sendTime: "12:45 pm",
  ),
  ChatModel(
    isByMe: true,
    message: 'I\'m so',
    isRead: false,
    sendTime: "12:45 pm",
  ),
  ChatModel(
    isByMe: true,
    message: 'Appreciate',
    isRead: false,
    sendTime: "12:45 pm",
  ),
];
