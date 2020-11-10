import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../helpers/colors.dart';
import '../../helpers/toast.dart';
import '../../models/review_model.dart';
import '../../models/salon_model.dart';
import '../../screens/review_page.dart';
import '../review_card_widget.dart';

class BarberTabBarView extends StatefulWidget {
  const BarberTabBarView({
    Key key,
    this.salon,
  }) : super(key: key);

  final SalonModel salon;

  @override
  _BarberTabBarViewState createState() => _BarberTabBarViewState();
}

class _BarberTabBarViewState extends State<BarberTabBarView> {
  TextEditingController commentCtrl = TextEditingController();
  double reviewRating = 0.0;
  String reviewComment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          addCommentForm(context),
          reviewList(context),
        ],
      ),
    );
  }

  addCommentForm(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 25.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Write your Review', style: theme.textTheme.bodyText2),
              SmoothStarRating(
                color: kYellowColor,
                onRated: (rating) {
                  reviewRating = rating;
                },
                borderColor: theme.unselectedWidgetColor,
                allowHalfRating: false,
                rating: reviewRating,
                starCount: 5,
                isReadOnly: false,
                size: 25,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.primaryColor),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatars/barber5.jpg'),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(left: 18.0, bottom: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
//                    color: theme.accentColor,
                  ),
                  child: Center(
                    child: TextField(
                      cursorColor: theme.primaryColor,
                      controller: commentCtrl,
                      onChanged: (value) {
                        reviewComment = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Leave your experience...',
                        hintStyle: theme.textTheme.subtitle2,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0, top: 12.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 70.0,
              height: 30.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {
                  if (reviewComment == '') {
                    toast('Please fill your review');
                    return;
                  }
//                  final submitComment = ReviewModel(
//                    username: 'Jessica',
//                    description: reviewComment,
//                    rating: reviewRating,
//                    createdAt: DateTime.now(),
//                    userImage: 'assets/images/barber5.jpg',
//                  );
//                  sendReviewToSalon(submitComment);
                  setState(() {
                    reviewRating = 0;
                    reviewComment = '';
                    commentCtrl.clear();
                  });
                },
                child: Center(
                  child: Text('Post', style: theme.textTheme.button),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  reviewList(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5.0),
          Divider(color: theme.accentColor),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              Get.to(ReviewPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text('All Reviews ', style: theme.textTheme.subtitle1),
                  Text('(4)', style: theme.textTheme.subtitle2),
                ],
              ),
            ),
          ),
          ListView.builder(
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
        ],
      ),
    );
  }

  showActionReview(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Delete this review?',
              style: Theme.of(context).textTheme.bodyText2),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        );
      },
    );
  }
}
