import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/utils/setup_serv_locator.dart';
import 'package:movie_app/core/utils/simple_bloc_observer.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  movieBox = await Hive.openBox(kMovieBox);
  setupServicesLocator();
  Bloc.observer = SimpleBlocObserver();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const MovieApp());
}
