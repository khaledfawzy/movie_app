import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class BackgroundImageStack extends StatelessWidget {
  const BackgroundImageStack({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: '$baseImageUrl${movie.backdropPath}',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.20,
          fit: BoxFit.fill,
        ),
        Image.asset(
          "assets/icons/play_icon.png",
          height: 40.h,
        ),
      ],
    );
  }
}