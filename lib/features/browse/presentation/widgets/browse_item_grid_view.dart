import 'package:flutter/material.dart';

import '../../data/models/general_model.dart';
import 'brower_item_widget.dart';

class BrowseItemGridView extends StatelessWidget {
  const BrowseItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,

    ),
      itemCount: genres.length,
      itemBuilder: (BuildContext context, int index) {
      return BrowseItemWidget(genres: genres[index]);
    },);
  }
}
