import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MoviePoster extends StatelessWidget {
  final MovieModel movie;
  final double height;
  final double aspectRatio;

  const MoviePoster(
      {super.key,
      required this.movie,
      required this.height,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      // width: 125,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: movie.posterPath != null
                      ? CachedNetworkImageProvider(
                          '$baseImageUrl${movie.posterPath}',
                        )
                      : const AssetImage('assets/images/poster.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 27,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/icons/bookmark_add.png"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
