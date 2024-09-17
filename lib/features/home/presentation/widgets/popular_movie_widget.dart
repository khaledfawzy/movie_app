import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/utils/media_query_utils.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
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
      width: double.infinity,
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            imageUrl: '$baseImageUrl${movie.backdropPath}',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.20,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/play_icon.png",
              ),
            ),
          ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title!,
                        style: AppStyles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate!.split('-')[0],
                            style: AppStyles.textStyle14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          VoteWidget(movie: movie,)
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
