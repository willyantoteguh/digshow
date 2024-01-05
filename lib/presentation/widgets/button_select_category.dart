import 'package:digshow/theme/color.dart';
import 'package:flutter/material.dart';

class ButtonSelectCategory extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function onTap;

  const ButtonSelectCategory(
    this.text, {super.key, 
    this.isSelected = false,
    this.isEnabled = true,
    this.width = 144,
    this.height = 60,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
                },
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (!isEnabled)
                  ? const Color(0xFFE4E4E4)
                  : isSelected
                      ? ColorName.blackColor
                      : Colors.transparent,
              border: Border.all(
                  color: (!isEnabled)
                      ? const Color(0xFFE4E4E4)
                      : isSelected
                          ? Colors.transparent
                          : const Color(0xFFE4E4E4))),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : ColorName.blackColor),
          )),
        ));
  }
}
