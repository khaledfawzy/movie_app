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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movies.title!, style: AppStyles.textStyle16),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Text(
                movies.releaseDate.toString().split('-')[0],
                style: AppStyles.textStyle12
                    .copyWith(color: AppColors.greyLightColor),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                convertMinutesToHoursAndMinutes(movies.time ?? 0),
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

String convertMinutesToHoursAndMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  return '${hours}h ${minutes}m';
}
