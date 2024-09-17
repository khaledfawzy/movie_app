import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/widgets/post_widget.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class RecommendedMoviesItem extends StatelessWidget {
  const RecommendedMoviesItem({super.key, required this.movies});
  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardDarkColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          MoviePoster(
            movie: movies,
            height: 150.h,
            aspectRatio: 70 / 100,
          ),
          SizedBox(height: 10.h),
          Text(
            'Recommended Movies',
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
