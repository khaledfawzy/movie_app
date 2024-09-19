import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/manager/recomended_cubit/recommended_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/recommended_movies_item.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/movie_model.dart';

class RecommendedMoviesSection extends StatelessWidget {
  const RecommendedMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Recommended",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: BlocBuilder<RecommendedCubit, RecommendedState>(
              builder: (context, state) {
                if (state is RecommendedSuccessState) {
                  return ListView.builder(
                      itemCount: state.recommendedList.length,
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
                                          state.recommendedList[index].id!),
                                ),
                              );
                            },
                            child: RecommendedMoviesItem(
                              movies: state.recommendedList[index],
                            ),
                          ),
                        );
                      });
                } else if (state is RecommendedFailureState) {
                  return Center(
                    child: Text(state.error),
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
    );
  }
}
