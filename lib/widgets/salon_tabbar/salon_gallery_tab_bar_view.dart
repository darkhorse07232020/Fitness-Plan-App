import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/gallery_model.dart';
import '../../models/salon_model.dart';
import '../gallery_card_widget.dart';

class GalleryTabBarView extends StatelessWidget {
  const GalleryTabBarView({
    Key key,
    this.salon,
  }) : super(key: key);

  final SalonModel salon;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: allGalleryList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
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
    );
  }
}
