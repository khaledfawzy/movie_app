import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/watchlist/presentation/manager/watch_list_cubit/watch_list_cubit.dart';
import 'package:movie_app/features/watchlist/presentation/widgets/watch_list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Your Watchlist',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            movieBox.isEmpty
                ? const Center(
                    child: Text('No Data in WatchList'),
                  )
                : Expanded(
                    child: BlocBuilder<WatchListCubit, WatchListState>(
                      builder: (context, state) {
                        if (state is WatchListFetchSuccessState) {
                          return ListView.separated(
                            separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(),
                            ),
                            itemCount: state.watchList.length,
                            itemBuilder: (context, index) => WatchListItem(
                                movieModel: state.watchList[index]),
                          );
                        } else if (state is WatchListFailureState) {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        } else {
                          return Skeletonizer(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) =>
                                  WatchListItem(movieModel: movies[index]),
                            ),
                          );
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
