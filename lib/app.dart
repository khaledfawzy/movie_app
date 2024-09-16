import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/layout/home_layout.dart';
import 'core/utils/app_theme.dart';
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
         designSize: const Size(360,690),
        minTextAdapt: true,
        splitScreenMode: true,
      child: MaterialApp(
      theme: AppTheme.mainTheme, // Apply dark theme
       debugShowCheckedModeBanner: false,
      title: 'Movies',

      home:  HomeLayout(),
    ));
  }
}
