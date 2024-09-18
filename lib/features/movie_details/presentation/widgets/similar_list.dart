import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/recommended_movies_item.dart';
import 'package:movie_app/features/movie_details/data/repos/similar_repo.dart';
import 'package:movie_app/features/movie_details/presentation/manager/cubit/similar_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarCubit(
        SimilarRepoImpl(getIt<ApiServices>()),
      )..fetchSimilarMovies(movieId),
      child: Container(
        // width: double.infinity,
        height: 220.h,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        color: AppColors.darkColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "More Like This",
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: BlocBuilder<SimilarCubit, SimilarState>(
                builder: (context, state) {
                  if (state is SimilarSuccessState) {
                    return ListView.builder(
                        itemCount: state.similarMoviesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(
                                        movieId:
                                            state.similarMoviesList[index].id!),
                                  ),
                                );
                              },
                              child: RecommendedMoviesItem(
                                movies: state.similarMoviesList[index],
                              ),
                            ),
                          );
                        });
                  } else if (state is SimilarFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return Skeletonizer(
                      child: ListView.builder(
                          itemCount: movies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: RecommendedMoviesItem(
                                movies: movies[index],
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
