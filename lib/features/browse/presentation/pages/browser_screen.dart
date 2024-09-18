import 'package:flutter/material.dart';

import '../widgets/browse_item_grid_view.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Expanded(child: BrowseItemGridView()),
      ],
    ));
  }
}
