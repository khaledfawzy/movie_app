import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/post_widget.dart';
import '../../data/models/movie_model.dart';

class MovieRecommendedMovieItem extends StatelessWidget {
  final MovieModel movies;

  const MovieRecommendedMovieItem({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: const BoxDecoration(
          color: AppColors.cardDarkColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MoviePoster(
              aspectRatio: 70 / 80,
              movie: movies,
              height: 160.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      movies.voteAverage.toString(),
                      style: AppStyles.textStyle12,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    movies.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.textStyle10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movies.releaseDate.toString().split('-')[0],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.textStyle10,
                      ),
                      Text(
                        "  1 h 30 m",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.textStyle10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
