import 'dart:developer';

import 'package:digshow/presentation/controllers/contest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/kontes.dart';
import '../../theme/base_text.dart';
import '../../theme/color.dart';
import '../../utils/app_constants.dart';
import '../widgets/button_select_category.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/item_card.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  final controller = Get.put(ContestController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new,
                        color: ColorName.blackColor),
                    Text(
                      "Kontes",
                      style: BaseText.blackTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      buildFilterBottomSheet(context),
                      Flexible(
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectedCategory.length,
                            itemBuilder: (context, index) {
                              var category = controller.selectedCategory[index];

                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: ColorName.grey2Color)),
                                child: Text(category),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Semua kontes",
                      style: BaseText.blackTextStyle
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: constraint.maxHeight,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: listOfKontesTerbaru.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        var kontes = listOfKontesTerbaru[index];

                        return buildItemCard(kontes);
                      }),
                )
              ],
            ),
          ),
        );
      }),
    ));
  }

  Widget buildFilterBottomSheet(BuildContext context) {
    return InkWell(
      onTap: () =>
          customBottomSheet(context, StatefulBuilder(builder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: ColorName.blackColor,
                      )),
                  Text(
                    "Filters",
                    style: BaseText.blackTextStyle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Divider(),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Wrap(
                  // spacing: 10,
                  // runSpacing: 10,
                  children: controller.listCategories.map<Widget>((e) {
                    return Obx(
                      () => ButtonSelectCategory(
                          height: 35,
                          width: 88,
                          e,
                          isSelected: controller.selectedCategory.contains(e),
                          onTap: () {
                        onSelectGenre(e);
                      }),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        );
      })),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: ColorName.grey2Color)),
        child: Obx(
          () => Row(
            children: [
              Image.asset(AppImages.filter, height: 15, width: 15),
              Visibility(
                visible: controller.listCategories.isNotEmpty ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: Center(
                        // padding: const EdgeInsets.all(4.0),
                        child: Text(
                          controller.selectedCategory.length.toString(),
                          style: BaseText.whiteTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSelectGenre(String category) {
    if (controller.selectedCategory.contains(category)) {
      controller.selectedCategory.remove(category);
      controller.update();
      log(controller.selectedCategory
          .map((element) => element)
          .toList()
          .toString());
    } else {
      if (controller.selectedCategory.length < 5) {
        controller.selectedCategory.add(category);
        controller.update();
        log(controller.selectedCategory
            .map((element) => element)
            .toList()
            .toString());
      }
    }
  }
}
