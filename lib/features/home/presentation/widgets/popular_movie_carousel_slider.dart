import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movie_widget.dart';

import '../../data/models/movie_model.dart';

class PopularMovieCarouselSlider extends StatelessWidget {
  const PopularMovieCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 170.h,
      child: CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, index, realIndex) {
          return PopularMovieCarouselItem(movie: movies[index]);
        },
        options: CarouselOptions(
          enlargeCenterPage: true,
          pageSnapping: false,
          padEnds: false,
          viewportFraction: 1,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          // enlargeFactor: 0.5,
          clipBehavior: Clip.none,
          height: 200.h,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
