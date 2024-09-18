import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/watchlist/presentation/manager/watch_list_cubit/watch_list_cubit.dart';

class MoviePoster extends StatefulWidget {
  final MovieModel movie;
  final double height;
  final double aspectRatio;

  const MoviePoster(
      {super.key,
      required this.movie,
      required this.height,
      required this.aspectRatio});

  @override
  State<MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<MoviePoster> {
  @override
  Widget build(BuildContext context) {
    bool ifContain =
        movieBox.values.any((movieItem) => movieItem.id! == widget.movie.id!);
    return SizedBox(
      height: widget.height,
      // width: 125,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: widget.movie.posterPath != null
                      ? CachedNetworkImageProvider(
                          '$baseImageUrl${widget.movie.posterPath}',
                        )
                      : const AssetImage('assets/images/poster.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: BlocBuilder<WatchListCubit, WatchListState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    if (ifContain) {
                      BlocProvider.of<WatchListCubit>(context)
                          .removeMovieFromWatchList(widget.movie);
                    } else {
                      BlocProvider.of<WatchListCubit>(context)
                          .addMovieToWatchList(widget.movie);
                    }

                    setState(() {
                      ifContain = movieBox.values.any(
                          (movieItem) => movieItem.id! == widget.movie.id!);
                    });
                  },
                  child: Container(
                    width: 27,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ifContain
                            ? const AssetImage("assets/icons/bookmarked.png")
                            : const AssetImage("assets/icons/bookmark_add.png"),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
