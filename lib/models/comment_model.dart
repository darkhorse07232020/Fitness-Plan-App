class CommentModel {
  final String username;
  final String image;
  final String comment;
  final DateTime createdAt;

  CommentModel({this.username, this.image, this.comment, this.createdAt});
}

List<CommentModel> allCommentList = [
  CommentModel(
    username: 'Shirohige',
    image: 'assets/avatars/barber1.jpg',
    comment: 'Lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
  CommentModel(
    username: 'Shanks',
    image: 'assets/avatars/barber2.jpg',
    comment: 'Lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
  CommentModel(
    username: 'Veranda',
    image: 'assets/avatars/barber3.jpg',
    comment: 'Lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
  CommentModel(
    username: 'Monkey D Garp',
    image: 'assets/avatars/barber4.jpg',
    comment: 'Lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
  CommentModel(
    username: 'Kizaru',
    image: 'assets/avatars/barber5.jpg',
    comment: 'Lorem ipsum dolor sit amet',
    createdAt: DateTime.now(),
  ),
];
