import 'package:digshow/presentation/screens/dashboard_screen.dart';
import 'package:digshow/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/base_text.dart';
import '../../theme/color.dart';
import '../../utils/app_constants.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundAuth), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Right place for talent",
                  style: BaseText.whiteTextStyle
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(
                AppConstants.contentAuth,
                style: BaseText.whiteTextStyle
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey.shade400),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: () => Get.to(() => const DashboardPage()),
                color: ColorName.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  "Get Started",
                  style: BaseText.whiteTextStyle.copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.googleLogo),
                    const SizedBox(width: 9),
                    Text(
                      "Masuk dengan google",
                      style: BaseText.blackTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.white),
              const SizedBox(height: 16),
              RichText(
                  text: TextSpan(
                      text: "Sudah punya akun? ",
                      style: BaseText.whiteTextStyle.copyWith(fontSize: 14),
                      children: [
                    TextSpan(
                        text: "Login",
                        style: BaseText.appTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700))
                  ]))
            ],
          ),
        );
      }),
    );
  }
}
