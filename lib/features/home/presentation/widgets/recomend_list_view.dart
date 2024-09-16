import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/movie_model.dart';
import 'movie_recomended_movie_item.dart';

class RecomendedMoviesSection extends StatelessWidget {
  const RecomendedMoviesSection({
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
            SizedBox(height:10.h,),
          Expanded(
            child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: MovieRecomendedMovieItem(movies: movies[index],
                     ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
