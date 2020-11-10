class ReviewModel {
  final String username;
  final double rating;
  final DateTime createdAt;
  final String userImage;
  final String description;

  ReviewModel({
    this.username,
    this.rating,
    this.createdAt,
    this.userImage,
    this.description,
  });
}

List<ReviewModel> allReviewList = [
  ReviewModel(
    username: 'Roronoa Zoro',
    rating: 5.0,
    createdAt: DateTime.now(),
    description: 'Lorem ipsum dolor sit amet',
    userImage: 'assets/avatars/barber1.jpg',
  ),
  ReviewModel(
    username: 'God Usopp',
    rating: 4.0,
    createdAt: DateTime.now(),
    description: 'Lorem ipsum dolor sit amet',
    userImage: 'assets/avatars/barber2.jpg',
  ),
  ReviewModel(
    username: 'Dorobo neko',
    rating: 3.0,
    createdAt: DateTime.now(),
    description: 'Lorem ipsum dolor sit amet',
    userImage: 'assets/avatars/barber3.jpg',
  ),
  ReviewModel(
    username: 'Ichiji',
    rating: 2.0,
    createdAt: DateTime.now(),
    description: 'Lorem ipsum dolor sit amet',
    userImage: 'assets/avatars/barber4.jpg',
  ),
];
