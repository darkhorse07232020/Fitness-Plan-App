
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/gallery_model.dart';
import 'comment_page.dart';



class GalleryDetailPage extends StatefulWidget {
  final GalleryModel gallery;
//  final SalonModel salon;
  final VideoPlayerController controller;

  const GalleryDetailPage({
    Key key,
    this.gallery,
    this.controller,
//    this.salon,
  }) : super(key: key);

  @override
  _GalleryDetailPageState createState() => _GalleryDetailPageState();
}

class _GalleryDetailPageState extends State<GalleryDetailPage> {
  ChewieController _chewieController;
  bool _imageClicked = false;

  @override
  void initState() {
    super.initState();
    widget.gallery.isImage
        ? print('')
        : _chewieController = ChewieController(
            videoPlayerController: widget.controller,
            aspectRatio: 16 / 8,
            autoInitialize: true,
            looping: true,
            autoPlay: true,
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Text(
                  errorMessage,
                ),
              );
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
    widget.gallery.isImage ? print('') : widget.controller.dispose();
    widget.gallery.isImage ? print('') : _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.gallery.isImage
                  ? swiperImage(context, gallery: widget.gallery)
                  : swiperVideo(context),
              SizedBox(height: 20.0),
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/other/1.jpg'),
                ),
                title: Text('Monkey D Luffy', style: theme.textTheme.bodyText2),
                subtitle: Text('25 min ago', style: theme.textTheme.subtitle2),
                trailing: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: 80.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dialogContent('Report'),
                                dialogContent('Hide this post'),
                                dialogContent('Share to..'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.more_horiz),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconGallery(
                      icon: widget.gallery.isLiked
                          ? Icons.favorite
                          : FlutterIcons.heart_fea,
                      color: widget.gallery.isLiked
                          ? theme.errorColor
                          : theme.unselectedWidgetColor,
                      onTap: () {
                        if (widget.gallery.isLiked == false) {
                          setState(() {
                            widget.gallery.isLiked = true;
                          });
                        } else {
                          setState(() {
                            widget.gallery.isLiked = false;
                          });
                        }
                      },
                    ),
                    iconGallery(
                      icon: FlutterIcons.message_circle_fea,
                      color: theme.unselectedWidgetColor,
                      onTap: () {
                        Get.to(CommentPage());
                      },
                    ),
                    iconGallery(
                      icon: FlutterIcons.upload_fea,
                      color: theme.unselectedWidgetColor,
                      onTap: () {
                        _newTaskModalBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('12.200 likes', style: theme.textTheme.bodyText2),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(widget.gallery.description,
                    style: theme.textTheme.subtitle1),
              ),
              SizedBox(height: 15.0),

            ],
          ),
        ),
      ),
    );
  }

  Container swiperVideo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Screen.width(context),
      height: 250.0,
      child: Swiper(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        autoplay: false,
        loop: false,
        autoplayDelay: 5000,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            size: 7.0,
            activeColor: theme.primaryColor,
            color: theme.unselectedWidgetColor,
            activeSize: 7.0,
          ),
        ),
        itemBuilder: (context, index) {
          return Chewie(
            controller: _chewieController,
          );
        },
      ),
    );
  }

  Container swiperImage(BuildContext context, {GalleryModel gallery}) {
    final theme = Theme.of(context);
    return Container(
      width: Screen.width(context),
      height: 230.0,
      child: Swiper(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        autoplay: false,
        autoplayDelay: 5000,
        loop: false,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              size: 7.0,
              activeColor: theme.primaryColor,
              color: theme.unselectedWidgetColor,
              activeSize: 7.0,
            )),
        itemBuilder: (context, index) {
//          var image = product.images[index];
          return Stack(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_imageClicked == false) {
                      setState(() {
                        _imageClicked = true;
                      });
                    } else {
                      setState(() {
                        _imageClicked = false;
                      });
                    }
                  },
                  child: Image.asset(
                    gallery.file,
                    height: 250.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              _imageClicked
                  ? Positioned(
                      top: 50.0,
                      left: 120.0,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
//                              color: kBackgroundColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('T-shorts',
                                      style: theme.textTheme.headline4),
                                  Text('Zara black t-shirt',
                                      style: theme.textTheme.headline5),
                                ],
                              ),
                            ),
                            Center(
                              child: Icon(Entypo.chevron_down),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }

  iconGallery({IconData icon, Color color, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color),
    );
  }

  dialogContent(String title) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  void _newTaskModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('SHARE TO',
                    style: Theme.of(context).textTheme.headline1),
              )),
              Divider(color: Theme.of(context).unselectedWidgetColor),
              SizedBox(height: 25.0),
              Expanded(
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  children: [
                    shareItem(
                      icon: FlutterIcons.contacts_mdi,
                      title: 'Friends',
                      color: 0xFF36C3B9,
                      onTap: () {},
                    ),
                    shareItem(
                      icon: FlutterIcons.facebook_ent,
                      title: 'Facebook',
                      color: 0xFF225BD9,
                      onTap: () {},
                    ),
                    shareItem(
                      icon: FlutterIcons.facebook_messenger_mco,
                      title: 'Messenger',
                      color: 0xFF1190FE,
                      onTap: () {},
                    ),
                    shareItem(
                      icon: FlutterIcons.message_ent,
                      title: 'Message',
                      color: 0xFF43D559,
                      onTap: () {},
                    ),
                    shareItem(
                      icon: FlutterIcons.mail_mdi,
                      title: 'Email',
                      color: 0xFFEA403E,
                      onTap: () {},
                    ),
                    shareItem(
                      icon: FlutterIcons.pinterest_faw,
                      title: 'Pinterest',
                      color: 0xFFB50A1A,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InkWell shareItem({
    @required IconData icon,
    @required String title,
    @required Function onTap,
    @required int color,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Color(color),
              child: Icon(icon, color: kBackgroundLightColor),
            ),
            SizedBox(height: 13.0),
            Text(
              title,
              style: theme.textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
