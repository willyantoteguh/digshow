import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context, Widget widget) {
  return showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      )),
      builder: (context) => widget);
}
