class SalonModel {
  final int id;
  final String name;
  final String address;
  final double rating;
  final String image;
  final int totalReview;
  final bool isOpen;
  final String about;
//  final List<GalleryModel> gallery;
//  final List<ReviewModel> reviews;
//  final List<ProductModel> products;

  SalonModel({
    this.id,
    this.name,
    this.address,
    this.rating,
    this.image,
    this.totalReview,
    this.isOpen,
    this.about,
//    this.gallery,
//    this.reviews,
//    this.products,
  });
}

List<SalonModel> allSalonList = [
  SalonModel(
    id: 1,
    name: 'Game Day Barber',
    address: '26260, Mia Lakes, West Carissaton, Jersey',
    rating: 4.3,
    image: 'assets/images/other/salon1.jpg',
    about:
        'Reprehenderit assumenda sunt. Fuga qui ad nemo eos cum sit. Qui sed neque sapiente et sed animi nesciunt. Voluptates nesciunt quia incidunt pariatur.',
    isOpen: true,
    totalReview: 25,
  ),
  SalonModel(
    id: 2,
    name: 'Straight Razors',
    address: '60806, Bergstrom Mountains, South Nakiaburgh, Jersey',
    rating: 4.3,
    image: 'assets/images/other/salon2.jpg',
    about: 'Accusamus ea nihil qui fugiat. Quo repudiandae adipisci.',
    isOpen: true,
    totalReview: 25,
  ),
  SalonModel(
    id: 3,
    name: 'Bulls & Barbers',
    address: '36558, Dooley Hill, West Parker, Kenya',
    rating: 4.5,
    image: 'assets/images/other/salon3.jpg',
    about: 'Qui aspernatur aliquid sed aperiam iste.',
    isOpen: true,
    totalReview: 25,
  ),
  SalonModel(
    id: 4,
    name: 'Hi-Rollers Barbershop',
    address: '26403, Reynolds Glen, North Geraldinemouth, USA',
    rating: 4.2,
    image: 'assets/images/other/salon4.jpg',
    about:
        'Incidunt cum tempora consectetur laborum consequatur laborum qui cupiditate deleniti. Placeat possimus amet aut aut hic non. Corporis qui mollitia delectus quos et magni. Nam fuga dolor eos totam vel hic. In consequuntur est accusamus qui.',
    isOpen: false,
    totalReview: 12,
  ),
  SalonModel(
    id: 5,
    name: 'The Fade Shop',
    address: '07586, Douglas Lodge, Langworthland, Paraguay',
    rating: 4.3,
    image: 'assets/images/other/salon5.jpg',
    about:
        'Reprehenderit iusto eligendi enim rem repudiandae perferendis et velit alias. Eos soluta vero corporis in sunt.',
    isOpen: true,
    totalReview: 25,
  ),
];
