import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/post_widget.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/vote_widget.dart';

import '../../../../core/utils/media_query_utils.dart';

class BrowseResultItem extends StatelessWidget {
  const BrowseResultItem({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MoviePoster(
          movie: movieModel,
          height: 90.h,
          aspectRatio: 8 / 11.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: MediaQueryUtils.getWidthPercentage(context, 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieModel.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text(movieModel.releaseDate.toString().split('-')[0],
                    style:
                        const TextStyle(fontSize: 14, color: Colors.white54)),
                const SizedBox(height: 8),
                VoteWidget(movie: movieModel)
              ],
            ),
          ),
        )
      ],
    );
  }
}
