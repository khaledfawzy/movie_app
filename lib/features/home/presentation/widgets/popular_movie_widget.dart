import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/utils/media_query_utils.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/background_image_stack.dart';
import 'package:movie_app/features/home/presentation/widgets/vote_widget.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/post_widget.dart';

class PopularMovieCarouselItem extends StatelessWidget {
  final MovieModel movie;

  const PopularMovieCarouselItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryUtils.getScreenWidth(context),
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BackgroundImageStack(movie: movie),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.07 * -1,
            right: 0,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MoviePoster(
                  aspectRatio: 70 / 100,
                  height: 150.h,
                  movie: movie,
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: MediaQueryUtils.getHeightPercentage(context, 0.09),
                  width: MediaQueryUtils.getWidthPercentage(context, 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.title!,
                        style: AppStyles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate!.split('-')[0],
                            style: AppStyles.textStyle12
                                .copyWith(color: Colors.white54),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          VoteWidget(
                            movie: movie,
                          )
                          // Text(
                          //   movie.popularity.toString(),
                          //   style: AppStyles.textStyle12,
                          //   overflow: TextOverflow.ellipsis,
                          //   maxLines: 4,
                          // ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// time format
// 128m to 2h 08m

// int totalMinutes = 128;

// int hours = totalMinutes ~/ 60; // Integer division to get hours
// int minutes = totalMinutes % 60; // Remainder gives minutes

// String formattedTime = "${hours}h${minutes.toString().padLeft(2, '0')}m";
// print(formattedTime); // Output: 2h08m



// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// movie.title!,
// style: AppStyles.textStyle14,
// overflow: TextOverflow.ellipsis,
// maxLines: 2,
// ),
// const SizedBox(
// height: 10,
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Text(
// movie.releaseDate!,
// style: AppStyles.textStyle14,
// overflow: TextOverflow.ellipsis,
//
// ),
// const SizedBox(
// width: 7,
// ),
// Text(
// movie.overview!,
// style: AppStyles.textStyle14,
// overflow: TextOverflow.ellipsis,
// maxLines: 1,
// ),
// const SizedBox(
// width: 7,
// ),
// Text(
// movie.voteAverage.toString(),
// style: AppStyles.textStyle14,
// overflow: TextOverflow.ellipsis,
// maxLines: 2,
// ),
// ],
// ),
// ),
// ],
// ),
// )
