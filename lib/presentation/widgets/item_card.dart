import 'package:flutter/material.dart';

import '../../data/model/kontes.dart';
import '../../theme/base_text.dart';

SizedBox buildItemCard(Kontes kontes) {
  return SizedBox(
    width: 145,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(kontes.imgPath,
              height: 82, width: 140, fit: BoxFit.cover),
          Text(
            kontes.title,
            maxLines: 2,
            style: BaseText.blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            kontes.rewards,
            style: BaseText.greyHomeTextStyle.copyWith(fontSize: 12),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(kontes.partnerImgPath, height: 12, width: 12),
              const SizedBox(width: 8),
              Text(
                kontes.partner,
                style: BaseText.greyHomeTextStyle.copyWith(fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    ),
  );
}
