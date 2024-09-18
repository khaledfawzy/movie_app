import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/widgets/post_widget.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/vote_widget.dart';

class RecommendedMoviesItem extends StatelessWidget {
  const RecommendedMoviesItem({super.key, required this.movies});
  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.2 / 6,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePoster(
              movie: movies,
              height: 106.h,
              aspectRatio: 5.3 / 6,
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VoteWidget(movie: movies),
                    SizedBox(height: 4.h),
                    Expanded(
                      child: Text(
                        movies.originalTitle ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      movies.releaseDate!.split('-')[0],
                      style: TextStyle(fontSize: 12.sp, color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
