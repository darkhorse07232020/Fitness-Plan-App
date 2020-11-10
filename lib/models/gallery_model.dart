class GalleryModel {
  final int id;
  final String description;
  final String thumbnail;
  final String file;
  bool isLiked;
  bool isImage;

  GalleryModel(
      {this.id,
      this.description,
      this.file,
      this.isImage,
      this.isLiked,
      this.thumbnail});
}

List<GalleryModel> allGalleryList = [
  GalleryModel(
    id: 1,
    description:
        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    file: 'assets/images/other/gallery1.jpg',
    thumbnail: 'assets/images/other/gallery1.jpg',
    isImage: true,
    isLiked: false,
  ),
  GalleryModel(
    id: 1,
    description:
        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    file: 'assets/videos/video1.mp4',
    thumbnail: 'assets/images/other/thumbnail1.jpg',
    isImage: false,
    isLiked: false,
  ),
  GalleryModel(
    id: 1,
    description:
        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    file: 'assets/images/other/gallery2.jpg',
    thumbnail: 'assets/images/other/gallery2.jpg',
    isImage: true,
    isLiked: false,
  ),
  GalleryModel(
    id: 1,
    description:
        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    file: 'assets/images/other/gallery3.jpg',
    thumbnail: 'assets/images/other/gallery3.jpg',
    isImage: true,
    isLiked: false,
  ),
  GalleryModel(
    id: 1,
    description:
        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    file: 'assets/images/other/gallery5.jpg',
    thumbnail: 'assets/images/other/gallery5.jpg',
    isImage: true,
    isLiked: false,
  ),
];
