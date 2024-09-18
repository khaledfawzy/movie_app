import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/post_widget.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/background_image_stack.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/overview_rating_category.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/similar_list.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/title%20and%20time%20widget.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Text(movieModel.title!),
            ),
            BackgroundImageStack(
              movie: movieModel,
            ),
            TitleAndTimeWidget(
              movies: movieModel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MoviePoster(
                    movie: movieModel,
                    height: 170.h,
                    aspectRatio: 80 / 130,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  OverviewRatingCategory(
                    movies: movieModel,
                  )
                ],
              ),
            ),
             SimilarMoviesSection(movieId: movieModel.id!,)
          ],
        ),
      ),
    );
  }
}
