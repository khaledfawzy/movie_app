import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/manager/new_release_cubit/new_release_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/post_widget.dart';
import '../../data/models/movie_model.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      width: double.infinity,
      height: 180.h,
      color: AppColors.darkColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "New Releases",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Expanded(
            child: BlocBuilder<NewReleaseCubit, NewReleaseState>(
              builder: (context, state) {
                if (state is NewReleaseSuccessState) {
                  return ListView.builder(
                    itemCount: state.newReleaseMoviesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: InkWell(
                          onTap: () {
                            // Navigate to movie details page with movie id
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                    movieId:
                                        state.newReleaseMoviesList[index].id!),
                              ),
                            );
                          },
                          child: MoviePoster(
                            movie: state.newReleaseMoviesList[index],
                            height: 150.h,
                            aspectRatio: 70 / 100,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is NewReleaseFailureState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                    ),
                  );
                } else {
                  return Skeletonizer(
                    child: ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MoviePoster(
                            movie: movies[index],
                            height: 150.h,
                            aspectRatio: 70 / 100,
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
