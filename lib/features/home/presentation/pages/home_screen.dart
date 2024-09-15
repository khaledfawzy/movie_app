import 'package:flutter/material.dart';

import '../../../../core/generated/assets.dart';
import '../../../../core/utils/color_manger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 299,
              width: 412,
              child: Stack(children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 217,
                    width: 412,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      Assets.imagesBackground,
                    ))),
                  ),
                  Positioned(
                    child: IconButton(
                      icon: const Icon(Icons.play_circle_fill,
                          size: 60, color: Colors.white),
                      onPressed: () {
                        // Handle play button press
                      },
                    ),
                  ),
                ]),
                Positioned(
                  bottom: -7,
                  left: 15,
                  child: Stack(children: [
                    Image.asset(
                      Assets.imagesDetailsImage,
                      fit: BoxFit.cover,
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
                                        image: AssetImage(
                                            "assets/icons/bookmark_add.png"))))))
                  ]),
                ),
                const Positioned(
                  bottom: -5,
                  left: 150,
                  child: SizedBox(
                    height: 90,
                    width: 230,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Dora and the lost city of gold",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " 2019  PG-13  2h 7m",
                              style: TextStyle(
                                  color: lightGrey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 187,
                width: 420,
                color: grey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Releases "),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
