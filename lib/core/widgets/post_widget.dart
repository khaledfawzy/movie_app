import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MoviePoster extends StatelessWidget {
  final MovieModel movie;
  final double height;
 final double aspectRatio;


  const MoviePoster({super.key, required this.movie, required this.height, required this.aspectRatio});

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
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
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
                width: 32,
                height: 50,
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
