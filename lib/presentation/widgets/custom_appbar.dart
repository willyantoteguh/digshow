import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

Row buildCustomAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        AppImages.logo,
        height: 40,
      ),
      IntrinsicHeight(
        child: Row(
          children: [
            Image.asset(
              AppImages.mahkotaLogo,
              height: 24,
            ),
            const SizedBox(width: 16),
            const VerticalDivider(
              color: Colors.grey,
              //  thickness: 1,
            ),
            const SizedBox(width: 16),
            Image.asset(
              AppImages.comments,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 16),
            Image.asset(
              AppImages.alert,
              height: 18,
              width: 18,
            ),
          ],
        ),
      )
    ],
  );
}
