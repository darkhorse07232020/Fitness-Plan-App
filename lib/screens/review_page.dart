import 'package:flutter/material.dart';

import '../models/review_model.dart';
import '../widgets/review_card_widget.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('All reviews', style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allReviewList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        reverse: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        itemBuilder: (context, index) {
          var review = allReviewList[index];
          return GestureDetector(
            onTap: () {},
            child: ReviewCard(review: review),
          );
        },
      ),
    );
  }
}
