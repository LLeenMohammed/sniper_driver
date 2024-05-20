import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';

class DriverRatingWidget extends StatelessWidget {
  final int rating; // تقييم السائق من 1 إلى 5

  DriverRatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: pink, 
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: black,
          width: 1.0, 
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: index < rating ? darkPurple : grey,
                 size: 30, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

