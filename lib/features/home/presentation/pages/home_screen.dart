import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/movie_recomended_movie_item.dart';
import '../widgets/new_releases_section.dart';
import '../widgets/popular_movie_carousel_slider.dart';
import '../widgets/recomend_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PopularMovieCarouselSlider(),
            SizedBox(
              height: 53.h,
            ),
            const NewReleasesSection(),
            SizedBox(
              height: 10.h,
            ),
            const RecomendedMoviesSection(),
            ],
        ),
      ),
    );
  }
}