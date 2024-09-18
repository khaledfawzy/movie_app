import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/post_widget.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/presentation/widgets/background_image_stack.dart';
import '../widgets/overview_rating_category.dart';
import '../widgets/title and time widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movies;

  const MovieDetailsScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title!),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackgroundImageStack(
              movie: movies,
            ),
            TitleAndTimeWidget(
              movies: movies,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MoviePoster(
                    movie: movies,
                    height: 170.h,
                    aspectRatio: 80 / 130,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  OverviewRatingCategory(
                    movies: movies,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
