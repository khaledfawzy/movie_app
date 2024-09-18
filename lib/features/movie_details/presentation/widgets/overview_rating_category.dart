import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/media_query_utils.dart';

class OverviewRatingCategory extends StatelessWidget {
  final MovieModel movies;

  const OverviewRatingCategory({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryUtils.getWidthPercentage(context, 0.50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              border: Border.all(
                color: AppColors.greyLightColor,
                // Change this to your desired color
                width: 1, // Adjust the width as needed
              ),
            ),
            child: const Center(child: Text("Action")),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            movies.overview!,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style:
                AppStyles.textStyle10.copyWith(color: AppColors.greyLightColor),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.yellowColor,
              ),
              Text(
                movies.voteAverage!.toStringAsFixed(1),
                style: AppStyles.textStyle16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
