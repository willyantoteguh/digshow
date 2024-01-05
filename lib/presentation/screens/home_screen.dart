import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digshow/data/model/category.dart';
import 'package:flutter/cupertino.dart';
import '../../data/model/kontes.dart';
import '../../utils/app_constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/base_text.dart';
import '../../theme/color.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCustomAppBar(),
                const SizedBox(height: 16),
                CarouselSlider(
                  items: listOfBanners.map<Widget>((e) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(e)),
                    );
                  }).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      initialPage: 0,
                      height: 128.0,
                      // viewportFraction: 1.5,
                      scrollDirection: Axis.horizontal,
                      // aspectRatio: 16/9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;

                          log(current.toString());
                        });
                      }),
                ),
                DotsIndicator(
                  dotsCount: listOfBanners.length,
                  position: current,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kontes terbaru",
                            style: BaseText.blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Lihat Semua",
                            style: BaseText.appTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfKontesTerbaru.length,
                            itemBuilder: (context, index) {
                              var kontes = listOfKontesTerbaru[index];

                              return buildItemCard(kontes);
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listCategories.length,
                      itemBuilder: (context, index) {
                        var category = listCategories[index];

                        return buildCustomCategory(
                          title: category.label,
                          icon: category.icon,
                        );
                      }),
                ),
                const SizedBox(height: 24),
                buildKontestanWeekSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildKontestanWeekSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kontestan of the week",
          style: BaseText.blackTextStyle
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          "List kontestan minggu ini",
          style: BaseText.greyHomeTextStyle
              .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 238,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildItemKontestanWeek();
            },
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorName.greyColor,
              border: Border.all(color: ColorName.grey2Color)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.trophy),
                      const SizedBox(width: 8),
                      Text(
                        "Leaderboard",
                        style: BaseText.blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    "Lihat Semua",
                    style: BaseText.appTextStyle
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              for (var e = 0; e <= 2; e++)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(AppImages.arrowUp),
                      Text(
                        "1",
                        style: BaseText.blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                            imageUrl: AppImages.lead1,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            height: 48,
                            width: 48),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Darshan Raval to perform in Dhaka",
                            style: BaseText.blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          FittedBox(
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.play_arrow_rounded,
                                        color: ColorName.grey2Color),
                                    Text(
                                      "1,45rb",
                                      style: BaseText.greyHomeTextStyle
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor: ColorName.grey2Color,
                                  ),
                                ),
                                Text(
                                  "Stephanie Jere",
                                  style: BaseText.greyHomeTextStyle
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              // title: ,
            ],
          ),
        )
      ],
    );
  }

  Widget buildItemKontestanWeek() {
    return Container(
      width: 136,
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://i1.sndcdn.com/artworks-000460738095-l8iq8x-t500x500.jpg",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 192,
                  width: 136,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: Row(
                    children: [
                      const Icon(Icons.play_circle_outline_rounded,
                          color: Colors.white, size: 12),
                      Text(
                        "521",
                        style: BaseText.whiteTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            "Rosé Made One Very Special Change To Her Solo Stage During Their Melbourne Stop",
            style: BaseText.blackTextStyle
                .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Container buildCustomCategory(
      {required String title, required IconData icon}) {
    return Container(
      height: 37,
      width: 110,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: ColorName.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: BaseText.whiteTextStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Icon(icon, color: Colors.white)
        ],
      ),
    );
  }

  List<String> listOfBanners = [
    AppImages.banner1,
    AppImages.banner1,
    AppImages.banner1,
  ];
}
