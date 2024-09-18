import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../home/data/models/movie_model.dart';

class TitleAndTimeWidget extends StatelessWidget {
  final MovieModel movies;

  const TitleAndTimeWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movies.title!),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                movies.releaseDate.toString(),
                style: AppStyles.textStyle12
                    .copyWith(color: AppColors.greyLightColor),
              ),
              SizedBox(width: 10.w,),
              Text(
                movies.releaseDate.toString(),
                style: AppStyles.textStyle12
                    .copyWith(color: AppColors.greyLightColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
