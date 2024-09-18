import 'dart:ui'; // لإضافة تأثير البلور
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/browse/data/models/genre_model.dart';

class BrowseItemWidget extends StatelessWidget {
  final GenreModel genres;
  const BrowseItemWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: containerWidth,
      // height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Image.asset(
                genres.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                genres.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


