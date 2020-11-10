import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/gallery_model.dart';
import '../models/salon_model.dart';
import '../widgets/gallery_card_widget.dart';


class GalleryPage extends StatelessWidget {
  final SalonModel salon;

  const GalleryPage({Key key, this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: allGalleryList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        itemBuilder: (BuildContext context, int index) {
          var gallery = allGalleryList[index];
          return GalleryCard(
            gallery: gallery,
            salon: salon,
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
